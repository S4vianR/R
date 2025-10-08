### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 7: Paquetes de R

## Tidyverse
### Check if tidyverse is installed, if not install it
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  Sys.setenv(MAKEFLAGS = "-j12") # Use 12 cores for installation
  install.packages("tidyverse")
} else {
  library(tidyverse)
}

# Poblacion mundial
poblacion_mundial <- read.csv("./data/world_population2020.csv")

# Ten top countries by population
top10_poblacion <- poblacion_mundial %>%
  arrange(desc(Population)) %>%
  slice_head(n = 10)

print(top10_poblacion)