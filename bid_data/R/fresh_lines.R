data_men <- read.csv('men_year.csv',header=TRUE,check.names=FALSE)
data_women <- read.csv('women_year.csv',header=TRUE,check.names=FALSE)

df_men <- data.frame(data_men,check.names=FALSE)
df_women <- data.frame(data_women,check.names=FALSE)

df_men_06 <- df_men[c(1,2,5)]
df_women_06 <- df_women[c(1,2,5)]

df1 <- df_men_06[c(-1)]
df2 <- df_women_06[c(-1)]

years <- df_men[1]
all <- data.frame(c(years,df1,df2),check.names=FALSE)

real_all <- all[10:17,]

lines <- gvisLineChart(real_all, xvar='Year', yvar=colnames(all[-1]),
                       options=list(
                         title='Percentage of Freshmen Joining Greek Life',
                         fontSize=11,
                         width=600,
                         height=400))
plot(lines)
