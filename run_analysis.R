# Getting & Cleaning Data
# Final Assignment

#0. LOAD LIBRARIES, DOWNLOAD DATASET, UNZIP, AND LOAD INTO TABLES #
library(dplyr)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI_HAR_Dataset.zip", method = "curl")
unzip("./data/UCI_HAR_Dataset.zip", exdir="./data")

testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

trainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE, as.is = TRUE, col.names = c("id", "feature"))
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("id", "activity"))


#1. Merge the training and the test sets to create one data set.
test <- cbind(testLabels, testSubject, testData)
train <- cbind(trainLabels, trainSubject, trainData)
dataset <- rbind(test,train)
names(dataset) <- c("activity", "subject", as.character(features[,2]))
dataset$subject <-as.factor(dataset$subject)
# remove duplicate columns
dataset <- dataset[, !duplicated(colnames(dataset))]


#2. Extract only the measurements on the mean and standard deviation for each measurement.
extractedData <-select(dataset, activity, subject, contains("mean()"), contains("std()"))


#3. Use descriptive activity names to name the activities in the data set
activities <- mutate(activities, activity=tolower(activity))
extractedData$activity[extractedData$activity==1] <- activities$activity[1]
extractedData$activity[extractedData$activity==2] <- activities$activity[2]
extractedData$activity[extractedData$activity==3] <- activities$activity[3]
extractedData$activity[extractedData$activity==4] <- activities$activity[4]
extractedData$activity[extractedData$activity==5] <- activities$activity[5]
extractedData$activity[extractedData$activity==6] <- activities$activity[6]
extractedData$activity <- as.factor(extractedData$activity)


#4. Appropriately labels the data set with descriptive variable names.
names(extractedData) <- gsub("^t", "time", names(extractedData))
names(extractedData) <- gsub("^f", "frequency", names(extractedData))
names(extractedData) <- gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData) <- gsub("[Mm]ag", 'Magnitude', names(extractedData))
names(extractedData) <- gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData) <- gsub('mean', 'Mean', names(extractedData))
names(extractedData) <- gsub('std', 'Std', names(extractedData))
names(extractedData) <- gsub("\\-", "\\.", names(extractedData))
names(extractedData) <- gsub("\\(|\\)", "", names(extractedData))
names(extractedData) <- gsub("BodyBody", "Body", names(extractedData))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataset <- extractedData %>% group_by(subject, activity) %>%
    summarise_each(funs(mean(.,na.rm=TRUE)),-subject, -activity)

write.table(tidyDataset, file="tidy.txt", row.name=FALSE)
