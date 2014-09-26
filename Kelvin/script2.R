setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')
data.long <- read.csv('agg_data_long.csv', header=TRUE)

motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)