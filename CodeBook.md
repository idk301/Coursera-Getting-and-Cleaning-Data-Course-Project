The script run_analysis performs the 5 questions asked. However, there are underlying steps to each of these, which 
can be seen in the code. 
Here, they are named "Step 0"

0. --> Check to see if the data exists on your computer, if not, then download it. Then, unzip it using the command: unzip
Then read the data sets. 

1. Merges the training and the test sets to create one data set.--> this can be done with rbind and cbind
2. Extracts only the measurements on the mean and standard deviation for each measurement. --> uses grep, mean|std
3. Uses descriptive activity names to name the activities in the data set--> appending the names of the files and using that
4. Appropriately labels the data set with descriptive variable names. --> depends on the file names. Used those. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
each variable for each activity and each subject.--> this is joining together the prior steps 

Variables
1. Using the files that are included in the folder. 
x_train--> training set for x
y_train--> training set for y
subject_train--> training set for subject
x_test --> test set for x
y_test --> test set for y
subject_test --> test set for subject

2. name the data sets accordingly once they are merged (Ask 1 of project)
  x_data--> row binds the training set and the test set for x
  y_data-->  row binds the training set and the test set for y
  subject_data --> row binds the training set and the test set
3. 
  features--> uploads data from the file 
  mean_and_std_features--> gets the mean and standard deviation, as asked in task 2 
  x_data and y_data contain all the data for the feature and activity data sets respectively. 
  
4. The names() function of R is used on the files to give them the correct lables (ask 4 of project) 
5. Merging all the files together is done by setting items into a new data frame using the ddply function. 
