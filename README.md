# gettingandcleaningdata
Creating a Tidy dataset from given data

Note: The code file and the data file generated using the code are both uploaded here. The code file and the required data files should be in the same working directory in order to successfully generate the data file.

The objective is to create a summarised, tidy dataset from the given data.
To this end, we use the text files "X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt", "subject_train.txt", "subject_test.txt" for the most part.
The "subject_train.txt" and "subject_test.txt" files have the subject info. A total of 30 subjects (persons) were chosen and 
various observations were recorded for each one.
For labelling the variables and the activity labels, we use the files "features.txt", "features_info.txt", "activity_labels.txt".
The process is explained in the steps below.

Step 1. Combine the training and the test data.
Here, we merge the files "X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt", "subject_train.txt", "subject_test.txt"
and create a single dataframe.
Then, using the file "features.txt", the columns in the dataframe are all labelled. 

Step 2.
As told in the assignment, we must-
Include only the variables with "mean()" and "std()" in the variable name for each measurement. 
As per the README, we have mean, std, etc. for each type of measurement. 
For ex., for the measurement "fBodyAccJerk-mean()-X", include only the variables
"fBodyBodyAccJerkMag-mean()" and "fBodyBodyAccJerkMag-std()".

Step 3.
Descriptive activity names for activity labels. Given in the file "activity_labels.txt".
Activity labels appropriately renamed.
The labels are as follows.
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Step 4.
Descriptive names for the variables in the dataset.
Apart from the variables subject and activity_label,
We see that the relevant ones are: 
tBodyAcc, tGravityAcc, tBodyJerkAcc, tBodyGyro, tBodyGyroJerk, tGravityAccMag. 
README and the file "features_info.txt" was used to understand the meanings and the names are given accordingly.

Step 5.
Average of each variable was computed per subject and per activity using the package dplyr. 

Step 6.
The dataset thus generated was saved and uploaded on github.
