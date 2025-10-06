### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio: 4

## Variables
titulo <- "Relacion entre horas estudiadas y calificaciones"

## Vectores
Horas_estudio <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
calificaciones_a <- c(55, 60, 65, 70, 75, 80, 85, 90, 95, 100)
calificaciones_b <- c(60, 68, 72, 75, 78, 81, 84, 87, 90, 93)
calificaciones_c <- c(45, 55, 65, 75, 80, 85, 87, 88, 89, 90)

df <- data.frame(
  Horas_estudiadas = Horas_estudio,
  Calificaciones_G_A = calificaciones_a,
  Calificaciones_G_B = calificaciones_b,
  Calificaciones_G_C = calificaciones_c
)

X11(
  display = ":1",
  width = 7,
  height = 7,
  pointsize = 12,
  title = titulo
)

matplot(
  df$Horas_estudiadas,
  df[, -1],
  type = "b",
  pch = 1:3,
  col = c("red", "blue", "green"),
  xlab = "Horas Estudiadas",
  ylab = "Calificaciones",
  main = titulo
)

legend(
  "topleft",
  legend = c("Grupo A", "Grupo B", "Grupo C"),
  col = c("red", "blue", "green"),
  pch = 1:3
)