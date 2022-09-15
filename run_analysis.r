# Creating a Tidy dataset from the given one. 


# Step 1.
# Combining the training and test data.

library(dplyr)

x_train<-read.table("X_train.txt", sep = "", dec = ".")
y_train<-read.table("y_train.txt", sep = "", dec = ".")
subject_train<-read.table("subject_train.txt", sep = "", dec = ".")

train_data<-cbind(subject_train, x_train, y_train)

x_test<-read.table("X_test.txt", sep = "", dec = ".")
y_test<-read.table("y_test.txt", sep = "", dec = ".")
subject_test<-read.table("subject_test.txt", sep = "", dec = ".")

test_data<-cbind(subject_test, x_test, y_test)
 
total_data<-rbind(train_data, test_data)


# Labelling the data.

names_data<-read.table("features.txt", sep = "", dec = ".")[,2]

names_data<-sapply(names_data, function(x) as.character(x))

total_names<-c("subject", names_data, "activity_label")

names(total_data)<-total_names



# Step 2.
# As told in the assignment, we must-
# Include only the variables with "mean()" and "std()" in the variable name for each measurement. 
# As per the README, we have mean, std, etc. for each type of measurement. 
# For ex., for the measurement "fBodyAccJerk-mean()-X", include only the variables
# "fBodyBodyAccJerkMag-mean()" and "fBodyBodyAccJerkMag-std()"

mean_inds<-which(grepl("\\bmean()\\b", total_names) %in% TRUE)
std_inds<-which(grepl("\\bstd()\\b", total_names) %in% TRUE)

total_inds<-sort(c(mean_inds, std_inds))

revised_data<-total_data[,c(1,total_inds,563)]


# Step 3.
# Descriptive activity names for activity labels. 
# Activity labels appropriately renamed.
# The labels are as follows.
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

revised_data<-revised_data %>% mutate_at(vars(activity_label), factor)

revised_data$activity_label<-recode_factor(revised_data$activity_label, 
"1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS",
"4" = "SITTING", "5" = "STANDING", "6" = "LAYING")


# Step 4. 
# Descriptive names for the variables in the dataset.
# Apart from the variables subject and activity_label,
# We see that the relevant ones are: 
# tBodyAcc, tGravityAcc, tBodyJerkAcc, tBodyGyro,
# tBodyGyroJerk, tGravityAccMag, 
# README was used to understand the meanings and the names are given accordingly.


revised_names<-c("subject", "body_acceleration_time_domain_x-axis_mean", "body_acceleration_time_domain_y-axis_mean",
"body_acceleration_time_domain_z-axis_mean", "body_acceleration_time_domain_x-axis_std", "body_acceleration_time_domain_y-axis_std",
"body_acceleration_time_domain_z-axis_std", "gravity_acceleration_time_domain_x-axis_mean", "gravity_acceleration_time_domain_y-axis_mean",
"gravity_acceleration_time_domain_z-axis_mean", "gravity_acceleration_time_domain_x-axis_std", "gravity_acceleration_time_domain_y-axis_std",
"gravity_acceleration_time_domain_z-axis_std", "body_accelaration_jerk_time_domain_x-axis_mean", "body_accelaration_jerk_time_domain_y-axis_mean",
"body_accelaration_jerk_time_domain_z-axis_mean", "body_accelaration_jerk_time_domain_x-axis_std", "body_accelaration_jerk_time_domain_y-axis_std",
"body_accelaration_jerk_time_domain_z-axis_std", "body_gyration_time_domain_x-axis_mean", "body_gyration_time_domain_y-axis_mean",
"body_gyration_time_domain_z-axis_mean", "body_gyration_time_domain_x-axis_std", "body_gyration_time_domain_y-axis_std",
"body_gyration_time_domain_z-axis_std", "body_gyration_jerk_time_domain_x-axis_mean", "body_gyration_jerk_time_domain_y-axis_mean",
"body_gyration_jerk_time_domain_z-axis_mean", "body_gyration_jerk_time_domain_x-axis_std", "body_gyration_jerk_time_domain_y-axis_std",
"body_gyration_jerk_time_domain_z-axis_std", "body_acceleration_time_domain_magnitiude_mean", "body_acceleration_time_domain_magnitiude_std",
"gravity_acceleration_time_domain_magnitiude_mean", "gravity_acceleration_time_domain_magnitiude_std", "body_accelaration_jerk_time_domain_magnitude_mean", 
"body_accelaration_jerk_time_domain_magnitude_std", "body_gyration_time_domain_magnitude_mean", "body_gyration_time_domain_magnitude_std",
"body_gyration_jerk_time_domain_magnitude_mean", "body_gyration_jerk_time_domain_magnitude_std", "body_acceleration_frequency_domain_x-axis_mean", 
"body_acceleration_frequency_domain_y-axis_mean", "body_acceleration_frequency_domain_z-axis_mean", "body_acceleration_frequency_domain_x-axis_std", 
"body_acceleration_frequency_domain_y-axis_std", "body_acceleration_frequency_domain_z-axis_std", "body_accelaration_jerk_frequncy_domain_x-axis_mean", 
"body_accelaration_jerk_frequncy_domain_y-axis_mean", "body_accelaration_jerk_frequncy_domain_z-axis_mean", "body_accelaration_jerk_frequncy_domain_x-axis_std", 
"body_accelaration_jerk_frequncy_domain_y-axis_std", "body_accelaration_jerk_frequncy_domain_z-axis_std", "body_gyration_frequency_domain_x-axis_mean", 
"body_gyration_frequency_domain_y-axis_mean", "body_gyration_frequency_domain_z-axis_mean", "body_gyration_frequency_domain_x-axis_std", 
"body_gyration_frequency_domain_y-axis_std", "body_gyration_frequency_domain_z-axis_std", "body_acceleration_frequency_domain_magnitiude_mean", 
"body_acceleration_frequency_domain_magnitiude_std", "body_accelaration_jerk_frequency_domain_magnitude_mean", "body_accelaration_frequency_domain_magnitude_std", 
"body_gyration_frequency_domain_magnitiude_mean", "body_gyration_frequency_domain_magnitiude_std", "body_gyration_jerk_frequency_domain_magnitiude_mean",
"body_gyration_jerk_frequency_domain_magnitiude_std", "activity_label")

names(revised_data)<-revised_names

# Step 5.
# Average of each variable per subject and per activity.

revised_final_data<- revised_data %>% group_by(subject, activity_label) %>%
summarise(across(everything(), mean, na.rm = TRUE))

# Step 6.
# Save the dataset thus generated.

write.table(revised_final_data,row.name=FALSE, file = "revised_final_data.txt")