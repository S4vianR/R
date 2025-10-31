# Cargar las librerías necesarias del Tidyverse
# install.packages("tidyverse")
# install.packages("scales")
library(tidyverse)
library(scales)

# Asegurarse de que existe la carpeta donde se guardarán las figuras
if (!dir.exists("./figures")) dir.create("./figures", recursive = TRUE)

# Crear el dataframe a partir de los datos recolectados
# En un caso real, esto se cargaría desde el archivo CSV con:
# exploits_df <- read.csv("exploits_historicos.csv")

exploits_df <- data.frame(
  Incidente = c("The DAO Hack", "Parity Multisig Wallet", "Poly Network", "Wormhole Bridge", "Ronin Network"),
  Fecha = as.Date(c("2016-06-17", "2017-11-06", "2021-08-10", "2022-02-02", "2022-03-23")),
  Tipo_Vulnerabilidad = c("Reentrada", "Fallo de Lógica / Control de Acceso", "Fallo de Lógica / Control de Acceso", "Falla de Verificación de Firmas", "Compromiso de Claves Privadas"),
  Blockchain_Afectada = c("Ethereum", "Ethereum", "Ethereum;BSC;Polygon", "Solana;Ethereum", "Ronin;Ethereum"),
  Perdida_USD_Estimada = c(60000000, 280000000, 611000000, 325000000, 624000000)
)

# --- Análisis y Generación de Tabla 2 ---
# Agrupar por tipo de vulnerabilidad y calcular el total perdido y el número de incidentes
summary_by_vuln <- exploits_df %>%
  group_by(Tipo_Vulnerabilidad) %>%
  summarise(
    Total_Perdido_USD = sum(Perdida_USD_Estimada),
    Numero_Incidentes = n()
  ) %>%
  arrange(desc(Total_Perdido_USD))

# Imprimir la tabla de resumen en la consola
print("Tabla 2: Agregación de Pérdidas por Tipo de Vulnerabilidad")
print(summary_by_vuln)


# --- Generación de Figura 1: Impacto Económico por Incidente ---
plot1 <- ggplot(exploits_df, aes(x = reorder(Incidente, -Perdida_USD_Estimada), y = Perdida_USD_Estimada)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = paste0("$", format(Perdida_USD_Estimada / 1e6, nsmall = 0, big.mark = ","), "M")),
            vjust = -0.5, color = "black", size = 3.5) +
  scale_y_continuous(labels = dollar_format(scale = 1e-6, suffix = "M")) +
  labs(
    title = "Figura 1: Impacto Económico por Incidente",
    subtitle = "Pérdidas estimadas en millones de USD en el momento del exploit",
    x = "Incidente",
    y = "Pérdida Estimada (USD)"
  ) +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Exportar la Figura 1 a png
ggsave("./figures/Figura1_Impacto_Economico_por_Incidente.png", plot = plot1, width = 10, height = 6, dpi = 300, units = "in")


# --- Generación de Figura 2: Distribución de Pérdidas por Tipo de Vulnerabilidad ---
plot2 <- ggplot(summary_by_vuln, aes(x = reorder(Tipo_Vulnerabilidad, -Total_Perdido_USD), y = Total_Perdido_USD)) +
  geom_col(fill = "darkred") +
  geom_text(aes(label = paste0("$", format(Total_Perdido_USD / 1e6, nsmall = 0, big.mark = ","), "M")),
            vjust = -0.5, color = "black", size = 3.5) +
  scale_y_continuous(labels = dollar_format(scale = 1e-6, suffix = "M")) +
  labs(
    title = "Figura 2: Distribución de Pérdidas por Tipo de Vulnerabilidad",
    subtitle = "Total de pérdidas acumuladas por categoría en la muestra analizada",
    x = "Tipo de Vulnerabilidad",
    y = "Total Perdido (USD)"
  ) +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Exportar la Figura 2 a png
ggsave("./figures/Figura2_Distribucion_de_Perdidas_por_Tipo_de_Vulnerabilidad.png", plot = plot2, width = 10, height = 6, dpi = 300, units = "in")
