#Lindsey Bell
#5/16/2023, 13:03
#Using yellow billed cuckoo survey data to complete R lab exercises

#Load data into R in a usable format
#Use relative directory to tell R where to look (use 'getwd()'
#to see where in the directory you are and what you need to specify. 
#Here, I had to specify the folder 'YBCU_data/' before the csv file)
  ybc=read.csv("YBCU_data/AESO_YBCU_Pre2022DataExport_WorkingCopy_20230118.csv", header=TRUE)



