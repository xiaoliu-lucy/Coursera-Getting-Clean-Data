# Coursera-Getting-Clean-Data Project
The data comes from 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description is available at the site where the data was obtained: 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script: run_analysis.R does the following things:
1. Download file from URL above if file does not exist in current working directory\n
2. Unzip file to current working directory
3. Merge training and testing data
4. Extract mean and standard deviation measurements for variables
5. Uses descriptive activity names to name the activities in the data set
6. Labels the data set with descriptive activity names
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
