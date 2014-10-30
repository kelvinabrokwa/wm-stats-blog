setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')
library(googleVis)

data.long <- read.csv('agg_data_long.csv', header=TRUE)
View(data.long)

motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)
print(motion, file="motion_chart.html")
