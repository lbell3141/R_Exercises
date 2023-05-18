#Lindsey Bell
#5/16/2023, 13:03
#Using yellow billed cuckoo survey data to complete R lab exercises

#Load data into R in a usable format
#Use relative directory to tell R where to look (use 'getwd()'
#to see where in the directory you are and what you need to specify. 
#Here, I had to specify the folder 'YBCU_data/' before the csv file)

#second time loading up, had to specify full location:

ybc=read.csv("C:/Users/Asus PC/Documents/R_Projects/R_Exercises/YBCU_data/AESO_YBCU_Pre2022DataExport_WorkingCopy_20230118.csv", header=TRUE, na.strings=c("NR","RN","-","?", "NA"))

getwd()
             
#Change misread types of data to their proper class
#Be sure to assign as.numeric

ybc$TotalHours=as.numeric(ybc$TotalHours)
typeof(ybc$TotalHours)

t_h=as.numeric(ybc$TotalHours) 
typeof(t_h)

mean(ybc$Year)

plot(ybc$TotalNumCuckoos)
 length(ybc$TotalHours)
ybc$TotalHours

mean(t_h, na.rm=TRUE)
sd(t_h, na.rm=TRUE)
mean_t_h=mean(t_h, na.rm=TRUE)
sd_t_h=sd(t_h, na.rm=TRUE)

mean_t_h
sd_t_h

?scale
scale(t_h)
plot(scale(t_h))

d= as.Date.character(ybc$SurveyDate, na.rm)
(ybc$SurveyDate)
julian(d)
 
#finding best survey time with survey date and detection time
#Problem: multi-day surveys.
#convert the dates to a usable form OR use sub-string to extract important values
  #install lubridate package
    install.packages("pacman")
    pacman::p_load(lubridate)
  #remove NA dates and renamed
    survdt_clean=na.omit(ybc$SurveyDate)
    survdt=ybc$SurveyDate
  #limit mutliday surveys to only reflect starting date
    m_d_survdat=substr(survdt, 1, 9)
  #change class from character to date
    mdy_survdat=as.Date(m_d_survdat, format = "MM/DD/YYYY") 
  #convert to a usable format for R
    mdy_survdat=mdy(m_d_survdat)
  #extract month and day
    m_survdat=format(mdy_survdat, "%m")
    d_survdat=format(mdy_survdat, "%d") 
    dayofyear_survdat=format(mdy_survdat, "%j")
  
  #formatting number obs (with detection time)
    plot(dayofyear_survdat, ybc$TimeDetect)
  #converting time from char to num
    dt=ybc$TimeDetect
    dt_d=as.Date(dt, format = "H:M")
    dt=strptime(dt_d, format= "%H:%M")
    dt=format(dt, "%H:%M")
  #can't get just the time of day- keep getting a made up full date ^
    
  #extracting hour:
   i_dt= hour(dt_d)
   
#creating plot
   plot(dayofyear_survdat, dt,
        main = "Suvery Date vs. YBC Detection Time",
        xlab = "Survey Date",
        ylab = "Detection Time",
        xlim = c(170,220)
        )
  grid()
  
#new plot 
  plot(dayofyear_survdat, ybc$NumCalls,
       main = "Suvery Date vs. Number of Calls",
       xlab = "Survey Date",
       ylab = "Num of Calls",
       xlim = c(150,268)
  )
  grid()
  
  plot(dayofyear_survdat)
  