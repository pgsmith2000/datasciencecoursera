pollutantmean <- function(directory, pollutant, id = 1:332) {
 # print(directory)
  #print(pollutant)
  #print(id)
  
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result
  
  if (!file.exists(directory)){
    cat("Must provide a valid directory name!")
  } else {
 

  filenames <- rep(directory,length(id))
  filenames <- paste(directory,"/",formatC(id, width=3, flag="0"),".csv", sep="")
  alldata <- data.frame(Date=as.Date(character()),
                    sulfate=numeric(), 
                   nitrate=numeric(), 
                   ID=integer()
                   ) 

  for(i in 1:length(filenames)) {
    monitordata <- read.csv(filenames[i])
    alldata <- rbind(alldata, monitordata)
  }
  
  mean(alldata[, eval(pollutant)], na.rm = TRUE)
  
}
}