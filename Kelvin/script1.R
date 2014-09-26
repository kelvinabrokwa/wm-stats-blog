setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')
data.wide <- read.csv('agg_data_2.csv', header=TRUE)

data.wide$Year <- factor(data.wide$Year)
View(data.wide)

library(reshape2)

data.long <- melt(data.wide, id.vars=c("Year"))
View(data.long)

plot(data.long)


motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)