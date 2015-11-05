complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  

    filenames <- rep(directory,length(id))
    filenames <- paste(directory,"/",formatC(id, width=3, flag="0"),".csv", sep="")
    
    nobs <- vector(mode="logical", length = length(id))
    for(i in 1:length(filenames)) {
      
      nobs[i] <- sum(complete.cases(read.csv(filenames[i])))
    }
    output_df <- cbind(id, nobs)
    return(output_df)
}
   