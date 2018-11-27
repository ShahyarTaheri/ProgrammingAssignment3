library(data.table)

# Download file if it is not available
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./Dataset.zip")){
  download.file(fileUrl, destfile = "./Dataset.zip")
}

# Unzip the folder if not done 
if (!file.exists("./UCI HAR Dataset")){
  unzip("./Dataset.zip")
}

# Read activity labels
activities = fread("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors =FALSE, 
                   col.names=c("activityID","activity"))

# Read activity labels
features = fread("./UCI HAR Dataset/features.txt",stringsAsFactors =FALSE, col.names=c("featureID","label"))
features$label = gsub("-", "_", features$label)
features$label = gsub("[(][)]", "", features$label)

# Read test sets
subject_test = fread("./UCI HAR Dataset/test/subject_test.txt",col.names="subjectID")
X_test = fread("./UCI HAR Dataset/test/X_test.txt",header = FALSE, col.names = features$label)
Y_test = fread("./UCI HAR Dataset/test/Y_test.txt",header = FALSE, col.names = "activityID")

# Read train sets
subject_train = fread("./UCI HAR Dataset/train/subject_train.txt",col.names="subjectID")
X_train = fread("./UCI HAR Dataset/train/X_train.txt",header = FALSE, col.names = features$label)
Y_train = fread("./UCI HAR Dataset/train/Y_train.txt",header = FALSE, col.names = "activityID")

# Extracts only the measurements on the mean and standard deviation for each measurement.
selectedFeatures = features$label[grep("_mean()|_std()",features$label)]
test_set = X_test[,selectedFeatures, with=FALSE]
train_set = X_train[,selectedFeatures, with=FALSE]

# Uses descriptive activity names to name the activities in the data set
train_set$activity = merge(Y_train,activities, by="activityID", sort = FALSE)[,2, with=FALSE]
test_set$activity = merge(Y_test,activities, by="activityID", sort = FALSE)[,2, with=FALSE]

# Appropriately labels the data set with descriptive variable names.
train_set$subjectID = subject_train
test_set$subjectID = subject_test

# Merges the training and the test sets to create one data set.
dataset = rbindlist(list(train_set,test_set))

# Average of each variable for each activity and each subject
tidyset = dataset[,lapply(.SD, mean),by = c('subjectID','activity')]

# Sort dataset based on subject ID
tidyset = arrange(tidyset,subjectID)

# Write dataset to file
write.table(tidyset, file = "tidydataset.txt",row.name=FALSE)

