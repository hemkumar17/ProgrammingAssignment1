#Write a function that takes a directory of data files and a threshold for complete cases and 
#calculates the correlation between sulfate and nitrate for monitor locations where the number 
#of completely observed cases (on all variables) is greater than the threshold. The function 
#should return a vector of correlations for the monitors that meet the threshold requirement. 
#If no monitors meet the threshold requirement, then the function should return a numeric 
#vector of length 0

corr <- function (directory, threshold = 0) {
  
  ids.aboveThres <- subset(complete(directory), nobs > threshold)
  
  file.dir <- paste("E:/Coursera_RProg/", directory, sep="")

  corValue <- c()

  for(fileID in ids.aboveThres[,1])
  {
    file.path <- paste(file.dir, "/", sprintf("%03d", fileID),".csv", sep="")
    pdata <- na.omit(read.csv(file = file.path))
    corValue <- append(corValue, cor(pdata$sulfate, pdata$nitrate))
  }
  corValue
}
