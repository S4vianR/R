### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 9: Mastografias, continuacion

# 1. Cargar paquetería
## Tidyverse
### Check if tidyverse is installed, if not install it
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  Sys.setenv(MAKEFLAGS = "-j12") # Use 12 cores for installation
  install.packages("tidyverse")
} else {
  library(tidyverse)
}

## Readr
if (!requireNamespace("readr", quietly = TRUE)) {
  Sys.setenv(MAKEFLAGS = "-j12") # Use 12 cores for installation
  install.packages("readr")
} else {
  library(readr)
}

# 2. Cargar datos
mastografias <- read_csv("./data/mastografias.csv")
## Cargar datos de chihuahua (CEntidad=8)
mastografias_chihuahua <- mastografias %>% filter(CEntidad == 8)
## Cargar datos de Juarez (CMunicipio=37)
mastografias_juarez <- mastografias_chihuahua %>% filter(Cmunicipio == 37)
## Opcionalmente, guardar los datos en un archivo CSV
write_csv(mastografias_juarez, "./data/mastografias_juarez.csv")

# 3. Graficar datos
## Gráfica de resultados de chihuahua
ggplot(data = mastografias_chihuahua, aes(x = Resultado)) +
  geom_bar(fill = rainbow(9)) +
  coord_flip() +
  labs(
    title = "Resultados de mastografías en Chihuahua",
    x = "Resultado",
    y = "Conteo"
  ) +
  theme_classic()

## Gráfica de resultados de Juarez
ggplot(data = mastografias_juarez, aes(Resultado, fill = Resultado)) +
  geom_bar(fill = rainbow(9), color = "grey", show.legend = F) +
  coord_flip() +
  labs(
    title = "Resultados de mastografías en Juárez, Chihuahua",
    x = "Resultado",
    y = "Conteo"
  ) +
  theme_classic()