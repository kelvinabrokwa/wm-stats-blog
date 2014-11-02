setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/bid_data/raw_data/')

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

# Highest Mean GPA
# AEPi: 3.294
# Beta: 3.269
# Sig Ep: 3.322
# ATO: 3.257
# Delphi Phi: 3.191

# Note seasonal GPA fluctuation