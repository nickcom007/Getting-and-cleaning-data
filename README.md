# Getting-and-cleaning-data
## Cousera Peer-graded Assignment Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### Data
Data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project Target
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script description

### Name adujstment
The feature names has been adujsted in the following way so that they are more human readable.

tBodyAcc-mean()-X     -->   tBodyAcc_mean_x

### Feature selection
Only the measurements on the mean and standard deviation for each measurement has been selected.

### Cleaning process
* Import the related R library "dplyr","reshape" and "reshape2". And set the directory name for the data.
* Read in all training and testing data in separate tables. Rename the column names of the tables so that they are human readable.
* Combine the labels and the features
* Combine testing and traning sets
* Select only the measurements on the mean and standard deviation.
* Create a new tidy dataset with the average of each variable for each activity and each subject.



