setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/bid_data/raw_data/')

data_sor = read.csv('sor_gpa2.csv',header=TRUE,check.names=FALSE)

data_df_sor <- data.frame(data_sor,check.names=FALSE)

df_sor <- data_df_sor[c(1,6,8,9,10,11)]

line_sor <- gvisLineChart(df_sor, xvar='Time', yvar=colnames(df_sor[-1]),
                      options=list(
                        title='Sorority GPA',
                        fontSize=10,
                        vAxis.viewWindowMode='pretty',
                        hAxis.slantedTextAngle=90,
                        hAxis.textStyle='{fontSize:7}',
                        width=600,
                        height=500))
plot(line_sor)

# Higher Mean GPA
# Kappa Delta: 3.394
# Kappa Alpha Theta: 3.395
# Gamma Phi Beta: 3.387
# Kappa Kappa Gamma: 3.342
# Delta Gamma: 3.316