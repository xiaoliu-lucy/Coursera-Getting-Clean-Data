##Download file if not exist 
if(!file.exists("getdata-projectfiles-UCI HAR Dataset.zip"))
{
  fileurl="http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl,destfile = "getdata-projectfiles-UCI HAR Dataset.zip",method = "auto")
}
unzip(zipfile="getdata-projectfiles-UCI HAR Dataset.zip",exdir=getwd())
setwd("./UCI HAR Dataset")
##load data
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
testSubject <- read.table("./test/subject_test.txt")
trainSubject <- read.table("./train/subject_train.txt")
##combine test and train data
combData <- rbind(trainData, testData)
combLabel <- rbind(trainLabel, testLabel)
combSubject <- rbind(trainSubject, testSubject)
##Extracts only the measurements on the mean and standard 
features <- read.table("features.txt")
MeanStd<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", features[, 2])
combDataMS<-combData[,MeanStd]
vNames<-features[MeanStd,2]
vNames <- gsub("\\(\\)", "", vNames) 
vNames <- gsub("mean", "Mean", vNames) 
vNames <- gsub("std", "Std", vNames) 
vNames <- gsub("-", "", vNames) 
names(combDataMS)<-vNames
##Name the activities in the data set
activity <- read.table("activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[combLabel[, 1], 2]
combLabel[, 1] <- activityLabel
names(combLabel) <- "activity"
##Appropriately labels the data set with descriptive activity names
names(combSubject) <- "subject"
cleanedData <- cbind(combSubject, combLabel, combDataMS)
write.table(cleanedData, "merged_data.txt")
##creates a second, independent tidy data set with the average of each variable
##for each activity and each subject.
subjectLen <- length(table(combSubject))
activityLen <- nrow(activity)
columnLen <- ncol(cleanedData)
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(combSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
write.table(result, "data_with_means.txt")
