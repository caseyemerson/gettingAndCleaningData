# Getting And Cleaning Data - Final Project
This repo contains the final project for the Coursera Getting and Cleaning Data course. There are two files: **run_analysis.R** and **tidy.txt**. run_analysis.R contains the commented R code to create the tidy.txt dataset.

The `run_analysis.R` script does the following:

0. Loads necessary packages, downloads the dataset, unzips the data and reads it into the tables. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This dataset is saved to the current working directory as `tidy.txt`.

The output of `run_analysis.R` is a txt file called `tidy.txt`.

For a description of the tidy dataset, its variables, and transformations performed to clean up the data, please see the [code book](https://raw.githubusercontent.com/caseyemerson/gettingAndCleaningData/master/codebook.md).
