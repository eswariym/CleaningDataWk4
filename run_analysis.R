
        library(reshape2)
        library(dplyr)
        
        ## First, read all required .txt files and label the datasets
        
        ## Read all activities and their names and label the aproppriate columns 
        activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
        
        ## This work is part of the Assignment for Getting and Cleaning Data Course- Wk4
        
        ## Create a temp directory to unzip and extract the files into a folder "temp"
        dir.create("temp")
        
        ## download file 
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "UCI HAR Dataset.zip")
        unzip("UCI HAR Dataset.zip", exdir = "temp")
        unzip("temp/UCI HAR Dataset.zip", exdir = "temp")
        
        ## To keep track of the version of the dataset based on the download date
        
        dateDownloaded<-date()
        
        # To make sure that the directory is set approriately
        getwd()
        setwd("C:/Users/vmuthukr/DataScience/CleaningData/Wk4")
        
        ## To confirm the files in the exist in the directory
        dir()
        
        # Start loading files into R directory
        
        Xtest <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/test/X_test.txt")
        Ytest <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/test/y_test.txt")
        Subject_test <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/test/subject_test.txt")
        
        Xtrain <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/train/X_train.txt")
        Ytrain <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/train/y_train.txt")
        Subject_train <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/train/subject_train.txt")
        
        features_list <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/features.txt")
        activity_labels <- read.table("C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/UCI HAR Dataset/activity_labels.txt")
        
        ## Read the dataframe's column names
        feature_labels <-  features_list[,2]
        length(feature_labels)

        Raw_Test_Train <- rbind(Xtest,Xtrain)
        colnames(Raw_Test_Train) <- feature_labels
        head(Raw_Test_Train)
        dim(Raw_Test_Train)
        
        Activity_Id <- rbind(Ytest, Ytrain)
        colnames(Activity_Id) <- "activity_id"
        
        colnames(activity_labels) <- c("activity_id", "activity_name")
        head(activity_labels)
        
        
        Subject_Id <- rbind(Subject_test, Subject_train)
        colnames(Subject_Id) <- "subject_id"
        head(Subject_Id)
        
        ## Keep only columns containing mean() or std() values
        
        meanStdIndices <- grep("mean\\(\\)|std\\(\\)", names(Raw_Test_Train), ignore.case = TRUE)
        
        ## To confirm the number of columns with mean and std values 
        dim(meanStdIndices)
        length(meanStdIndices)
        head(meanStdIndices)
        
        ## To update the dataset including only mean std values in the dataset
        meanstd_data <- Raw_Test_Train[, meanStdIndices]
        dim(meanstd_data)
        head(meanstd_data)
        
        ## Combine subject id, activity id and the raw data for test and train combined
        All_data <- cbind(Subject_Id , Activity_Id, meanstd_data)
        head(All_data)
        dim(All_data)
        
        ##Merge the activities datase with the mean/std values datase 
        ##to get one dataset with descriptive activity names
        descrnames <- merge(activity_labels, All_data, by = "activity_id", all=TRUE)
        dim(descrnames)
        
        ## Melt dataset to long format so that mean on each variable can be estimated
        
        library(reshape2)
        All_data_long <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
        
        ## To make sure that the data is converted to long format
        head(All_data_long)
        
        
        ##Cast the dataset according to  the average of each variable for each activity and each subject
        mean_data <- dcast(All_data_long, activity_id + activity_name + subject_id ~ variable, mean)
        head(mean_data)
        
        
        ## Create a readable file with the new tidy dataset in tabular format
        write.table(mean_data,"C:/Users/vmuthukr/DataScience/CleaningData/Wk4/temp/Finaldata.txt")
        
        ## To confirm the tidy dataset exists in the readable and expected format
        
        head(TestTidyDataset)
        dim(TestTidyDataset)
