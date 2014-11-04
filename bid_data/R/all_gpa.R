setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/bid_data/raw_data/')

library(googleVis)

data <- read.csv('ave_gpa.csv',header=TRUE,check.names=FALSE)

df <- data.frame(data,check.names=FALSE)

lines <- gvisLineChart(df, xvar='Time',yvar=colnames(df[-1]),
                       options=list(
                         title='GPA by Semester',
                         fontSize=11,
                         width=600,
                         height=400,
                         hAxis="{textStyle:{fontSize:7.5}}"
                         ))

plot(lines)
