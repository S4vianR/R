### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 11: Agrupamiento

# 1. Cargar paquetería
library(tidyverse)

# 2. Cargar datos del pais del csv "mastografias.csv" y de chihuahua del csv "mastografias_chihuahua.csv"
mastografias <- read_csv("./data/mastografias.csv")
mastografias_chihuahua <- read_csv("./data/mastografias_chihuahua.csv")

# 3. Generacion de tabla de resultado del pais
pais <- mastografias %>%
  group_by(Resultado) %>%
  summarise(Casos = n()) %>%
  arrange(desc(Casos)) %>%
  mutate(Porcentaje = round(Casos / sum(Casos) * 100, 2))

# 3.5 Guardar tabla de resultado del pais en formato csv
write_csv(pais, "./data/pais.csv")

# 4. Agrupar y graficar municipios de Chihuahua
municipios_chihuahua <- mastografias_chihuahua %>%
  group_by(Municipio) %>%
  summarise(Conteo = n()) %>%
  arrange(desc(Conteo))

ggplot(municipios_chihuahua, aes(x = Conteo, y = Municipio)) +
  geom_col(fill = rainbow(length(municipios_chihuahua$Municipio)), color = "#000000") +
  theme_classic(base_size = 16) +
  labs(title = "Conteo de mastografías por municipio en Chihuahua") +
  geom_text(aes(label = Conteo), size = 3, hjust = -0.50)

ggsave("./figures/municipios_chihuahua.png", width = 10, height = 8)