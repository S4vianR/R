### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 10: Mastografias, continuacion
# 1. Cargar paquetería
library(tidyverse)
# 2. Cargar datos de juarez con el RData
mastografias_juarez <- read_csv("./data/mastografias_juarez.csv")
cuenta <- mastografias_juarez %>%
  count(Resultado) %>%
  mutate(Porciento = n / sum(n) * 100)
cuenta$Porciento <- round(cuenta$Porciento, 2)

ggplot(cuenta, aes(x= cuenta$n, y = (reorder(cuenta$Porciento,cuenta$n))))+
  geom_col(fill = rainbow(9), color = "#000000", size = 2)+
  theme_classic(base_size = 20)+
  labs(
    title = "Resultados de mastografías en Juárez, Chihuahua",
    x = "Porciento",
    y = "Conteo"
  )+
  geom_text(
    aes(label = paste0(cuenta$Porciento, "%")),
    size = 5,
    hjust = -0.25,
  )