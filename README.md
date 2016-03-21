# Coursera-Getting-Clean-Data Project
The data comes from<br>
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br>
A full description is available at the site where the data was obtained: <br>
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br>

The R script: run_analysis.R does the following things:<br>
1. Download file from URL above if file does not exist in current working directory <br>
2. Unzip file to current working directory<br>
3. Merge training and testing data<br>
4. Extract mean and standard deviation measurements for variables<br>
5. Uses descriptive activity names to name the activities in the data set<br>
6. Labels the data set with descriptive activity names<br>
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject<br>
