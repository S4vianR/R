### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 12: Facetas
library(tidyverse)
# R Data Set
data("mpg")
ggplot(data = mpg, aes(x = cty, y = hwy, col = class)) +
  geom_point() +
  facet_grid(fl ~ class) +
  theme_gray(base_size = 16) +
  labs(
    title = "Combustible en ciudad vs. carretera",
    x = "Rendimiento en ciudad (mpg)",
    y = "Rendimiento en carretera (mpg)"
  )