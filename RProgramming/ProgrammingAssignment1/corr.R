#--------------------------------------START-------------------------------------------
#PROGRAMMING ASSIGNMENT 1 PART 3

#Download the dataset and unzip
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip")

#Actual code
corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.names = TRUE)
    correlate <- numeric()
    for(i in 1:332) {
        dataset <- read.csv(files[i])
        if(sum(complete.cases(dataset))> threshold)
        {
            cor_individual <- cor(dataset["sulfate"], dataset["nitrate"], use = "complete.obs")
            correlate <- c(correlate, cor_individual)
        }
    }
    correlate
}

#Verifying the part 3 logic with the demo script results
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
#-----------------------------------------END-----------------------------------------





