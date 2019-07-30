library(dplyr)
library(reshape)
library(reshape2)

data_dir <- "UCI HAR Dataset"
test_dir <- file.path(data_dir,"test")
train_dir <- file.path(data_dir,"train")

if (!file.exists(data_dir)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,destfile = "./data.zip")
  unzip("data.zip")
}

features <- read.table(file.path(data_dir,"features.txt"))
act_labels <- read.table(file.path(data_dir,"activity_labels.txt"))

#handle features so that they are human readable



# read in the labels and variables
# name the col of the set and label
test_x <- read.table(file.path(test_dir,"X_test.txt"))
colnames(test_x) <- features$V2
train_x <- read.table(file.path(train_dir,"X_train.txt"))
colnames(train_x) <- features$V2
test_y <- read.table(file.path(test_dir,"y_test.txt"))
train_y <- read.table(file.path(train_dir,"y_train.txt"))
sub_train <- read.table(file.path(train_dir,"subject_train.txt"))
names(sub_test) <- "subject_col"
sub_test <- read.table(file.path(test_dir,"subject_test.txt"))
names(sub_train) <- "subject_col"

#Transfer test_y and train_y to readable activity labels AND rename the col
test_y$V1 <- factor(test_y$V1,levels = act_labels$V1, labels = act_labels$V2)
train_y$V1 <- factor(train_y$V1,levels = act_labels$V1, labels = act_labels$V2)
names(test_y) <- "activity_col"
names(train_y) <- "activity_col"

# combine the activity,subjects and variables
com_test <- cbind(sub_test,test_y,test_x)
com_train <- cbind(sub_train,train_y,train_x)

# combine test and train data
all_data <- rbind(com_test,com_train)

# Appropriately labels the data set with descriptive variable names
names(all_data) <- gsub("\\(\\)","",names(all_data))
names(all_data) <- gsub("-","_",names(all_data))

# Select only mean and std column
all_data <- all_data[,grepl("mean|std|subject|act",names(all_data))]

# create a new tidy dataset with the average of each variable for each activity and each subject
vars_name <- names(all_data)
vars_name <- vars_name[-(1:2)]
new_data <- melt(all_data, id = c("subject_col","act_col"), measure.vars = vars_name)
new_data <- dcast(new_data,subject_col + act_col ~ variable, mean)

#write into txt file
write.table(new_data,file = "tidy_data.txt", sep = ",", row.names = FALSE)

