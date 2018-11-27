# Cleaup script for `Human Activity Recognition Using Smartphones Dataset`

* This repo contain the script for collecting and cleaing the `Human Activity Recognition Using Smartphones Dataset`
* A full description of dataset is available at this [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
* The original data was donwloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* For more information about the original dataset content please refer to README.txt in the `UCI HAR Dataset` folder located in the zipped dataset. 

## Analysis Summary

The analysis script does the following tasks:

* Downloads and unzip the original dataset
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Appropriately labels the data set with descriptive variable and observation names.
* Outputs a tidy data set with the average of each variable for each activity and each subject.

## Repository content 

* README.md
* run_analysis.R: This is the main script that download, unzip, transform, and save the tidy data set.
* CodeBook.md: Describes the variables, the data, and transformations performed to clean up the data

