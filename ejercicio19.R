### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 19: Regresion logistica (mtcars)
library(tidyverse)
data(mtcars)
# Modelo No Lineal (mpg vs poly(wt, 2))
nolineal <- lm(mpg ~ poly(wt, 2) + hp, data = mtcars)
summary(nolineal)
# R-squared ajusted:  0.8719
nuevo <- data.frame(wt = 2.2, hp = 66)
nuevo_mpg <- predict(nolineal, newdata = nuevo)
mtcars$ajustados <- predict(nolineal)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue", size = 2.5) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "darkgreen", se = FALSE) +
  theme_minimal(base_size = 14) +
  geom_point(aes(x = wt, y = ajustados), color = "red", size = 2.5) +
  geom_point(data = nuevo, aes(x = wt, y = nuevo_mpg), color = "purple", size = 3) +
  annotate(geom = "text", x = 2.2, y = nuevo_mpg + 1,
           label = paste("MPG", round(nuevo_mpg, 2)),
           color = "purple", size = 4, hjust = -0.01, vjust = 0.1)