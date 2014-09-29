<<<<<<< HEAD
setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')
library(googleVis)

data.wide <- read.csv('agg_data_2.csv', header=TRUE)
View(data.wide)
=======
install.packages('googleVis')
library(googleVis)

setwd('C:\Users\djruh_000\Documents\GitHub\wm-stats-blog\Kelvin\')

>>>>>>> 5af67e72a6f964cb7b549ab30a9f2d52d28d4437
data.long <- read.csv('agg_data_long.csv', header=TRUE)
View(data.long)



motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)