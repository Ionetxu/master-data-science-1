library(dslabs)
library(dplyr)
data(heights)
head(heights)
str(heights)

#summarize with dplyr
s <- heights %>% 
  filter(sex == "Male") %>%
  summarize(average = mean(height), standard_deviation = sd(height))
s
str(s)

s <- murders %>%
  summarize(median = median(total), mad=mad(total),min=min(total),max=max(total))
s
str(s)

s <- murders %>% 
  mutate(rate=total/population*100000) %>%
  summarize(mean(rate))
s
str(s)

#access a numerical with .
s
s %>% .$rate

s <- murders %>% 
  summarize(rate=mean(total)/mean(population)*100000) %>%
  .$rate
s

#group_by()
babies<-read.delim("babies.txt", header=T, sep="\t")
babies.new<-babies %>% 
  select(bwt, smoke) %>% 
  group_by(smoke)  
str(babies.new)
babies.new

# group_by() and summarize()
babies %>% 
  select(bwt, smoke) %>% 
  group_by(smoke)  %>% 
  summarize(mean(bwt))

#arrange()
murders %>% mutate(rate=total/population*100000)%>%
  arrange(rate) %>% #ordena por rate 
  head()

murders %>% mutate(rate=total/population*100000)%>%
  arrange(total,rate) %>% 
  head()

murders %>% mutate(rate=total/population*100000)%>%
  arrange(desc(rate)) %>%
  top_n(10)

