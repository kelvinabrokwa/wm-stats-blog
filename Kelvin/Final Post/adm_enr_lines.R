# Written by: Kelvin Abrokwa-Johnson
# Admissions versus Enrollment Line Chart

library(googleVis)

setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')   # Make sure to change this working directory to fit your computer

raw = read.csv('agg_data_4.csv', header=TRUE, check.names=FALSE)

year <- c(raw$Year)

male_apps <- c(raw$'Total first-year men who applied') 
fem_apps <- c(raw$'Total first-year women who applied')
df_apps <- data.frame(year, Male=male_apps, Female=fem_apps)

Male_Admission <- c(raw$'Total first-year men who were admitted') 
Female_Admission <- c(raw$'Total first-year women who were admitted')
df_adm <- data.frame(year, Male=Male_Admission, Female=Female_Admission)

Male_Enrollment <- c(raw$'Total full-time first-year men who enrolled') 
Female_Enrollment <- c(raw$'Total full-time first-year women who enrolled')
df_enr <- data.frame(year, Male=male_enr, Female=fem_enr)

df_adm_enr <- data.frame(year,Male_Admission,Female_Admission,Male_Enrollment,Female_Enrollment)



line_adm_enr <- gvisLineChart(df_adm_enr,
                              options=list(title="Number of Students Admitted Compared to Number of Students Enrolled",
                                           vAxes="[{title:'Number of Students'}]",
                                           hAxes="[{title:'Year'}]"))
plot(line_adm_enr)
