# Coursera: Gettiing and Cleaning Data, Course Project
#############################################################
# Step 0: Downloading the data
# Get the library information
library(reshape2)
library(plyr)
Data_From_Online <- "getdata_dataset.zip"

## See if the file exists, if it doesn't download it. 
if (!file.exists(Data_From_Online)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, Data_From_Online, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(Data_From_Online) 
}
#############################################################
# Step 1: "Merges the training and the test sets to create one data set."

# Substep: laoding the training 
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Substep: loading the test data 
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#  Now: Merging the data 
x_data <-rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Giving the data lables
subject_data <- rbind(subject_train, subject_test)

#############################################################
# Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement. "

# Load the features labels
features <- read.table("UCI HAR Dataset/features.txt")

# Extract the mean and standard deviation for the features table
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# Load the activities table
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])

#############################################################
# Step 3: Uses descriptive activity names to name the activities in the data set
# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

#############################################################
# Step 4: Appropriately labels the data set with descriptive variable names.
# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

############################################################
# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
