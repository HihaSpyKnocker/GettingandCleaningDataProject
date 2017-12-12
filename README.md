# Getting and Cleaning Data Course Project

## Project Description 
This project is a part of the Data Science's track course 
"Getting and Cleaning Data", created by Johns Hopkins University.
The goal is to prepare a tidy data set that can be used for later analysis. 
The raw data can be found at 
[Human Activity Recognition Using Smartphones Data Set] 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Repository Contents

### CodeBook.md
Documentation describing the variables, the data and any transformations or work 
that I performed to clean up.

### README.md 
Documentation explaining the project and how to use files contained in the 
repository.

### run_analysis.R 
R script that does the following:

1. Merges the training and the test set to create one data set
2. Extracts only the measurements on the mean and standard deviation for each
measurement
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject 

A more detailed description of the analysis can be found in the transformation
section of the <code>CodeBook.md</code>.

### tidydata.txt
A text file containing the tidy data, i.e. data with the average of each 
variable for each activity and each subject.

## How to use the files?

### Prerequisites
* Download the [Human Activity Recognition Using Smartphones Data Set] 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
in your working directory, like "./data/UCI HAR Dataset
* Download <code>run_analysis.R</code>

### Using the files
Two ways: 
* Run <code>run_analysis.R</code> by using <code>source()</code> in R or Rstudio.
* Run <code>run_analysis.R</code> by copy and pasting it in R or RStudio. 

### Output
The text file <code>tidydata.txt</code>.