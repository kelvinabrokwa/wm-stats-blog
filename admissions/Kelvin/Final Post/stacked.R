# Written by: Kelvin Abrokwa-Johnson
# Total Applications Stacked Chart

setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')   # Make sure to change this working directory to fit your computer

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

Males <- male_apps
Females <- fem_apps
df_stacked <- data.frame(year, Males, Females)

stacked_chart <- gvisSteppedAreaChart(df_stacked, xvar="year", 
                                      yvar=c("Males", "Females"),
                                      options=list(title="Total Number of Applicants",
                                                   isStacked=TRUE,
                                                   vAxes="[{title:'Total Number of Applicants'}]",
                                                   hAxes="[{title:'Year'}]"))
plot(stacked_chart)
