## This project is part of Week 4 Assignment from the Getting and Cleaning Data Course
## This project will be shared on github.com public domain

Assignment Submission Files included

run_analysis.R
Readme.md
CookBook.md

Instructions for using the R script and running the analysis to get the tidy data required for further analysis

Checkout the code using 'git checkout https://github.com/eswariym/CleaningDataWk4.git YOURDIRECTORY'

Download the data set, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unzip the data set into YOURDIRECTORY and you should see a folder named UCI HAR Dataset in YOURDIRECTORY. In my case it is "temp"

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "UCI HAR Dataset.zip")
unzip("temp/UCI HAR Dataset.zip", exdir = "temp")
        
## To keep track of the version of the dataset based on the download date
        
dateDownloaded<-date()
# To make sure that the directory is set approriately

The R Script to perform the following steps during cleaning and tidying data

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Load RStudio and set your working directory using setwd("YOURDIRECTORY")

Load the R script using source("run_analysis.R")

Run the R script using run_analysis() and after execution of the function has finished, 
you will see that tidy_movement_data.txt which contain the averages of the mean and std variables that 
can be used for further analysis. Codebook describes the exact names of the variables and derived variables
in the final tidy dataset.

Dependencies

The R script assumes you have 'data.table' installed using install.packages("data.table")
More Information

For more information on the data set, please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones