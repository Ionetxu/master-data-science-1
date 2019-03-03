dir.create("C:/Users/Aturt/Desktop/ejs")
setwd("C:/Users/Aturt/Desktop/ejs")
getwd()

library(dslabs)
library(eurostat)
library(dplyr)
library(ggplot2)
library(ggfortify)
library(tidyr)
library(tidyverse)
library(knitr)
library(rvest)

# EJ 1.6
transport <- read.delim("EU.Stats.transport.txt", header = T, sep="\t", stringsAsFactors = F)
head(transport)

# Años que cubrio la estadistica
max(transport$time)
min(transport$time)
unique(transport$time)

# Pais con mayor incremento de coche
car1990 <- transport %>% filter(vehicle == "CAR", time == 1990) %>% select(geo, values)
car2016 <- transport %>% filter(vehicle == "CAR", time == 2016, geo %in% car1990$geo) %>% select(geo, values)
car_inc <- data.frame("geo" = car1990$geo, "inc" = car2016$values - car1990$values)
car_inc$geo[which.max(car_inc$inc)]

# Paises donde ha descendido el uso del coche
car_inc$geo[which(car_inc$inc < 0)]

# EJ 2.2
url="https://en.wikipedia.org/wiki/List_of_countries_by_intentional_homicide_rate"
h <- read_html(url)
tab <- h %>% html_nodes("table")
head(tab)
tab <- tab[[4]] %>% html_table
head(tab)
colnames(tab)[1]="Country"

murders_us <- read.csv("murders.csv", header=T, sep=",", stringsAsFactors = F)
head(murders_us)

# Calcular rate
murders_us$rate <- murders_us$total / murders_us$population * 100000
head(murders_us)

# Rate de US
us <- data.frame("Country" = "US", "Year" = 2015, "Rate" = mean(murders_us$rate))
us

# Rates EU
eu <- tab %>% filter(Region == "Europe") %>% select(Country, Yearlisted, Rate)
names(eu)[2] = "Year"
head(eu)

# Unir dataframes
all <- eu %>% rbind(us)

# EJ 2.3
write.table(tab, "muders.world.txt", quote=F, sep="\t", row.names = F)

# Leer fichero
world.murders <- read_tsv("muders.world.txt")
head(world.murders)

# Cambiar nombre cols
names(world.murders)[1] = "Country"
names(world.murders)[6] = "Year"

# Seleccionar eu
eu.murders <- world.murders %>% filter(Region == "Europe") %>% select(Country, Rate, Year)

# Añadir US
all.murders <- bind_rows(eu.murders, us)
all.murders[52,]

# Paises EU mayor que US
all.murders$Country[which(all.murders$Rate > us$Rate)]
