# Generating the all-encompassing motion chart

library(googleVis)

setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')

#data.wide <- read.csv('agg_data_4.csv', header=TRUE, check.names=FALSE)

#data.wide$Year <- factor(data.wide$Year)
#View(data.wide)

#library(reshape2)

#data.long <- melt(data.wide, id.vars=c("Year"))
#View(data.long)

data.long <- read.csv("agg_data_long.csv", header=TRUE)

motion = gvisMotionChart(data.long, idvar="variable", timevar="year")
plot(motion)

#------------------------------------------------------------------------------------------------------------------
# Individual Line Charts

raw = read.csv('agg_data_4.csv', header=TRUE, check.names=FALSE)

year <- c(raw$Year)

male_apps <- c(raw$Total.first.time..first.year.men.who.applied) 
fem_apps <- c(raw$Total.first.time..first.year.women.who.applied)
df_apps <- data.frame(year, Male=male_apps, Female=fem_apps)

male_adm <- c(raw$Total.first.time..first.year.men.who.were.admitted) 
fem_adm <- c(raw$Total.first.time..first.year.women.who.were.admitted)
df_adm <- data.frame(year, Male=male_adm, Female=fem_adm)

male_enr <- c(raw$Total.full.time..first.time..first.year.men.who.enrolled) 
fem_enr <- c(raw$Total.full.time..first.time..first.year.women.who.enrolled)
df_enr <- data.frame(year, Male=male_enr, Female=fem_enr)

line_apps <- gvisLineChart(df_apps,
                           options=list(title='Number of Applications by Year',
                                        vAxes="[{title:'Number of Aplicants'}]",
                                        hAxes="[{title:'Year'}]"))
plot(line_apps)
line_adm <- gvisLineChart(df_adm,
                          options=list(title='Number Admitted by Year',
                                       vAxes="[{title:'Number Admitted'}]",
                                       hAxes="[{title:'Year'}]"))
plot(line_adm)
line_enr <- gvisLineChart(df_enr,
                          options=list(title='First Time Enrollment by Year',
                                       vAxes="[{title:'Number Enrolled'}]",
                                       hAxes="[{title:'Year'}]"))
plot(line_enr)

#------------------------------------------------------------------------------------------------------------------
# Admissions Rate Line Chart

male_adm_rate <- signif(((male_adm / male_apps) * 100), digits=4)
fem_adm_rate <- signif(((fem_adm / fem_apps) * 100), digits=4)
df_adm_rate <- data.frame(year, Male=male_adm_rate, Female=fem_adm_rate)

line_adm_rate <- gvisLineChart(df_adm_rate,
                               options=list(title="Acceptance Rate (number accepted / number of applicants)",
                                            vAxes="[{title:'Percentage'}]",
                                            hAxes="[{title:'Year'}]"))
plot(line_adm_rate)


#------------------------------------------------------------------------------------------------------------------
# Number of Applicants stacked area chart

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

#------------------------------------------------------------------------------------------------------------------
# Admission versus Enrollment

df_adm_enr <- data.frame(year,male_adm,fem_adm,male_enr,fem_enr)

line_adm_enr <- gvisLineChart(df_adm_enr,
                              options=list(title="Number of Students Admitted Compared to Number of Students Enrolled",
                                           vAxes="[{title:'Number of Students'}]",
                                           hAxes="[{title:'Year'}]"))
plot(line_adm_enr)
