source('R/functions.R')#source functions from R folder

library(lme4)
library(plyr)
library(dplyr)
library(ggplot2)

data<-file_read('data/gapminder-FiveYearData.csv')%>%mutate(lnLifeExp=log(lifeExp), lnGdpPerCap=log(gdpPercap))

model<-lmer(lnLifeExp~lnGdpPerCap+year+(1|continent), data=data)
output_model<-coef(model)$continent
lines_data  <-  data %>% mutate(predicted = predict(model)) %>% ddply(.(continent) , summarise_data)
makeFigure(data, lines_data)

#with drake, this can be replaced by:
source('R/packages.R')
source('R/functions.R')
source('R/plan.R')

make(plan)
