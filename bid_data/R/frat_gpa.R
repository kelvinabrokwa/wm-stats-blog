setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/bid_data/raw_data/')

library(googleVis)

<<<<<<< HEAD
data = read.csv('frat_gpa2.csv',header=TRUE,check.names=FALSE)

data_df <- data.frame(data,check.names=FALSE)
df <- data_df[c(1,2,4,5,8,21)]

line_frat <- gvisLineChart(df, xvar='Time', yvar=colnames(df[-1]),
                      options=list(
                        title='Fraternity GPA',
                        fontSize=11,
                        hAxis="{textStyle:{fontSize:7.5}}",
                        width=600,
                        height=400))

plot(line_frat)
=======
data = read.csv('frat_gpa2.csv',header=TRUE)

data_df <- data.frame(data)
df <- data_df[c(1,2,4,5,8,21)]

line <- gvisLineChart(df, xvar='Time', yvar=colnames(df[-1]),
                      options=list(
                        title='Fraternity GPA',
                        fontSize=12,
                        vAxis.viewWindowMode='pretty',
                        hAxis.textStyle={fontSize:7},
                        width=600,
                        height=400))
plot(line)
>>>>>>> FETCH_HEAD

# Highest Mean GPA
# AEPi: 3.294
# Beta: 3.269
# Sig Ep: 3.322
# ATO: 3.257
<<<<<<< HEAD
# Delta Phi: 3.191
=======
# Delphi Phi: 3.191
>>>>>>> FETCH_HEAD

# Note seasonal GPA fluctuation