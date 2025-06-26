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





