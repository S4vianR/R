### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 6: Series de tiempo
setwd(file.path(Sys.getenv("HOME"), "R"))

# Importar "./data/eventos.csv"
eventos <- read.csv("./data/eventos.csv")

# Limpieza de datos y variables

## Borrar espacios
eventos$Fecha <- trimws(eventos$Fecha)
eventos$Region <- trimws(eventos$Region)
eventos$Evento <- trimws(eventos$Evento)
eventos$Ingresos <- trimws(eventos$Ingresos)
eventos$Gastos <- trimws(eventos$Gastos)
eventos$Beneficio <- trimws(eventos$Beneficio)

## Convertir a minusculas
eventos$Region <- tolower(eventos$Region)
eventos$Evento <- tolower(eventos$Evento)
eventos$Ingresos <- tolower(eventos$Ingresos)
eventos$Gastos <- tolower(eventos$Gastos)
eventos$Beneficio <- tolower(eventos$Beneficio)

# Factorizacion de variables categoricas
eventos$Region <- as.factor(eventos$Region)
eventos$Evento <- as.factor(eventos$Evento)
head(eventos)

# Conteo de variables categoricas
count_region <- table(eventos$Region)
count_evento <- table(eventos$Evento)

# Configuracion de ventana grafica
if (.Platform$OS.type == "windows") {
  windows()
} else {
  X11()
}
# Grafica de barras de la region
# barplot(
#   height = count_region,
#   main = "Conteo de eventos por region",
#   col = "skyblue",
#   xlab = "Region",
#   ylab = "Conteo"
# )

# Grafica de barras del evento
# barplot(
#     height = count_evento,
#     main = "Conteo de eventos por tipo",
#     col = "lightgreen",
#     xlab = "Tipo de evento",
#     ylab = "Conteo"
# )

## Series de tiempo ##
ts_beneficio <- ts(
    eventos$Beneficio,
    start = 2010,
    frequency = 1
)

plot(
    ts_beneficio,
    main = "Beneficios anuales",
    xlab = "Año",
    ylab = "Beneficio",
    col = "blue",
    lwd = 2
)