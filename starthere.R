library("ggplot2")
library("reshape2")
library("ggthemes")
library("ggpubr")
library("egg")

#csvdata <- read.csv("") 
#csvdata

print("Hello World!")






#enzfit <- function(num) {
#  geom_smooth(method = "nls", 
#              method.args = list(formula = y ~ Vmax * x / (Km + x), 
#                                 start = list(Vmax = 50, Km = 0.2)),
#              se = F, size = 0.5, 
#              data = subset(melt.enz, variable==paste("Exp.", num, sep = "")), colour = "black")
#}

#plt + enzfit(1)
#head(melt.enz)
#for(i in 1:6) {
#  assign("plt", plt + enzfit(i), envir = .GlobalEnv)
#}