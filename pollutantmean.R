#Write a function named 'pollutantmean' that calculates the mean of a 
#pollutant (sulfate or nitrate) across a specified list of monitors. 
#The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
#and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads 
#that monitors' particulate matter data from the directory specified 
#in the 'directory' argument and returns the mean of the pollutant across 
#all of the monitors, ignoring any missing values coded as NA. 
 
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  file.dir <- paste("E:/Coursera_RProg/", directory, sep="")
  
  mean.data <- c()
  
  for(file in id)
  {
    file.path <- paste(file.dir, "/", sprintf("%03d", file),".csv", sep="")
    
    #print(filename)
    
    pdata <- na.omit(read.csv(file = file.path))
    
    #print(pdata)
    
    if(pollutant == "sulfate")
    {
      mean.data <- append(mean.data, pdata[,2])
    }
    else if(pollutant == "nitrate")
    {
      mean.data <- append(mean.data, pdata[,3])
    }
  }
      #round(mean(mean.data), digits = 3)
      mean(mean.data)
}
