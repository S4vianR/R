### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 15: JRZEdad Facetas
library(tidyverse)
jrz <- read_csv("./data/mastografias_juarez.csv")
####Grupos####
jrz <- jrz %>%
  mutate(RangoEdad = cut(Edad,
                         breaks = c(0, 39, 49, 59, 69, 79, Inf),
                         labels = c("<40", "40-49", "50-59", "60-69", "70-79", "80+"),
                         right = FALSE))
###Porcentaje por grupo y Facetas####
porciento <- jrz %>%
  count(RangoEdad, Resultado) %>%
  group_by(RangoEdad) %>%
  mutate(porcentaje = n / sum(n) * 100)

porciento$porcentaje <- round(porciento$porcentaje,2)

ggplot(porciento, aes(x = reorder(Resultado, porcentaje), y = porcentaje)) +
  geom_col(fill = "#2E86C1") +
  geom_text(aes(label = paste0(round(porcentaje, 1), "%")),
            hjust = -0.1, size = 4, color = "black") +
  facet_wrap(~ RangoEdad, ncol = 2) +
  coord_flip() +
  labs(
    title = "Distribución porcentual de resultados de mastografías",
    x = "Resultado",
    y = "Porcentaje"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    strip.text = element_text(face = "bold", size = 12),
    axis.text.y = element_text(size = 14)
  )