# This R script was developed for the Coursera Getting and Cleaning Data
# course.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI_HAR_Dataset.zip", method = "curl")
unzip("./data/UCI_HAR_Dataset.zip", exdir="./data")

library(dplyr)
# Read the data into R
testdata <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("activity_id"))
traindata <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("activity_id"))
featureLabels <- read.table("./data/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id","activity"))
testSubjectId <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
trainSubjectId <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))

# get indicies of variables with 'mean' or 'std' in the name
meanStdVariables <- grep("mean|std", featureLabels$V2, value = FALSE)
# get the names of variables with 'mean' or 'std' in the name
meanStdVariableNames <- grep("mean|std", featureLabels$V2, value = TRUE)
# Add data_subset and activity column names
finalNames <- c(meanStdVariableNames, "subject_id", "data_subset", "activity")
# convert values to syntactically valid column names
finalNames <- make.names(finalNames, unique=TRUE)
# remove numbers and dots from values
finalNames <- gsub("([0-9])|(\\.)+", '', finalNames)

# expand abbreviated column names
finalNames <- gsub("[Ff]req", 'Frequency', finalNames)
finalNames <- gsub("^t", 'time', finalNames)
finalNames <- gsub("^f", 'frequency', finalNames)
finalNames <- gsub("Acc", 'Acceleration', finalNames)
finalNames <- gsub("std", 'StandardDeviation', finalNames)
finalNames <- gsub("[Mm]ag", 'Magnitude', finalNames)
finalNames <- gsub("mean", 'Mean', finalNames)

# extract indicies
testdata <- testdata[,meanStdVariables]
traindata <- traindata[,meanStdVariables]
# add activity_id and data_subset
testdata <- mutate(testdata, subject_id = testSubjectId$subject_id, activity_id = testActivities$activity_id, data_subset = 'TEST')
traindata <- mutate(traindata, subject_id = trainSubjectId$subject_id, activity_id = trainActivities$activity_id, data_subset = 'TRAIN')
# combine test and train datasets
combined <- bind_rows(testdata, traindata)
# join the activityLabels to the combined dataset by activity_id columns
combined_merged <- merge(combined, activityLabels, by="activity_id")
# remove activity_id column
final <- select(combined_merged, -activity_id)
# add names to columns
names(final) <- finalNames

# Cleanup R environment variables
rm(activityLabels, testdata, testActivities, testSubjectId, traindata, trainActivities, trainSubjectId, featureLabels, combined, combined_merged, finalNames, meanStdVariables, meanStdVariableNames)

# remove data_subset and subject_id columns, group by activity, and compute mean for remaining columns
activity <- final %>% select(-data_subset, -subject_id) %>% group_by(activity) %>% summarise_each(funs(mean))
# prepend column names with 'average_' except activity column
names(activity) <- c(names(activity)[1], paste("average", names(activity)[2:80], sep='_'))

# remove data_subset and activity columns, group by subject identifier, and compute mean for remaining columns
subject <- final %>% select(-data_subset, -activity) %>% group_by(subject_id) %>% summarise_each(funs(mean))
# prepend column names with 'average_' except subject_id column
names(subject) <- c(names(subject)[1], paste("average", names(subject)[2:80], sep='_'))

# combine datasets
tidyDataset <- bind_rows(activity, subject)
# reorder the subject_id column from the end to the second position
tidyDataset <- tidyDataset[,c(1,81,c(2:80))]

write.table(tidyDataset, file="tidyDataset.table", row.name=FALSE)
