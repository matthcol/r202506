# Lecture de CSV avec readr (tidyverse)
library(tidyverse)
# dplyr     purrr 
# forcats   stringr
# ggplot2   tibble
# ubridate  tidyr
# readr

communes_france_2025 <- read_csv(
    "data/communes_france_2025.csv", 
    col_types = cols(
      code_postal = col_character(),
      canton_code = col_character(),
      epci_code = col_character()
    )
)

View(communes_france_2025)

# problems(communes_france_2025)
glimpse(communes_france_2025)

# toutes les colonnes: vecteur
colnames(communes_france_2025) 

# colonne 17: => epci_code
colnames(communes_france_2025)[17]
