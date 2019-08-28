if (!require('ggplot2', character.only=T, quietly=T)) {
  install.packages('ggplot2')
  library('ggplot2', character.only=T)
}
if (!require('reshape2', character.only=T, quietly=T)) {
  install.packages('reshape2')
  library('reshape2', character.only=T)
}
if (!require('ggthemes', character.only=T, quietly=T)) {
  install.packages('ggthemes')
  library('ggthemes', character.only=T)
}
if (!require('ggpubr', character.only=T, quietly=T)) {
  install.packages('ggpubr')
  library('ggpubr', character.only=T)
}
if (!require('egg', character.only=T, quietly=T)) {
  install.packages('egg')
  library('egg', character.only=T)
}


# the data:

csvdata <- read.csv("./enzyme.csv") 
csvdata
#enzdata <- matrix(c(0, 17.36667, 31.97143, 52.68889, 61.95385, 74.2, 77.97143, 84.28, 99.91429, 93.66667, 
#                    0, 15.7, 29.42286, 45.64, 62.60615, 75.78118, 69.88, 75.256, 89.59429, 86.84, 
#                    0, 27.10667, 42.12, 63.48, 69.56, 74.26857, 79.44444, 83.29091, 87.1, 82.08571, 
#                    0, 24.72, 39.07, 47.4, 57.928, 67.6, 71.35556, 67, 75.79375, 70.86667, 
#                    0, 5.723636, 11.48, 17.697143, 28.813333, 37.567273, 42.483077, 40.68, 52.81, 56.92, 
#                    0, 2.190476, 5.254545, 8.95, 15.628571, 20.8, 25.355556, 26.55, 32.44, 33.333333),
#                  nrow = 10, ncol = 6)
#no.Exp <- c("Exp 1", "Exp 2", "Exp 3", "Exp 4", "Exp 5", "Exp 6")
#Sub <- c(0, 1, 2, 4, 8, 12, 16, 20, 30, 40) 

#enzdata <- as.data.frame(enzdata) # converted to a data.frame
#colnames(enzdata) <- no.Exp # add column names
#enzdata <- cbind(Sub, enzdata)

head(enzdata)

melt.enz <- melt(enzdata, id.vars = c("Sub"))

plt <- ggplot(melt.enz, aes(Sub, value)) + 
  
  geom_point(data = transform(melt.enz, variable = NULL), colour = "grey85") +
  
  geom_point() + facet_wrap(~variable) +
  labs(title = "Enzyme Plots") + 
  theme_base() +
  theme(aspect.ratio = 1/1, legend.position = "") + 
  xlab("[Substrate] nM") + ylab("Velocity µM/min")

plt

enzfit <- function(num) {
  geom_smooth(method = "nls", 
              method.args = list(formula = y ~ Vmax * x / (Km + x), 
                                 start = list(Vmax = 50, Km = 0.2)),
              se = F, size = 0.5, 
              data = subset(melt.enz, variable==paste("Exp.", num, sep = "")), colour = "black")
}

plt + enzfit(1)
head(melt.enz)
for(i in 1:6) {
  assign("plt", plt + enzfit(i), envir = .GlobalEnv)
}
plt
final <- tag_facet(plt, open = "", close = "", tag_pool = c("A", "B", "C", "D", "E", "F"))
final
ggsave("tesfile.svg", final, width = 7, height = 5)
