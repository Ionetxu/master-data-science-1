library(dslabs)
data(gapminder)
library(dplyr)
library(ggplot2)

gapminder %>% filter(year == 2015 & (country == "Sri Lanka" | country == "Turkey")) %>% 
  select(country, infant_mortality)


for (x in 1960:2015){
  p<-gapminder %>% filter(year == x) %>% ggplot(aes(x=fertility, y=life_expectancy)) + 
    geom_point(aes(color=continent, size = population)) +
    ggtitle(x)
  print(p)
  Sys.sleep(1)
}

gapminder %>% filter(year == x) %>% ggplot(aes(x=fertility, y=life_expectancy)) + 
  geom_point(aes(color=continent, size = population))
