### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 14: Facetas_mpg

# Librerias
library(tidyverse)
# Datos
data(mpg)
# Top 10
top_10 <- mpg %>%
  arrange(desc(mpg$cty)) %>%
  slice_head(n = 10)
# Grafica de fabricantes vs. rendimiento en ciudad
ggplot(mpg, aes(x = manufacturer, y = cty)) +
  theme_classic(base_size = 14) +
  geom_point(color = "#36454F", size = 2) +
  geom_point(data = top_10, aes(x = manufacturer, y = cty), color = "red", size = 2) +
  geom_text(data = top_10, aes(label = model), hjust = 1.3, color = "red", size = 5) +
  labs(title = "Rendimiento en ciudad por fabricante",
       subtitle = "Los Ten Tops",
       x = "Fabricante",
       y = "Rendimiento en ciudad (mpg)") +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5, size = 16, face = "italic")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))