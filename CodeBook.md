Code Book

This code book includes information on demonstration of how a tidy dataset can be prepared from untidy source data. 
This code book describes the steps from downloading the the source data, the data transformations performed 
after collecting data to get a tidy data set containing average values of variables.

Study Design

The source data was available at the following link from the UCI Machine Learning Repository to complete an assignment for a Coursera course named Getting and Cleaning Data.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

There are several steps involved during the tidy data preparation process.

The source data was downloaded and unzipped into appropriate working directory
The datasets from training and testing are available separately as .txt files
The X_datasets contain activity values
The y_datasets contain activity id
The .txt files were read as data tables for easy processing of datasets
Subject ID information is available is separate dataset
Loaded vairable names from features.txt file also as data tables 
Select the 2nd column containing column labels from features table so that it can be added as labels to the merged test and train datasets using rbind
Selected only the mean and standard deviation variables using grep to extract the variables with mean and std
Combined the data tables to produce one data table "All_data" containing the subjects, measurements and activities
Replaced activity IDs with the activity labels for readability
Created another data set using the data.table library to easily group the tidy data by subject and activity in long format using "melt" so that data can be summarized
This data is summarized using dcast function in library(reshape2)
Produced "Finaldata.txt" as the tidy data which contain the average of each activity for each subject
Please refer to run_analysis.R for implementation details.

Variables

Subject_ID: 1 to 30 each representing a participant in the study
Activity: the average activity that the subject was doing at the time of the measurement resulting a total of 66 variables

tBodyAcc-mean-X
tBodyAcc-mean-Y
tBodyAcc-mean-Z
tBodyAcc-std-X
tBodyAcc-std-Y
tBodyAcc-std-Z
tGravityAcc-mean-X
tGravityAcc-mean-Y
tGravityAcc-mean-Z
tGravityAcc-std-X
tGravityAcc-std-Y
tGravityAcc-std-Z
tBodyAccJerk-mean-X
tBodyAccJerk-mean-Y
tBodyAccJerk-mean-Z
tBodyAccJerk-std-X
tBodyAccJerk-std-Y
tBodyAccJerk-std-Z
tBodyGyro-mean-X
tBodyGyro-mean-Y
tBodyGyro-mean-Z
tBodyGyro-std-X
tBodyGyro-std-Y
tBodyGyro-std-Z
tBodyGyroJerk-mean-X
tBodyGyroJerk-mean-Y
tBodyGyroJerk-mean-Z
tBodyGyroJerk-std-X
tBodyGyroJerk-std-Y
tBodyGyroJerk-std-Z
tBodyAccMag-mean
tBodyAccMag-std
tGravityAccMag-mean
tGravityAccMag-std
tBodyAccJerkMag-mean
tBodyAccJerkMag-std
tBodyGyroMag-mean
tBodyGyroMag-std
tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std
fBodyAcc-mean-X
fBodyAcc-mean-Y
fBodyAcc-mean-Z
fBodyAcc-std-X
fBodyAcc-std-Y
fBodyAcc-std-Z
fBodyAccJerk-mean-X
fBodyAccJerk-mean-Y
fBodyAccJerk-mean-Z
fBodyAccJerk-std-X
fBodyAccJerk-std-Y
fBodyAccJerk-std-Z
fBodyGyro-mean-X
fBodyGyro-mean-Y
fBodyGyro-mean-Z
fBodyGyro-std-X
fBodyGyro-std-Y
fBodyGyro-std-Z
fBodyAccMag-mean
fBodyAccMag-std
fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std
fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std
fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std
