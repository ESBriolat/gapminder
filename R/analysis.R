file_read<-function(fileName,...){#function to read files in specific way
  read.csv(fileName, header=TRUE, stringsAsFactors = FALSE,...)
}