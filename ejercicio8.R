### Datos personales ###
# Nombre: Reuben Rhienhart
# Numero de control: 20112048
# Grupo: H
# Ejercicio 8: Mastografias
setwd(file.path(Sys.getenv("HOME"), "R"))
# Liberias
library(tidyverse)
# Importar "./data/mastografia.csv"
mastografia <- read.csv("./data/mastografias.csv")
# Minusculas
mastografia <- mastografia %>% mutate_all(tolower)
# Encontrar los datos de la entidad "Chihuahua"
chihuahua_data <- mastografia %>% filter(
  CEntidad == "08" | ENTIDAD == "chihuahua"
)
# Encontrar los datos del municipio "Juarez" con un CMunicipio de "37"
juarez_data <- chihuahua_data %>% filter(
  CMunicipio == "037" | MUNICIPIO == "juarez"
)
# Grafica de Chihuahua
ggplot(
  chihuahua_data,
  aes(Resultado)+
    geom_bar(fill(rainbow(9)))+
    coord_flip()+
    theme_classic()
)
# Grafica de Juarez
ggplot(
    juarez_data,
    aes(Resultado)+
      geom_bar(fill(rainbow(9)))+
      coord_flip()+
      theme_classic()
)
# Guardar las graficas
ggsave("./images/chihuahua_mastografias.png")
ggsave("./images/juarez_mastografias.png")
# Fin del script


