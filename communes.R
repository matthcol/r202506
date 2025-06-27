# Traitement fichier CSV: communes_france_2025.csv

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
