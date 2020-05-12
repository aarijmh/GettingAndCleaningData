# GettingAndCleaningData

We will be using the following packages
dplyr

The following steps are followed to complete the assignment:
1. Download the file to the current working directory
    1.1 Check if the file has not already been downloaded
    1.2 If not, then download it and unzip it

2. Read the feature labels in "feature_labels"
3. Read the activity labels in "activity_labels"
4. Clean up the feature labels by rreplacing "-" with "_" and removing "()"
5. Filter the feature_labels and select only the columns with either the word "mean" or "std" in them, and store them in a variable "features_selected"
6. Read the training data:
    6.1 read the training activity data in "training_activity_data" with column names as described by "feature_labels"
    6.2 read the training activity_class data in "training_output_data"
    6.3 read the training subject_data in "training_subject_data"
    6.4 filter the training activity data columns with the features_selected columns
    6.5 Merge the all of the training data into a variable training_data usinv cbind
7. Read the testing data:
    7.1 read the testing activity data in "testing_activity_data" with column names as described by "feature_labels"
    7.2 read the testing activity_class data in "testing_output_data"
    7.3 read the testing subject_data in "testing_subject_data"
    7.4 filter the testing activity data columns with the features_selected columns
    7.5 Merge the all of the testing data into a variable testing_data usinv cbind
8. Merge all the data row wise into a variable "whole_data"
9. Replace the activity ids with activity names
10. Tidy up the column names
11. Create a pipeline for whole_data
    11.1  mutate activity column into factors
    11.2  mutate subject column into factors
    11.3  group by first activity and then subject
    11.4  summarize each column by avg
12. write the data into a file "finalOutput.txt"


