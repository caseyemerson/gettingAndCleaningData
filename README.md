# Getting And Cleaning Data - Final
This repo contains the final project for the Coursera Getting and Cleaning Data course. There are two files: **run_analysis.R** and **tidyDataset.table**. run_analysis.R contains the commented R code to create the tidyDataset.table file.

The run_analysis.R code downloads the zipped UCI HAR Dataset, extracts the dataset, and loads the files. From there it assembles the dataset from the initial train and test datasets and adds column names. It then extracts the columns that contain the ordered letters of 'mean' or 'std'. From there activities and subject identifiers are added to the dataset and then groubed by both subject and activity. The data is recombined and written to a table. 


##Code Book##
The following reatures were originally generated from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The feature names were prepended with 'average_' to denote that the value is the arithmetic mean of the values. The original codebook is pasted below:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"activity" : Factor with 6 levels
"subject_id" : number from 1 - 30
"average_timeBodyAccelerationMeanX"
"average_timeBodyAccelerationMeanY"
"average_timeBodyAccelerationMeanZ"
"average_timeBodyAccelerationStandardDeviationX"
"average_timeBodyAccelerationStandardDeviationY"
"average_timeBodyAccelerationStandardDeviationZ"
"average_timeGravityAccelerationMeanX"
"average_timeGravityAccelerationMeanY"
"average_timeGravityAccelerationMeanZ"
"average_timeGravityAccelerationStandardDeviationX"
"average_timeGravityAccelerationStandardDeviationY"
"average_timeGravityAccelerationStandardDeviationZ"
"average_timeBodyAccelerationJerkMeanX"
"average_timeBodyAccelerationJerkMeanY"
"average_timeBodyAccelerationJerkMeanZ"
"average_timeBodyAccelerationJerkStandardDeviationX"
"average_timeBodyAccelerationJerkStandardDeviationY"
"average_timeBodyAccelerationJerkStandardDeviationZ"
"average_timeBodyGyroMeanX"
"average_timeBodyGyroMeanY"
"average_timeBodyGyroMeanZ"
"average_timeBodyGyroStandardDeviationX"
"average_timeBodyGyroStandardDeviationY"
"average_timeBodyGyroStandardDeviationZ"
"average_timeBodyGyroJerkMeanX"
"average_timeBodyGyroJerkMeanY"
"average_timeBodyGyroJerkMeanZ"
"average_timeBodyGyroJerkStandardDeviationX"
"average_timeBodyGyroJerkStandardDeviationY"
"average_timeBodyGyroJerkStandardDeviationZ"
"average_timeBodyAccelerationMagnitudeMean"
"average_timeBodyAccelerationMagnitudeStandardDeviation"
"average_timeGravityAccelerationMagnitudeMean"
"average_timeGravityAccelerationMagnitudeStandardDeviation"
"average_timeBodyAccelerationJerkMagnitudeMean"
"average_timeBodyAccelerationJerkMagnitudeStandardDeviation"
"average_timeBodyGyroMagnitudeMean"
"average_timeBodyGyroMagnitudeStandardDeviation"
"average_timeBodyGyroJerkMagnitudeMean"
"average_timeBodyGyroJerkMagnitudeStandardDeviation"
"average_frequencyBodyAccelerationMeanX"
"average_frequencyBodyAccelerationMeanY"
"average_frequencyBodyAccelerationMeanZ"
"average_frequencyBodyAccelerationStandardDeviationX"
"average_frequencyBodyAccelerationStandardDeviationY"
"average_frequencyBodyAccelerationStandardDeviationZ"
"average_frequencyBodyAccelerationMeanFrequencyX"
"average_frequencyBodyAccelerationMeanFrequencyY"
"average_frequencyBodyAccelerationMeanFrequencyZ"
"average_frequencyBodyAccelerationJerkMeanX"
"average_frequencyBodyAccelerationJerkMeanY"
"average_frequencyBodyAccelerationJerkMeanZ"
"average_frequencyBodyAccelerationJerkStandardDeviationX"
"average_frequencyBodyAccelerationJerkStandardDeviationY"
"average_frequencyBodyAccelerationJerkStandardDeviationZ"
"average_frequencyBodyAccelerationJerkMeanFrequencyX"
"average_frequencyBodyAccelerationJerkMeanFrequencyY"
"average_frequencyBodyAccelerationJerkMeanFrequencyZ"
"average_frequencyBodyGyroMeanX"
"average_frequencyBodyGyroMeanY"
"average_frequencyBodyGyroMeanZ"
"average_frequencyBodyGyroStandardDeviationX"
"average_frequencyBodyGyroStandardDeviationY"
"average_frequencyBodyGyroStandardDeviationZ"
"average_frequencyBodyGyroMeanFrequencyX"
"average_frequencyBodyGyroMeanFrequencyY"
"average_frequencyBodyGyroMeanFrequencyZ"
"average_frequencyBodyAccelerationMagnitudeMean"
"average_frequencyBodyAccelerationMagnitudeStandardDeviation"
"average_frequencyBodyAccelerationMagnitudeMeanFrequency"
"average_frequencyBodyBodyAccelerationJerkMagnitudeMean"
"average_frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation"
"average_frequencyBodyBodyAccelerationJerkMagnitudeMeanFrequency"
"average_frequencyBodyBodyGyroMagnitudeMean"
"average_frequencyBodyBodyGyroMagnitudeStandardDeviation"
"average_frequencyBodyBodyGyroMagnitudeMeanFrequency"
"average_frequencyBodyBodyGyroJerkMagnitudeMean"
"average_frequencyBodyBodyGyroJerkMagnitudeStandardDeviation"
"average_frequencyBodyBodyGyroJerkMagnitudeMeanFrequency"
