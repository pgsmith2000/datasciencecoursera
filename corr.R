corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
 

  filenames <- list.files(path = directory, full.names = TRUE)
  nobs <- vector(mode="logical", length = length(filenames))
  output <- vector(mode="numeric", length=0)
  
  for(i in 1:length(filenames)) {
      nobs[i] <- sum(complete.cases(read.csv(filenames[i])))
  }
      filenames <- filenames[nobs > threshold]
      if(length(filenames)>0){
        output <- vector(mode="numeric", length=length(filenames))
  
        for(i in 1:length(filenames)) {
          filedata <- read.csv(filenames[i])
          filedata <- filedata[complete.cases(filedata), 2:3]
          output[i] <- cor(filedata$sulfate,filedata$nitrate)
        }
      return(output)
      } else return(output)
}
