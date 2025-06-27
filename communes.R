# Traitement fichier CSV: communes_france_2025.csv
# R pur

villes <- read.csv(
    'data/communes_france_2025.csv',
    fileEncoding = 'UTF-8',
    colClasses = c(code_postal = 'character')
)
# read.csv('C:/Users/matth/Documents/Formation/R/Stage202506/data/communes_france_2025.csv')
# read.csv('C:\\Users\\matth\\Documents\\Formation\\R\\Stage202506\\data\\communes_france_2025.csv')

# répertoire de travail
getwd()

villes
summary(villes)

# Vérifier que la data a été chargée en tant que data.frame
typeof(villes) # list  (trop générique)
class(villes) # "data.frame"

length(villes) # nb colonnes
nrow(villes) # nb lignes
ncol(villes) # nb colonnes

# colonnes dep_code
villes$dep_code

# lignes filtrées, toutes les colonnes
villes[villes$dep_code == '69',]

# lignes filtrées + 1 colonne
villes[villes$dep_code == '69', 'nom_standard']

# lignes filtrées + plusieurs colonnes
extrait_villes_69 <- villes[
  villes$dep_code == '69', 
  c('code_insee', 'nom_standard', 'code_postal', 'population')
]

colnames(villes)
View(extrait_villes_69)

# tri sur la population (croissant)
extrait_villes_69 <- extrait_villes_69[order(extrait_villes_69$population),]

# tri sur la population (décroissant)
extrait_villes_69 <- extrait_villes_69[order(-extrait_villes_69$population),]

extrait_villes_69 <- extrait_villes_69[
  order(extrait_villes_69$code_postal, extrait_villes_69$nom_standard),
]

extrait_villes_69 <- extrait_villes_69[
  order(extrait_villes_69$nom_standard, decreasing = TRUE),
]

# Autres extraits
# - villes commençant par "L'"
# - villes commençant par "L'" ou "Le " ou "La "ou "Les "
# - villes commençant par "L'" ou "Le " ou "La "ou "Les " ET population >= 50_000

# solution avec startsWith
sel <- villes[
  # filtres de lignes
  (
    startsWith(villes$nom_standard, "L'")
    | startsWith(villes$nom_standard, "Le ")
    | startsWith(villes$nom_standard, "La ")
    | startsWith(villes$nom_standard, "Les ")
  )
  & (villes$population >= 30000),
  # choix de colonnes
  c("nom_standard", "population")
]
sel <- sel[order(-sel$population),]
rownames(sel) <- NULL

# solution avec grepl + pattern
sel2 <- villes[
  grepl("L'|Le |La |Les ", villes$nom_standard)
  & (villes$population >= 30000)
  , c("nom_standard", "population")
]
sel2 <- sel2[order(-sel2$population),]
rownames(sel2) <- NULL

villes[villes$nom_standard == 'Les Abymes', 'population']
villes[villes$nom_standard == 'Le Mans', 'population']



selection1 <- villes[grepl("L'|Le |La |Les ", villes$nom_standard),]

selection2 <- selection1[
  selection1$population > 30000, 
  c("nom_standard", "population")
]

# group by + stats
# 3 fonctions: 
# - agreggate (resultat: data.frame)
# - ??? (resultat est une liste nommée)
# - by (resultat intermediaire)

stats_pop_by_dep <- aggregate(population ~ dep_code, data = villes, FUN = sum)

stats_pop_by_dep <- aggregate(
  population ~ dep_code + dep_nom, 
  data = villes, 
  FUN = sum
)

stats_pop_area_by_dep <- aggregate(
  cbind(population, superficie_km2) ~ dep_code + dep_nom, 
  data = villes, 
  FUN = sum
)

stats_pop_area_by_dep$densite <- 
  stats_pop_area_by_dep$population / stats_pop_area_by_dep$superficie_km2
# nom dep en majuscule
stats_pop_area_by_dep$dep_nom <- toupper(stats_pop_area_by_dep$dep_nom)

# autre stat:
stats_pop_area_by_dep2 <- aggregate(
  cbind(population, superficie_km2) ~ dep_code + dep_nom, 
  data = villes, 
  FUN = mean
)

summary(villes)

mean(villes$population, na.rm = TRUE)

# appeler une fonction de stat avec 1 parametre supplementaire
stats_pop_area_by_dep2 <- aggregate(
  cbind(population, superficie_km2) ~ dep_code + dep_nom, 
  data = villes, 
  FUN = \(x) mean(x, na.rm = TRUE) # fonction anonyme
)

# vieux R: function(x) mean(x, na.rm = TRUE)
# en purr (.x variable par defaut):  ~ mean(.x, na.rm = TRUE)

mean(c(1, NA, 4)) # NA
mean(c(1, NA, 4), na.rm = TRUE) # 2.5


stats_pop_quantile <- aggregate(
  population ~ dep_code + dep_nom, 
  data = villes, 
  FUN = \(x) quantile(
      x, 
      c(0.25, 0.5, 0.75), 
      na.rm = TRUE
  ) 
)
# NB: produit des sous colonnes => 25%, 50%, 75%


# splitter la colonne 3 en 1 population en 3 colonnes différentes
# et renommer les colonnes
stats_pop_quantile <-  cbind(
  stats_pop_quantile,
  stats_pop_quantile$population
)
stats_pop_quantile$population <- NULL # delete colonne
colnames(stats_pop_quantile) <- c("dep_code", "dep_nom", "population_q1", "population_mediane", "population_q3")


stats_pop <- aggregate(
  population ~ dep_code + dep_nom, 
  data = villes, 
  FUN = \(x) c(
    min_pop = min(x),
    max_pop = max(x),
    mean_pop = mean(x),
    sum_pop = sum(x),
    count_pop = length(x)
  )
)

length(villes$code_postal) # 34935
length(unique(villes$code_postal)) # 6012 (count(distinct))

unique(villes$dep_code)
  

sel_villes <- c("Lyon", "Villeurbanne", "Vénissieux")
villes[villes$nom_standard %in% sel_villes, c('nom_standard','code_insee')]



temperatures <- data.frame(
  code_insee = c('69123',  '69266', '69259'),
  ville = c("Lyon", "Villeurbanne", "Vénissieux"),
  temperature = c(33, 34, 35)
)

nrow(extrait_villes_69) # 266

# jointure interne
merge(extrait_villes_69, temperatures, by='code_insee')

# jointure à gauche
villes69_temperature <- merge(
  extrait_villes_69, 
  temperatures, 
  by='code_insee', 
  all.x=TRUE
)

# jointures avec colonnes au nom different
temperatures2 <- temperatures
colnames(temperatures2)[1] <- 'insee'
temperatures2

villes69_temperature <- merge(
  extrait_villes_69, 
  temperatures2, 
  by.x='code_insee',
  by.y='insee',
  all.x=TRUE
)

# villes sans temperature
villes69_temperature[is.na(villes69_temperature$temperature),]

# villes avec temperature NOT = !
villes69_temperature[!is.na(villes69_temperature$temperature),]

# is.na sur pls colonnes (à combiner avec | &)
villes69_temperature[
  is.na(villes69_temperature$temperature)
  | is.na(villes69_temperature$ville),
]

write.table(villes69_temperature, file = 'data/villes69_temperature.csv', fileEncoding = 'UTF-8', sep=',')
write.table(villes69_temperature, file = 'data/villes69_temperature2.csv', fileEncoding = 'CP1252', sep=';', dec=',')

library(writexl) # openxlsx, xlsx, readxl
write_xlsx(villes69_temperature, "data/villes69_temperature.xlsx")

library(stringr)
str_starts("Lyon", "Ly")



