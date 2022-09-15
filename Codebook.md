
Step 1.
Combine the training and the test data. 
 

Step 2. 
As told in the assignment, we must- Include only the variables with "mean()" and "std()" in the variable name for each measurement. 


Step 3. 
Descriptive activity names for activity labels. Given in the file "activity_labels.txt". 
Activity labels appropriately renamed. 


Step 4. 
Descriptive names for the variables in the dataset. 
Apart from the variables subject and activity_label, We see that the relevant ones are: 
tBodyAcc, tGravityAcc, tBodyJerkAcc, tBodyGyro, tBodyGyroJerk, tGravityAccMag, etc.  
README and the file "features_info.txt" was used to understand the meanings and the names are given accordingly as follows.
tBodyAcc = "body_acceleration_time_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)
tGravityAcc = "gravity_acceleration_time_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)
tBodyJerkAcc = "body_acceleration_jerk_time_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)
tBodyGyro = "body_gyration_time_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)
tBodyGyroJerk = "body_gyration_jerk_time_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)
tGravityAccMag = "body_acceleration_time_domain_magnitude". (Suitable mean/std suffix added after that.)

Similarly the frequency domain variables are labelled. For ex.

fBodyAcc = "body_acceleration_frequency_domain". (Suitable x-axis/y-axis/z-axis and mean/std suffix added after that.)

Step 5. Average of each variable was computed per subject and per activity using the package dplyr.

Step 6. The dataset thus generated was saved and uploaded on github.
