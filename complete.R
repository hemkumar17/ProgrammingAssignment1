#Write a function that reads a directory full of files and reports the number of 
#completely observed cases in each data file. The function should return a 
#data frame where the first column is the name of the file and the second 
#column is the number of complete cases.

complete <- function(directory, id = 1:332) {
  
  file.dir <- paste("E:/Coursera_RProg/", directory, sep="")
  
  #setwd(filepath)
 
  complete.nobsCount <- c()
  complete.nobsID <- c()
  
  for(fileID in id)
  {
    file.path <- paste(file.dir, "/", sprintf("%03d", fileID),".csv", sep="")
    
    nobsdata <- na.omit(read.csv(file = file.path))
    
    complete.nobsID <- append(complete.nobsID, fileID)
   
    complete.nobsCount <- append(complete.nobsCount, nrow(nobsdata))
  }
  
  #cbind(complete.nobsID, complete.nobsCount)
  
  data.frame(id = complete.nobsID, nobs = complete.nobsCount)
}
