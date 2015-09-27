#Assuming all dataset provided in the same directory with this file, load all dataset except inertial signals because someone in the forum said it doesn't needed
ds <- "UCI HAR Dataset/"
dsTrain <- paste0(ds,"train/")
dsTest <- paste0(ds,"test/")
data_X_train <- read.table(paste0(dsTrain,"X_train.txt"))
data_Y_train <- read.table(paste0(dsTrain,"y_train.txt"))
data_Subj_train <- read.table(paste0(dsTrain,"subject_train.txt"))
data_X_test <- read.table(paste0(dsTest,"X_test.txt"))
data_Y_test <- read.table(paste0(dsTest,"y_test.txt"))
data_Subj_test <- read.table(paste0(dsTest,"subject_test.txt"))

#Merges the training and the test sets to create one data set.
data_X <- rbind(data_X_train, data_X_test)
data_Y <- rbind(data_Y_train, data_Y_test)
names(data_Y) <- "activity"
data_Subj <- rbind(data_Subj_train, data_Subj_test)
names(data_Subj) <- "subject"

#Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table(paste0(ds,"features.txt"))
extractMeanStd <- grepl("mean\\(\\)|std\\(\\)",features$V2)
extractedXdata <- data_X[,which(extractMeanStd)]
columnNames <- features[which(extractMeanStd),]$V2
columnNames <- gsub("-std\\(\\)","Std",columnNames)
columnNames <- gsub("-mean\\(\\)","Mean",columnNames)
columnNames <- gsub("fBodyBody","featureBody",columnNames)
columnNames <- gsub("fBody","featureBody",columnNames)
columnNames <- gsub("tBody","timeBody",columnNames)
columnNames <- gsub("tGravity","timeGravity",columnNames)
names(extractedXdata) <- columnNames
one_data <- cbind(extractedXdata,data_Y,data_Subj)

#Uses descriptive activity names to name the activities in the data set
act <- read.table(paste0(ds,"activity_labels.txt"))
#one_data$activity <- act[one_data$activity,]$V2

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_avg <- aggregate(. ~ subject + activity, data=one_data, FUN = mean)
write.table(tidy_avg, "tidy_avg.txt", row.name=FALSE)