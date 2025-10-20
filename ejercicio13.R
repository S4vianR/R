### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 13: Facetas_mpg

# Librerias
library(tidyverse)
# Datos
data(mpg)
# Top 10
top_10 <- mpg %>% arrange(desc(mpg$cty)) %>% head(10)
# Grarica del fabricante y el desarrollo en la ciudad
ggplot(mpg, aes(x = manufacturer, y = cty)) +
  theme_classic() +
  geom_point(color = "#7393B3", size = 3) +
  geom_point(data = top_10, aes(manufacturer,cty), color = "#D22B2B", size = 1)
