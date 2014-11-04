setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/bid_data/raw_data/')

library(googleVis)

data <- read.csv('percentage_greek.csv',header=TRUE,check.names=FALSE)

df_bar1 <- data.frame(c(data[1],round(data[-1])),check.names=FALSE)
df_bar2 <- df_bar1[c(1,11,12,8,9)]

bar <- gvisBarChart(df_bar2, xvar="Time", yvar=colnames(df_bar2[-1]),
                    options=list(title='Population Distribution',
                                 isStacked=TRUE,
                                 fontSize=11,
                                 bars='horizontal',
                                 width=600,
                                 height=500))
plot(bar)
