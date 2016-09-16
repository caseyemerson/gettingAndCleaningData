# Getting And Cleaning Data - Final Project
This repo contains the final project for the Coursera Getting and Cleaning Data course. There are two files: `run_analysis.R` and `tidy.txt`. The `run_analysis.R` script contains the commented R code to create the `tidy.txt` dataset.

## About the Dataset
The original [zipped data set] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) comes from the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## About the Script
The `run_analysis.R` script does the following:

0. Loads DPLYR, downloads the data set, unzips the data and reads it into the tables. 
1. Merges the training and the test data sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set is saved to the current working directory as `tidy.txt`.

The output of `run_analysis.R` is a text file called `tidy.txt`. For a description of the tidy dataset, its variables, and transformations performed to clean up the data, please see the [CodeBook](https://raw.githubusercontent.com/caseyemerson/gettingAndCleaningData/master/codebook.md).
