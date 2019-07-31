# Code Book
The code book will intruduce the features, labels, target tidy data set and the process of the data cleaning.

## Data Source
Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data labels
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## Variables
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Details on variables can be found in features_info.txt in the zip file

## Data partition
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Name adujstment
The feature names has been adujsted in the following way so that they are more human readable.

tBodyAcc-mean()-X     -->   tBodyAcc_mean_x

## Feature selection
Only the measurements on the mean and standard deviation for each measurement has been selected.

## Cleaning process
* Import the related R library "dplyr","reshape" and "reshape2". And set the directory name for the data.
* Read in all training and testing data in separate tables. Rename the column names of the tables so that they are human readable.
* Combine the labels and the features
* Combine testing and traning sets
* Select only the measurements on the mean and standard deviation.
* Create a new tidy dataset with the average of each variable for each activity and each subject.


