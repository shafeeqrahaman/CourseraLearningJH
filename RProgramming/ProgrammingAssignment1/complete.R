#--------------------------------------START-------------------------------------------
#PROGRAMMING ASSIGNMENT 1 PART 2

#Download the dataset and unzip
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip")

#Actual function to be created
complete <- function(directory, id = 1:332) {
    complete_cases <- data.frame()
    for(i in id) {
        complete_cases <- rbind(complete_cases, c(i, sum(complete.cases(read.csv(files[i])))))
        colnames(complete_cases) <- c("id", "nobs")
    }
    complete_cases
}

#Verifying the part 2 logic with the demo script results
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
#-----------------------------------------END-----------------------------------------


#--------------------------------------START-------------------------------------------
#Learning/Experimentation - Part 2 Script
#Learning - Part 2 Script
sum(complete.cases(read.csv(files[3])))
#-----------------------------------------END-----------------------------------------