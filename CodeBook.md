# Variables
subject -> The id of subject experiment
activity -> The activity that is done on that record
66 of features variable transformed from features.txt into more descriptive variables

# Data
Origin of data came from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Tidy data produced by running run_analysis.txt, the steps are shown below

# run_analysis.R algorithm
1. read data from text files into respective variables
2. merge train data with test data using rbind(X_train with X_test, y_train with y_test, subject_train with subject_test)
3. extracts only the measurements on the mean and standard deviation for each measurement by using grepl to get logical index
4. merge all data into one dataset using cbind
5. rename the variable of the data
6. create tidy data set with the average of each variable for each activity and each subject using aggregate function