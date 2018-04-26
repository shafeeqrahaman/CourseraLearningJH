library(dplyr)
library(tidyr)

##1. Loading Data files
activity <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/activity_labels.txt", col.names = c("activityNum","activityLabel"))
features <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/features.txt", col.names = c("featureNum","featureLabel"))

###test data
test_subject <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
test_x <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/test/X_test.txt",col.names = features$featureLabel)
test_y <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/test/y_test.txt", col.names = "activityNum")

###train data
train_subject <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_x <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/train/X_train.txt", col.names = features$featureLabel)
train_y <- read.table("/Users/shafeeqrahaman/Documents/R/Coursera/Getting and Cleaning data/Week4/UCI HAR Dataset/train/y_train.txt", col.names = "activityNum")

##2. Merging the test and train datasets
test_all <- cbind(test_subject, test_x, test_y)
train_all <- cbind(train_subject, train_x, train_y)

##3. Merge test and train data
harFull <- rbind(train_all, test_all)

##4. Extract data only on mean & sd of measurements
harMini <- harFull %>% select(subject, activityNum, contains("mean"), contains("std"), -contains("meanfreq")) %>% arrange(subject, activityNum)

##5. Replace the activity number with appropriate labels from descriptive variable names
harMerge <- harMini %>% merge(activity, by = "activityNum")
###Placing the three categorical columns in the first
harMerge <- harMerge %>% select(subject, activityNum, activityLabel, 3:75) %>%
    arrange(subject, activityNum)
###Convert categorical columns from int to factors
harMerge$subject <- as.factor(harMerge$subject)
harMerge$activityNum <- as.factor(harMerge$activityNum)

##6. Tidy the dataset by gathering the columns into key value pairs
harTidy <- harMerge %>% gather("variable", "measurement", 4:76)

##7. average of each variable for each activity and each subject.
harSummary <- harTidy %>% group_by(subject, activityLabel, variable) %>% 
    summarise(variable_average = mean(measurement))

##8. Write the Tidy and the Summary data into separate files
write.table(harTidy, file = "HARTidyData.txt", sep = " ", row.names = FALSE)
write.table(harSummary, file = "HARSummaryData.txt", sep = " ", row.names = FALSE)
