# Structure de données:
# - tableaux 
#   * array/vector
#   * matrice
# - liste
# - dataframes

# Array/Vector
villes <- c("Lyon", "Vénissieux", "Étoile d'Alaï", "L'Haÿ-les-Roses")
villes_u <- toupper(villes) # applique la function toupper à tout le tableau

# pour chaque ville, est-ce qu'elle contient un y (ou ÿ)
# pattern [yÿ] signifie 'y' ou 'ÿ'
positions_y <- grep("[yÿ]", villes) # 1 4
contains_y <- grepl("[yÿ]", villes) # TRUE FALSE FALSE TRUE

# Exemple recherche sensible ou pas aux patterns
grepl("a{2}", "dcba{2}") # FALSE (1er param est 1 Pattern)
grepl("a{2}", "dcba{2}", fixed = TRUE) # TRUE 

# Vocabulaire et test de patterns (reg101.com)

# selection par indice
villes[1] # Lyon (indice 1)
villes[c(1, 4)] # "Lyon" "L'Haÿ-les-Roses" (indice 1, 4)
villes[positions_y] # "Lyon" "L'Haÿ-les-Roses" (indice 1, 4)
villes[grep("[yÿ]", villes)]

# en dehors du tableau
villes[0]  # character(0)
villes[50] # NA
villes[c(0, 1, 4, 5, 6, 10)] # "Lyon" "L'Haÿ-les-Roses" NA NA NA 

# intervalle
villes[1:3] # aux indices 1 à 3
villes[2:length(villes)] # de l'indice 2 à la fin
villes[-1] # pas le #1
villes[c(-1, -3)] # pas les #1 et #3

nombres <- 1:1000 # nombres de 1 à 1000
nombres[c(200:400, 666)][-134]

c(1:5, 22L, 33L, 90:99)

# selection par logique (même taille de vecteur)
villes[contains_y] 
villes[grepl("[yÿ]", villes)]
villes[c(FALSE, FALSE, TRUE, TRUE)]

# villes commençant par L
villes[startsWith(villes, "L")]

# villes contenant plus de 10 lettres
villes[nchar(villes) >= 10]

# nombres > 100
nombres[nombres > 100]

# nombres pairs (ou impairs)
nombres[nombres %% 2L == 0L] # pairs
nombres[nombres %% 2L == 1L] # impairs

# nombres compris entre 100 (inclus) et 200 (inclus)
nombres[nombres %in% 100:200]

# nombres compris entre 100 (inclus) et 200 (inclus)
nombres[
  (nombres >= 100)
  & (nombres < 200)
]

# villes commençant par L de plus 10 lettres
villes[
  startsWith(villes, "L")
  & (nchar(villes) >= 10)
]

# operations entre tableau et scalaires
nombres * 3 / 4

nombres[333] <- 0
nombres[500:599] <- -1  # remplacer 100 valeurs par 1 (100x)
nombres[10:12] <- c(-10, -11, -12) # remplace 3 valeurs par 3
nombres[10] <- nombres[10] * 4
nombres

nombres[10] <-  3 / 4 # tout le tableau bascule en double
nombres[1] <- 1 / 3
nombres

nombres[seq(1L, 1000L, 100L)] # pas de 100
nombres[seq(from = 1L, to = 1000L, by = 100L)]

echelle <- seq(0, 6*pi, length.out = 1000)
length(echelle)

# Etonnant: 0.1 (base 10) = 0.00011001100110011... (base 2)
3 * 0.1 == .3 # FALSE
abs(3 * 0.1 - .3) <= 10E-14 # TRUE

array(1, dim = 100) # tableau de 100 valeurs toutes à 1
nombres_2d <- array(1:100, dim = c(10, 10)) # tableau 2D 
nombres_2d

# ligne 5, colonne 7
nombres_2d[5, 7] 

# lignes 5 à 7, colonnes 8 à 10
nombres_2d[5:7, 8:10]

# ligne 5
nombres_2d[5,]

# colonne 8
nombres_2d[,8]

#  66
nombres_2d[nombres_2d == 66]

# nombres contenant 6
nombres_2d[grep("6", nombres_2d)]

# nombres finissant par 6
nombres_2d[grep("6$", nombres_2d)]

# nombres commençant par 6
  nombres_2d[grep("^6", nombres_2d)]







