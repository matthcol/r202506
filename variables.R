ville <- "Lyon"  # type character
ville2 <- 'Pau'
temperature <- 32.5 # type double (nombre à virgule, exposant)
nombre_habitants <- 520774L # type integer

print(ville)
# ?print

# paste rassemble plusieurs éléments dans un seul texte
print(paste(ville, temperature))
print(paste(ville, temperature, sep = ", "))
print(paste("À", ville, "il fait", temperature, "°C"))
print(paste0("À ", ville, ", il fait ", temperature, "°C"))

print("Aujourd'hui")
print("Aujourd'hui, je dis \"R c'est bien non ?\"")
print("Aujourd'hui, je dis \"R c'est bien non ?\"", quote = FALSE)
print(temperature)

# Operations mathématiques
res <- (temperature * 0.9) + ((nombre_habitants - 2) / 10000)
print(res)

kilo <- 10^3
kilo_info <- 2^10
print(paste("Kilo (SI) =", kilo, "; Kilo (info) =", kilo_info))

print(nombre_habitants / 1000L) # division (on passe en double)
print(nombre_habitants %/% 1000L) # partie entière
print(nombre_habitants %% 1000L) # modulo
print(-temperature)

# Documentation fonctions de base de R
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html

# fonctions mathématiques
habitants_milliers_up <- ceiling(nombre_habitants / 1000)
habitants_milliers_down <- floor(nombre_habitants / 1000)
habitants_milliers_nearest <- round(nombre_habitants / 1000)

#?ceiling
print(round(nombre_habitants / 1000, digits = 2))

# Chaines de caracteres: operateurs et fonctions
print(toupper(ville)) # MAJ
print(tolower(ville)) # minuscule
print(nchar(ville))  # nombres de caractères
print(substr(ville, 1, 2))
print(substr(ville, 3, 4))

#?substr

ville2 <- 'Clermont-Ferrand'
print(substr(ville2, nchar(ville2)-6, nchar(ville2)))
print(substring(ville2, nchar(ville2)-6)) # jusqu'à la fin

# recherche
print(grep('Ferrand', ville2)) # => 1 (OK sur ce 1er mot) 
print(grep('Pont', ville2)) # => 0 (pas trouvé)
print(grepl('Ferrand', ville2)) # => TRUE
print(grepl('Pont', ville2)) # => FALSE


# recherche insensible à la casse
print(grep('ferrand', ville2, ignore.case = TRUE))

print(trimws("  Clermont-Ferrand      "))

print(sub("-", " ", ville2))

print(startsWith(ville2, 'C'))

# concaténation: paste, paste0
print(paste(ville, ": tablier de sapeur"))

# comparaisons
# - contenu: ==   !=
print(ville == 'Lyon') # TRUE
print(ville == 'lyon') # FALSE
print(ville != 'Lyon') # FALSE
# - ordre:  <  <=  >  >=
print(temperature >= 30)

# Tableaux (homogènes)
villes <- c("Lyon", "Vénissieux", "Étoile d'Alaï", "L'Haÿ-les-Roses")

# NB: typeof(villes) => character
print(length(villes)) # 3
print(length(ville)) # 1 (1 texte est un tableau de 1 texte)


print(toupper(villes))

# caractères Unicode
ville_japon <- "東京"
print(ville_japon)

