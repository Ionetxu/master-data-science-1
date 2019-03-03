getwd()
dir.create("C:/Users/Aturt/Desktop/Session2")
setwd("C:/Users/Aturt/Desktop/Session2/")
library(dslabs)

dir<-system.file(package = "dslabs")
filename<-file.path(dir, "extdata/muders.csv")
file.copy(filename, "murders.csv")
dir<-"C:/Users/Aturt/Documents/R/win-library/3.5/dslabs/extdata"
dir(dir)
getwd()
file.copy(dir,"murders.csv", overwrite=T)
list.files()

dat <- read.csv("murders.csv")
head(dat)

dat2 <- read.delim("murders.csv", sep=",", header=T) #mas general
head(dat2)

class(dat)
dat$state == dat2$state
identical(dat$state, dat2$state)

dat <- read.csv("murders.csv", stringsAsFactors = F)
dat <- mutate(dat,state.cat=as.factor(state))
head(dat)

dat3 <- read.table("murders.csv", header=T, sep=",")
identical(dat3$total,dat$total)

which(dat$state=="Alabama")
match(c("Alabama", "California", "Colorado"), dat$state)
match(c("Alabama", "California", "Colorado"), dat$state.cat)
class(dat$state.cat)
c("Alabama", "Alaska") %in% dat$state

library(data.table)
counts.rnaseq <-fread("Counts.genes.DiffAll.genes.limma.random.txt", sep="\t", showProgress = T)
class(counts.rnaseq)

n = 1e6
DT = data.table( a=sample(1:1000,n,replace=TRUE),
                 b=sample(1:1000,n,replace=TRUE),
                 c=rnorm(n),
                 d=sample(c("foo","bar","baz","qux","quux"),n,replace=TRUE),
                 e=rnorm(n),
                 f=sample(1:1000,n,replace=TRUE) )
DT[2,b:=NA_integer_]
DT[4,c:=NA_real_]
DT[3,d:=NA_character_]
DT[5,d:=""]
DT[2,e:=+Inf]
DT[3,e:=-Inf]

write.table(DT,"test.csv",sep=",",row.names=FALSE,quote=FALSE)
cat("File size (MB):", round(file.info("test.csv")$size/1024^2),"\n")
system.time(DF1 <-read.csv("test.csv",stringsAsFactors=FALSE))
system.time(DF2 <- read.table("test.csv",header=TRUE,sep=",",quote="",
                              stringsAsFactors=FALSE,comment.char="",nrows=n,
                              colClasses=c("integer","integer","numeric",
                                           "character","numeric","integer")))
system.time(DT <- fread("test.csv"))

library(tidyverse)
tibble(x=letters)
tibble(x=1:5,y=x^2)

df1 <- data.frame(x = 1:3, y = 3:1)
class(df1[, 1])
df2 <- tibble(x = 1:3, y = 3:1)
class(df2[, 1])

data("gapminder")
head(data)
view(data)

gapminder %>% filter(country == "Sri Lanka" | country == "Turkey") %>% filter(year == 2015) %>% select(country, infant_mortality)

path <- system.file("extdata", package = "dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
head(wide_data)
library(readr)
view(wide_data)

new_tidy_data <- wide_data %>%
  gather(year, fertility, `1960`:`2015`)
new_tidy_data

data("co2")
view(co2)
view(ChickWeight)

paste("ASADAS","aaa",sep=",")

library(rvest)
url="https://en.wikipedia.org/wiki/List_of_countries_by_intentional_homicide_rate"
h <- read_html(url)
tab <- h %>% html_nodes("table")
head(tab)
tab <- tab[[4]] %>% html_table
head(tab)

write.table(tab, file="homicide.tsv", sep="\t")
hom <- read.table("homicide.tsv", sep="\t", stringsAsFactors = F)
colnames(hom)[1]="Country"
hom_eu <- hom %>% filter(Region == "Europe", Yearlisted == 2015) %>% select(Country, Count, Rate)
view(hom_eu)

total <- sum(murders$total)
population <- sum(murders$population)
rate <- total/population * 100000
hom_us <- data.frame("Country"="US", "Count" = total, "Rate" = rate)

hom_eu %>% add_row(Country=hom_us$Country, Count=hom_us$Count, Rate=hom_us$Rate)
