############# Exercises from dsbook ####################

############## exercise 1 ##############################
#Start by loading the tidyverse or ggplot2 library 
#as well as the `murders` and `heights` data.

library(tidyverse)
library(dslabs)
data(heights)
data(murders)


#1. With ggplot2 plots can be saved as objects. 
#For example we can associate a dataset with a plot object like this

p <- ggplot(data = murders)

#Because `data` is the first argument we don't need to spell it out

p <- ggplot(murders)


#and we can also use the pipe:

p <- murders %>% ggplot()

#What is class of the object `p`?

########################### exercise 2 #######################
#2. Remember that to print an object you can use the command `print` or simply type the object. For example

x <- 2
x
print(x)


#Print the object `p` defined in exercise one and describe what you see.

#A. Nothing happens.

#B. A blank slate plot.

#C. A scatter plot.

#D. A histogram.

########################### exercise 3 #######################
#3. Using the pipe `%>%`, create an object `p` but this time 
#associated with the `heights` dataset instead of the `murders` dataset. 

p <- heights %>% ggplot()

#What is the class of the object `p` you have just created?


#Now we are going to add a layers and the corresponding aesthetic mappings. 
#For the murders data we plotted total murders versus population sizes. 
#Explore the `murders` data frame to remind yourself what are the names 
#for these two variables and select the correct answer. __Hint__: Look at `?murders`.

# A. `state` and `abb`.
# 
# B. `total_murers` and `population_size`.
# 
# C.  `total` and `population`.
# 
# D. `murders` and `size`.

#To create the scatter plot we add a layer with `geom_point`. The aesthetic mappings require us to define the x-axis and y-axis variables respectively. So the code looks like this:

murders %>% ggplot(aes(x = , y = )) +
geom_point()

#except we have to define the two variables `x` and `y`. 
#Fill this out with the correct variable names.


#Note that if we don't use argument names, we can obtain the same plot by making sure 
#we enter the variable names in the right order like this:
  
murders %>% ggplot(aes(population, total)) +
  geom_point()


#Remake the plot but now with total in the x-axis and population in the y-axis.


#If instead of points we want to add text, we can use the `geom_text()` 
#or `geom_label()` geometries. The following code 

murders %>% ggplot(aes(population, total)) +
  geom_label()

murders %>% ggplot(aes(population, total, label=abb)) +
  geom_label()

murders %>% ggplot() + 
  geom_point(aes(x = population, y = total)) + 
  geom_text(aes(population, total, label = abb))

murders %>% ggplot(aes(x = population, y = total, label = abb)) +
  geom_point() +
  geom_text(color = "red")

murders %>% ggplot() +
  geom_point(aes(x = population, y = total)) +
  geom_text(aes(x = population, y = total, label = abb), nudge_y = 1, color = "red")

p<- murders %>% ggplot(aes(x = population, y = total, label = abb)) + 
  geom_point(size = 3) +
  geom_text(nudge_x = .05) +
  scale_x_log10() +
  scale_y_log10() +
  ylab("Total murders") +
  ggtitle("US Gun Murders")

p +
  geom_point(aes(color=region, size=total)) +
  geom_abline(intercept = log10(0.00003))
# will give us the error message: `Error: geom_label requires the following missing aesthetics: label`
# 
# Why is this?
#   
#   A. We need to map a character to each point through the label argument in aes.
# 
# B. We need to let `geom_label` know what character to use in the plot.
# 
# C. The `geom_label` geometry does not require  x-axis and y-axis values.
# 
# D. `geom_label` is not a ggplot2 command.


# 9. Rewrite the code above to  abbreviation as the label through `aes`
# 
# 
# 10. Now let's change the color of the labels through blue. How will we do this?
# 
# A. Adding a column called `blue` to `murders`
# 
# B. Because each label needs a different color we map the colors through `aes`
# 
# C. Use the `color` argument in `ggplot`
# 
# D. Because we want all colors to be blue, we do not need to map colors, just use the color argument in `geom_label`
# 
# 
# 11. Rewrite the code above to make the labels blue
# 
# 
# 12. Now suppose we want to use color to represent the different regions. In this case which of the following is most appropriate:
# 
# A. Adding a column called `color` to `murders` with the color we want to use.
# 
# B. Because each label needs a different color we map the colors through the color argument of `aes` .
# 
# C. Use the `color` argument in `ggplot`.
# 
# D. Because we want all colors to be blue, we do not need to map colors, just use the color argument in `geom_label`.
# 
# 
# 11. Rewrite the code above to make the labels' color be determined by the state's region.
# 
# 12. Now we are going to change the x-axis to a log scale to account for the fact the distribution of population is skewed. Let's start by define an object `p` holding the plot we have made up to now
# 

p <- murders %>% 
ggplot(aes(population, total, label = abb, color = region)) +
geom_label() 

# 
# To change the y-axis to a log scale we learned about the `scale_x_log10()` function. Add this layer to the object `p` to change the scale and render the plot
# 
# 
# 13. Repeat the previous exercise but now change both axes to be in the log scale.
# 
# 14. Now edit the code above to add the title "Gun murder data" to the plot. Hint: use the `ggtitle` function.
# 
# 15. Now we are going to use the `geom_histogram` function to make a histogram of the heights in the `height` data frame. When reading the documentation for this function we see that it requires just one mapping, the values to be used for the histogram. Make a histogram of all the plots. 
# 
# What is the variable containing the heights?
#   
#   A. `sex`
# 
# B. `heights`
# 
# C. `height`
# 
# D. `heights$height`
# 
# 16. Now create a ggplot object using the pipe to assign the heights data to a ggplot object an assign `height` to the x values through the `aes` function
# 
# 17. Now we are ready to add a layer to actually make the histogram. Use the object created in the previous exercise and the `geom_histogram` function to make the histogram.
# 
# 18. Note that when we run the code in the previous exercise we get the warning:
#   `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.`
# 
# Use the `binwidth` argument to change the histogram made in the previous exercise to use bins of size 1 inch. 
# 
# 19. Now instead of a histogram we are going to make a smooth density plot. In this case we will not make an object, instead we will render the plot with one line of code. Change the code previously used
# 

heights %>% 
ggplot(aes(height)) +
geom_histogram()

# 
# to make a smooth density instead of a histogram.
# 
# 
# 20. Now we are going to make a density plot for males and females separately. We can do this using any of the `group` argument. We assign groups via the aesthetic mapping as each point needs to a group before making the calculations needed to estimate a density.
# 
# 21. We can also assign groups through the `color` argument. This has the added benefit that it uses color to distinguish the groups. Change the code above to use color
# 
# 22. We can also assign groups through the `fill` argument. This has the added benefit that it uses colors to distinguish the groups, like this:
#   
#   
heights %>%
  ggplot(aes(height, fill = sex)) +
  geom_density()
# ```
# 
# However, here the second density is drawn over the other. 
#We can change this by using alpha blending. Set the alpha parameter to 0.2 in the `geom_density` function to make this change.