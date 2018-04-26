# Getting and Cleaning Data Course Project (UCI-HAR)

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Assignment
1. Create a `run_analysis` file to perform all the steps
2. Load the data from the `X_`, `y_`, `subject_` into R and merge all the files into one whole train or test dataset
3. Merge train and test dataset as one new dataset
4. While importing the files assign self defined column names to all the columns.
5. Merge the combined data to add the activity description to the activity number present in the main merged file, Appropriately labels the data set with descriptive variable names.
6. Extracts only the measurements on the mean and standard deviation for each measurement, which can be identified by the presence of `mean` and `std` in the name of the variables
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, Tidy the dataset using `gather` function to create key value pairs.
8. Create a smaller tidy dataset with the average measurement according to the group by categorization of each variable for each activity and each subject.
9. Write the datasets into `harTidy` and `harSummary` files respectively 

### Result 
1. `run_analysis.R` file, which consists of all the code used to perform the analysis
2. `readme.md`, which explains how the scripts work and how they are connected
3. `CodeBook.md`, which describes the variables, data and transformations that have been performed during the data analysis
4. `HARTidyData.txt`, which contains the long format dataset
5. `HARSummaryData.txt`, whcih contains the summary by subject, activity and measurement calculated
