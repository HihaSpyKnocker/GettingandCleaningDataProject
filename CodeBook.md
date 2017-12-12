# Code Book for Getting and Cleaning Data Course Project

## Data Set Information

The following section can also be found at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been 
video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time 
and frequency domain. See 'features_info.txt' for more details. 

The raw data can be found at 
[Human Activity Recognition Using Smartphones Data Set] 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Transformations by run_analysis.R 

### Step 1: Merge the training and test sets to create one data set
Test sets:
* <code>X_test.txt</code>
* <code>y_test.txt</code>
* <code>subject_test.txt</code>

Training sets: 
* <code>X_train.txt</code>
* <code>y_train.txt</code>
* <code>subject_train.txt</code>

#### Procedure:
1. Load the individual data sets using <code>read.table()</code>
1. Merge the test sets using <code>cbind()</code>
2. Merge the training sets using <code>cbind()</code>
3. Merge the merged test and training sets using <code>rbind()</code>, which
results in one merged data set. 

### Step 2: Extract only the measurements on the mean and standard deviation for each measurement
Before I could subset on the mean and standard deviation, I had to add column 
names, such that I could find the relevant columns. The column names can be found
in <code>features.txt</code>.

#### Procedure: 
1. Load features from <code>features.txt</code> using <code>read.table()</code>
2. Change column names of the merged data set using <code>colnames()</code>
3. Subset on the relevant columns using <code>grep()</code>

### Step 3: Use descriptive activity names to name the activities in the data set

#### Procedure: 
1. Load activities from <code>activity_labels.txt</code> using <code>read.table()</code>
2. Combine the activities with the merged dataset by ID using <code>match()</code>

### Step 4: Appropriately label the data set with descriptive variable names

#### Procedure: 
1. Replace special values: i.e. "-" into "."
2. Remove special values: i.e. "()"
3. Replace variable names using <code>sub()</code> and <code>gsub()</code>, e.g.
"Gyro" to "Gyroscope"

### Step 5: From the data set in Step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#### Procedure:
1. Load the <code>dplyr</code> package using <code>library()</code>
2. Group by subject and activity using <code>group_by()</code>
3. Average the columns by group with only one observation for each 
subject-activity pair using <code>summerize_all()</code>
4. Write table to <code>tidydata.txt</code>

## Calculated variables
Can be found in <code>tidydata.txt</code> 

* subject (can take a number between 1 and 30)

* activity (can take the values: LAYING, SITTING, STANDING, WALKING, 
WALKING_DOWNSTAIRS and WALKING_UPSTAIRS)

* timeBodyAccelerometer.mean.X
* timeBodyAccelerometer.mean.Y
* timeBodyAccelerometer.mean.Z
* timeBodyAccelerometer.std.X
* timeBodyAccelerometer.std.Y
* timeBodyAccelerometer.std.Z

* timeGravityAccelerometer.mean.X
* timeGravityAccelerometer.mean.Y
* timeGravityAccelerometer.mean.Z
* timeGravityAccelerometer.std.X
* timeGravityAccelerometer.std.Y
* timeGravityAccelerometer.std.Z

* timeBodyAccelerometerJerk.mean.X
* timeBodyAccelerometerJerk.mean.Y
* timeBodyAccelerometerJerk.mean.Z
* timeBodyAccelerometerJerk.std.X
* timeBodyAccelerometerJerk.std.Y
* timeBodyAccelerometerJerk.std.Z

* timeBodyGyroscope.mean.X
* timeBodyGyroscope.mean.Y
* timeBodyGyroscope.mean.Z
* timeBodyGyroscope.std.X
* timeBodyGyroscope.std.Y
* timeBodyGyroscope.std.Z

* timeBodyGyroscopeJerk.mean.X
* timeBodyGyroscopeJerk.mean.Y
* timeBodyGyroscopeJerk.mean.Z
* timeBodyGyroscopeJerk.std.X
* timeBodyGyroscopeJerk.std.Y
* timeBodyGyroscopeJerk.std.Z

* timeBodyAccelerometerMagnitude.mean
* timeBodyAccelerometerMagnitude.std

* timeGravityAccelerometerMagnitude.mean
* timeGravityAccelerometerMagnitude.std

* timeBodyAccelerometerJerkMagnitude.mean
* timeBodyAccelerometerJerkMagnitude.std

* timeBodyGyroscopeMagnitude.mean
* timeBodyGyroscopeMagnitude.std

* timeBodyGyroscopeJerkMagnitude.mean
* timeBodyGyroscopeJerkMagnitude.std

* frequencyBodyAccelerometer.mean.X
* frequencyBodyAccelerometer.mean.Y
* frequencyBodyAccelerometer.mean.Z
* frequencyBodyAccelerometer.std.X
* frequencyBodyAccelerometer.std.Y
* frequencyBodyAccelerometer.std.Z
* frequencyBodyAccelerometer.meanFreq.X
* frequencyBodyAccelerometer.meanFreq.Y
* frequencyBodyAccelerometer.meanFreq.Z

* frequencyBodyAccelerometerJerk.mean.X
* frequencyBodyAccelerometerJerk.mean.Y
* frequencyBodyAccelerometerJerk.mean.Z
* frequencyBodyAccelerometerJerk.std.X
* frequencyBodyAccelerometerJerk.std.Y
* frequencyBodyAccelerometerJerk.std.Z
* frequencyBodyAccelerometerJerk.meanFreq.X
* frequencyBodyAccelerometerJerk.meanFreq.Y
* frequencyBodyAccelerometerJerk.meanFreq.Z

* frequencyBodyGyroscope.mean.X
* frequencyBodyGyroscope.mean.Y
* frequencyBodyGyroscope.mean.Z
* frequencyBodyGyroscope.std.X
* frequencyBodyGyroscope.std.Y
* frequencyBodyGyroscope.std.Z
* frequencyBodyGyroscope.meanFreq.X
* frequencyBodyGyroscope.meanFreq.Y
* frequencyBodyGyroscope.meanFreq.Z

* frequencyBodyAccelerometerMagnitude.mean
* frequencyBodyAccelerometerMagnitude.std
* frequencyBodyAccelerometer.meanFreq

* frequencyBodyAccelerometerJerkMagnitude.mean
* frequencyBodyAccelerometerJerkMagnitude.std
* frequencyBodyAccelerometerJerkMagnitude.meanFreq

* frequencyBodyGyroscopeMagnitude.mean
* frequencyBodyGyroscopeMagnitude.std
* frequencyBodyGyroscopeMagnitude.meanFreq

* frequencyBodyGyroscopeJerkMagnitude.mean
* frequencyBodyGyroscopeJerkMagnitude.std
* frequencyBodyGyroscopeJerkMagnitude.meanFreq