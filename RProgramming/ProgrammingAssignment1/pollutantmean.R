#--------------------------------------START-------------------------------------------
#PROGRAMMING ASSIGNMENT 1 PART 1

#Download the dataset and unzip
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip")

#Actual function to be created
pollutantmean <- function(directory, pollutant, id=1:332) {
    files <- list.files(directory, full.names = TRUE)
    combined_dataset <- data.frame()
    for(i in id) {
        combined_dataset <- rbind(combined_dataset, read.csv(files[i]))
    }
    mean(combined_dataset[,pollutant],na.rm = TRUE)
}

#Verifying with the demo script results
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
#-----------------------------------------END-----------------------------------------

#--------------------------------------START-------------------------------------------
#Learning/Experimentation - Part 1 Script
#Download the dataset
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip")

#Get list of all files in the folder
files <- list.files("specdata", full.names = TRUE)
files[2:5]
head(read.csv(files[4]))

#Combining all the files into one data frame
full_dataset <- data.frame()
for(i in 1: 332) {
    full_dataset <- rbind(full_dataset, read.csv(files[i]))
}
str(full_dataset)
#-----------------------------------------END-----------------------------------------
