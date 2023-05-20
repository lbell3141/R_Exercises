#Lindsey Bell
#5/16/2023, 13:03
#Using yellow billed cuckoo survey data to complete R lab exercises

#Libraries used:
    library(lubridate)


#Load data into R in a usable format
#Use relative directory to tell R where to look (use 'getwd()'
#to see where in the directory you are and what you need to specify. 
#Here, I had to specify the folder 'YBCU_data/' before the csv file)

#second time loading up, had to specify full location:

ybc=read.csv("C:/Users/Asus PC/Documents/R_Projects/R_Exercises/YBCU_data/AESO_YBCU_Pre2022DataExport_WorkingCopy_20230118.csv", header=TRUE, na.strings=c("NR","RN","-","?", "NA"))

#Change misread types of data to their proper class, e.g.:

t_h=as.numeric(ybc$TotalHours)
typeof(t_h)

#Must remove NAs from var when calculating stats manually: 

mean(t_h, na.rm=TRUE)
sd(t_h, na.rm=TRUE)
mean_t_h=mean(t_h, na.rm=TRUE)
sd_t_h=sd(t_h, na.rm=TRUE)
    #use scale to make a standardized plot:
        plot(scale(t_h))


#finding best survey time with survey date and detection time
   #Problem: multi-day surveys.
      #convert the dates to a usable form; use sub-string to extract important values
      #limit mutli-day surveys to only reflect starting date
          m_d_survdat=substr(survdt, 1, 9)
    
      #change class from character to date
          mdy_survdat=as.Date(m_d_survdat, format = "MM/DD/YYYY") 
    
      #convert to a usable format for R using lubridate
          mdy_survdat=mdy(m_d_survdat)
    
  #extract survey dates
    dayofyear_survdat=format(mdy_survdat, "%j")
    ybc$Month=months(mdy_survdat)
  
  #formatting number obs (with detection time)
    #plot doesn't display correctly: there should certainly be more points on it!
    plot(dayofyear_survdat, ybc$TimeDetect)
    
    #we can double check that there should be more points by plotting another variable
    #that could represent detections. Here, we chose to plot number of calls,
    #since NumCalls is only recorded if a detection is made
    #new plot 
    plot(dayofyear_survdat, ybc$NumCalls,
         main = "Suvery Date vs. Number of Calls",
         xlab = "Survey Date",
         ylab = "Num of Calls",
         xlim = c(150,268)
    )
    grid()
    
  #can likely fix this plot by converting detection times from char to num (using lubridate)
    
    library(lubridate)
    dt=ybc$TimeDetect
      #many detection times also include AM, so use substring to pull out only numeric values
        dt_clean=substr(dt, 1,5)
      #use lubridate to pull out numeric hour and minute (all observations are in the morning, 
      #so no need to convert to 24hr clock)
         dt_clean=hm(dt_clean)
         typeof(dt_clean)
  
  #plot should look much more reasonable now:
   plot(dayofyear_survdat, dt_clean,
        main = "Suvery Date vs. YBC Detection Time",
        xlab = "Survey Date",
        ylab = "Detection Time",
        xlim = c(150,270),
        yaxt="n"
        )
    grid()
  

    plot(ybc$Month, dt_clean,
         main = "Suvery Date vs. YBC Detection Time",
         xlab = "Survey Date",
         ylab = "Detection Time",
    )
    grid()
  
  
  