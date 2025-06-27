# types de données:
# - Date (year, mois, jour)
# - POSIXct : horodatage (annee, mois, jour, heure, minute, seconde, fraction)
#       basé sur le 1er janvier 1970      
# - POSIXlt : horodatage (annee, mois, jour, heure, minute, seconde, fraction)
#       moderne => range les composantes séparemment

d3 <- as.Date("27/06/2025", format="%d/%m/%Y")

d <- as.POSIXct("27/06/2025 13:34", format="%d/%m/%Y %H:%M")
typeof(d)
class(d)
as.integer(format(d, "%Y"))
format(d, "%Y-%m-%d")

d2 <- as.POSIXlt("27/06/2025 18:34", format="%d/%m/%Y %H:%M")
class(d2)
d2$year + 1900
d2$mon + 1
d2$mday
d2$hour
d2$min
d2$sec
d2$wday
format(d2, "%Y")

d4 <- as.POSIXct("27/06/2025 18:34", format="%d/%m/%Y %H:%M")
d4 - d # Time difference of 5 hours
class(d4 - d)

as.POSIXct(d2) - d

d + as.difftime(48*60 + 23, units="secs")
d + as.difftime(4, units="days")

