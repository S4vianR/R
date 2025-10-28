### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 16: Regesión - mtcars
library(tidyverse)
data(mtcars)

mtcars <- mtcars %>% select(mpg, cyl, hp, wt, am)
# Grafica
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Relacion entre peso y millas por galon",
    x = "Peso del auto (1000 lbs)",
    y = "Millas por galon (mpg)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

# Modelo de regresion lineal simple
simple_1 <- lm(mpg ~ wt, data = mtcars)
print("Resumen del modelo de regresion lineal simple (mpg ~ wt):")
summary(simple_1)
simple_2 <- lm(mpg ~ hp, data = mtcars)
print("Resumen del modelo de regresion lineal simple (mpg ~ hp):")
summary(simple_2)
multiple_1 <- lm(mpg ~ wt + hp, data = mtcars)
print("Resumen del modelo de regresion lineal multiple (mpg ~ wt + hp):")
summary(multiple_1)
multiple_2 <- lm(mpg ~ wt + hp + am + cyl, data = mtcars)
print("Resumen del modelo de regresion lineal multiple (mpg ~ wt + hp + am + cyl):")
summary(multiple_2)
nolineal_1 <- lm(mpg ~ hp + poly(wt, 2) + cyl + am, data = mtcars)
print("Resumen del modelo de regresion lineal con termino no lineal (mpg ~ hp + poly(wt,2) + cyl + am):")
summary(nolineal_1)