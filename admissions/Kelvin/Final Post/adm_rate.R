# Written by: Kelvin Abrokwa-Johnson
# Admissions Rate Line Chart

setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/admissions/kelvin/final post')   # Make sure to change this working directory to fit your computer

library(googleVis)

raw = read.csv('agg_data_4.csv', header=TRUE, check.names=FALSE)

year <- c(raw$Year)

male_apps <- c(raw$'Total first-year men who applied') 
fem_apps <- c(raw$'Total first-year women who applied')
df_apps <- data.frame(year, Male=male_apps, Female=fem_apps)

male_adm <- c(raw$'Total first-year men who were admitted') 
fem_adm <- c(raw$'Total first-year women who were admitted')
df_adm <- data.frame(year, Male=male_adm, Female=fem_adm)

male_enr <- c(raw$'Total full-time first-year men who enrolled') 
fem_enr <- c(raw$'Total part-time first-year men who enrolled')
df_enr <- data.frame(year, Male=male_enr, Female=fem_enr)

male_adm_rate <- signif(((male_adm / male_apps) * 100), digits=4)
fem_adm_rate <- signif(((fem_adm / fem_apps) * 100), digits=4)
df_adm_rate <- data.frame(year, Male=male_adm_rate, Female=fem_adm_rate)

line_adm_rate <- gvisLineChart(df_adm_rate,
                               options=list(title="Acceptance Rate (number accepted / number of applicants)",
                                            vAxes="[{title:'Percentage'}]",
                                            hAxes="[{title:'Year'}]",
                                            fontSize=10,
                                            width=550))
plot(line_adm_rate)
