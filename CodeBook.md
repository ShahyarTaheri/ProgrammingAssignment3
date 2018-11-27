# Codebook for tidydataset.txt

This document explains the process of creating the tidy dataset from `Human Activity Recognition Using Smartphones Dataset`. A full description of dataset is available at this [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The original dataset contains the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The data comes from the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The data was processed as explained in features_info to extarct meaningful features from the sensory data and split into the test and training sets.

The main datafiles that were used during cleanup process are following:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

During the data transfomration the run_analysis.R script performs the following tasks:

* The data file is downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped into the working directory.
* The activites data are read from the `activity_labels.txt` into `activityID` and `acitivity` columns. 
* The feature labels data are read from `features.txt` into `featureID` and `label` columns.
* The feature names are modified:  
  * All `-` are replaced with `_`
  * All `()` are eliminated
* The observations are imported from `subject`, `X`, and `Y` for testing and training datasets.
* Only features that are based on mean and standard deviation functions are extracted from datasets.
* The activity IDs in test and training sets are replaced by the corresponding descriptive activity labels.
* The subjectID and activity columns are added to feature data tables.
* The combined test and tarining sets are combined into a new dataset.
* The observations for each feature are averaged for each activity and each subject and assigned to a new tidy dataset.
* The new dataset is sorted with respect to subject IDs.
* The tidy dataset is saved as a space delimited file `tidydataset.txt'

## Tidy dataset structure

The tidydatset contains following variaables:

1. (column 1) SubjectID: ID of the person performed the experiment.

2. (column 2) activity: Label of the avtivity done during the experiment.

3. (column 3:81) tBodyAcc_mean_x, tBodyAcc_mean_y, ...: The mean value for 79 features that were extracted from raw data and grouped based on the subject and activity.  