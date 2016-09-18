# CodeBook for the Tidy Data Set

## Original Data Set Description
The tidy dataset is derived from the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The original database consists of 7,352 rows of training data and 2,947 rows of test data. Both data sets share the same 561 features.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Original Data Set Contents

```
├── UCI HAR Dataset
	├── README.txt
	├── features_info.txt    Shows information about the variables used on the feature vector.
	├── features.txt    List of all features.
	├── activity_labels.txt    Links the class labels with their activity name.
	└── test
		│── X_test.txt': Test set.
		│── y_test.txt': Test labels.
		│── subject_test.txt': Each row identifies the subject (by numeric ID). Range is from 1 to 30.
	└── train
		│── X_train.txt': Training set.
		│── y_train.txt': Training labels.
		│── subject_train.txt': Each row identifies the subject (by numeric ID). Range is from 1 to 30.
  ```

## Modifications and Transformations
The `run_analysis.R` script performes the following transformations to the original data set:

1. The test and train data sets are merged together by row into a single data set.
2. Two additional factor variables are prepended to the data set: **activity** and **subject**.
  * activity contains links to the class labels with their lower case activity name. Range is from 1 to 6.
  * subject is identifies the subject (by numeric ID). Range is from 1 to 30.
3. The merged data set contains several duplicate variables. Duplicate column variables are removed.
4. The data set is further subsetted by preserving the activity and subject variables and all columns containing the characters "mean" or "std".
5. The script then cleans the variable names by removing the symbols and capitalizes the factors.
6. The tidy data set is created by grouping the data by subject and activity, then taking the average of each variable for each activity and each subject.
7. The tidy data set with the variable names is written to the working directory as `tidy.txt`.

## Tidy Data Set Description
The tidy data set in the `tidy.txt` file contains 180 rows with 60 variables. The variable names are listed below.

### Identifiers
* subject - A numeric identifier for each subject. Range: 1 to 30.
* activity - A short description of the activity performed during measurement.
	* walking: subject was walking during the test
	* walking_upstairs: subject was walking up a staircase during the test
	* walking_downstairs: subject was walking down a staircase during the test
	* sitting: subject was sitting during the test
	* standing: subject was standing during the test
	* laying: subject was laying down during the test

### Measurements
* timeBodyAccelerometer.Mean.X
* timeBodyAccelerometer.Mean.Y
* timeBodyAccelerometer.Mean.Z
* timeGravityAccelerometer.Mean.X
* timeGravityAccelerometer.Mean.Y
* timeGravityAccelerometer.Mean.Z
* timeBodyAccelerometerJerk.Mean.X
* timeBodyAccelerometerJerk.Mean.Y
* timeBodyAccelerometerJerk.Mean.Z
* timeBodyGyroscope.Mean.X
* timeBodyGyroscope.Mean.Y
* timeBodyGyroscope.Mean.Z
* timeBodyGyroscopeJerk.Mean.X
* timeBodyGyroscopeJerk.Mean.Y
* timeBodyGyroscopeJerk.Mean.Z
* timeBodyAccelerometerMagnitude.Mean
* timeGravityAccelerometerMagnitude.Mean
* timeBodyAccelerometerJerkMagnitude.Mean
* timeBodyGyroscopeMagnitude.Mean
* timeBodyGyroscopeJerkMagnitude.Mean
* frequencyBodyAccelerometer.Mean.X
* frequencyBodyAccelerometer.Mean.Y
* frequencyBodyAccelerometer.Mean.Z
* frequencyBodyAccelerometerJerk.Mean.X
* frequencyBodyAccelerometerJerk.Mean.Y
* frequencyBodyAccelerometerJerk.Mean.Z
* frequencyBodyGyroscope.Mean.X
* frequencyBodyGyroscope.Mean.Y
* frequencyBodyGyroscope.Mean.Z
* frequencyBodyAccelerometerMagnitude.Mean
* frequencyBodyAccelerometerJerkMagnitude.Mean
* frequencyBodyGyroscopeMagnitude.Mean
* frequencyBodyGyroscopeJerkMagnitude.Mean
* timeBodyAccelerometer.Std.X
* timeBodyAccelerometer.Std.Y
* timeBodyAccelerometer.Std.Z
* timeGravityAccelerometer.Std.X
* timeGravityAccelerometer.Std.Y
* timeGravityAccelerometer.Std.Z
* timeBodyAccelerometerJerk.Std.X
* timeBodyAccelerometerJerk.Std.Y
* timeBodyAccelerometerJerk.Std.Z
* timeBodyGyroscope.Std.X
* timeBodyGyroscope.Std.Y
* timeBodyGyroscope.Std.Z
* timeBodyGyroscopeJerk.Std.X
* timeBodyGyroscopeJerk.Std.Y
* timeBodyGyroscopeJerk.Std.Z
* timeBodyAccelerometerMagnitude.Std
* timeGravityAccelerometerMagnitude.Std
* timeBodyAccelerometerJerkMagnitude.Std
* timeBodyGyroscopeMagnitude.Std
* timeBodyGyroscopeJerkMagnitude.Std
* frequencyBodyAccelerometer.Std.X
* frequencyBodyAccelerometer.Std.Y
* frequencyBodyAccelerometer.Std.Z
* frequencyBodyAccelerometerJerk.Std.X
* frequencyBodyAccelerometerJerk.Std.Y
* frequencyBodyAccelerometerJerk.Std.Z
* frequencyBodyGyroscope.Std.X
* frequencyBodyGyroscope.Std.Y
* frequencyBodyGyroscope.Std.Z
* frequencyBodyAccelerometerMagnitude.Std
* frequencyBodyAccelerometerJerkMagnitude.Std
* frequencyBodyGyroscopeMagnitude.Std
* frequencyBodyGyroscopeJerkMagnitude.Std