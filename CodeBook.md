The explanation of the dataset "Human Activity Recognition Using Smartphones Dataset - Version 1.0" is present in the zip file:

The following steps were followed to transform the data:

1. If the data is not present, then the data is downloaded and unzipped
2. The function 'read.delim' is used to read the following elements
  2.1 Activity labels from activity_labels.txt
  2.2 Feature labels from features.txt
  2.3 load the activity values for training from X_train.txt
  2.4 load the activity ids for trainning from y_train.txt
  2.5 load the subject ids for trainning from subject_train.txt
  2.6 load the activity values for testing from X_test.txt
  2.7 load the activity ids for testing from y_test.txt
  2.8 load the subject ids for testing from subject_test.txt
  

The feature names were cleaned and tidyed up. These names were used to name the column/variable names in the test and trainning data frames. The column/variable name 'activity' is used to label y_train and y_test. The name 'subject' is used to label the subject id column.

The feature names were changed to make them more undertandable. The hyphens were replaces with underscores, all the names were switched to lower case. Abbreviation like 'acc' were expanded to 'Accelometer'. The 't' was replaced with 'time', and 'f' with 'frequency'

Afterwards, the indices of the activity were replaced by the labels of the activity data frame

The training and testing data were stacked on top of each other to make the data frame 'whole_data'

Then only the columns that have the word 'mean' or 'std' in their names were filtered.

As a result 88 columns remained, of which 86 are features and 1 column for subject and 1 column for activity


A final tidy data table called "final_output" is created by first converting the subject and activity columns to factor, then grouping them by activity and subject and then summarizing the remainning columns by mean. 

New Variables

| Old Name                             | New Name                                             |
|--------------------------------------|------------------------------------------------------|
| subject                              | subject                                              |
| tBodyAcc_mean_X                      | timebodyaccelerometer_mean_x                         |
| tBodyAcc_mean_Y                      | timebodyaccelerometer_mean_y                         |
| tBodyAcc_mean_Z                      | timebodyaccelerometer_mean_z                         |
| tBodyAcc_std_X                       | timebodyaccelerometer_std_x                          |
| tBodyAcc_std_Y                       | timebodyaccelerometer_std_y                          |
| tBodyAcc_std_Z                       | timebodyaccelerometer_std_z                          |
| tGravityAcc_mean_X                   | timegravityaccelerometer_mean_x                      |
| tGravityAcc_mean_Y                   | timegravityaccelerometer_mean_y                      |
| tGravityAcc_mean_Z                   | timegravityaccelerometer_mean_z                      |
| tGravityAcc_std_X                    | timegravityaccelerometer_std_x                       |
| tGravityAcc_std_Y                    | timegravityaccelerometer_std_y                       |
| tGravityAcc_std_Z                    | timegravityaccelerometer_std_z                       |
| tBodyAccJerk_mean_X                  | timebodyaccelerometerjerk_mean_x                     |
| tBodyAccJerk_mean_Y                  | timebodyaccelerometerjerk_mean_y                     |
| tBodyAccJerk_mean_Z                  | timebodyaccelerometerjerk_mean_z                     |
| tBodyAccJerk_std_X                   | timebodyaccelerometerjerk_std_x                      |
| tBodyAccJerk_std_Y                   | timebodyaccelerometerjerk_std_y                      |
| tBodyAccJerk_std_Z                   | timebodyaccelerometerjerk_std_z                      |
| tBodyGyro_mean_X                     | timebodygyroscope_mean_x                             |
| tBodyGyro_mean_Y                     | timebodygyroscope_mean_y                             |
| tBodyGyro_mean_Z                     | timebodygyroscope_mean_z                             |
| tBodyGyro_std_X                      | timebodygyroscope_std_x                              |
| tBodyGyro_std_Y                      | timebodygyroscope_std_y                              |
| tBodyGyro_std_Z                      | timebodygyroscope_std_z                              |
| tBodyGyroJerk_mean_X                 | timebodygyroscopejerk_mean_x                         |
| tBodyGyroJerk_mean_Y                 | timebodygyroscopejerk_mean_y                         |
| tBodyGyroJerk_mean_Z                 | timebodygyroscopejerk_mean_z                         |
| tBodyGyroJerk_std_X                  | timebodygyroscopejerk_std_x                          |
| tBodyGyroJerk_std_Y                  | timebodygyroscopejerk_std_y                          |
| tBodyGyroJerk_std_Z                  | timebodygyroscopejerk_std_z                          |
| tBodyAccMag_mean                     | timebodyaccelerometermagnitude_mean                  |
| tBodyAccMag_std                      | timebodyaccelerometermagnitude_std                   |
| tGravityAccMag_mean                  | timegravityaccelerometermagnitude_mean               |
| tGravityAccMag_std                   | timegravityaccelerometermagnitude_std                |
| tBodyAccJerkMag_mean                 | timebodyaccelerometerjerkmagnitude_mean              |
| tBodyAccJerkMag_std                  | timebodyaccelerometerjerkmagnitude_std               |
| tBodyGyroMag_mean                    | timebodygyroscopemagnitude_mean                      |
| tBodyGyroMag_std                     | timebodygyroscopemagnitude_std                       |
| tBodyGyroJerkMag_mean                | timebodygyroscopejerkmagnitude_mean                  |
| tBodyGyroJerkMag_std                 | timebodygyroscopejerkmagnitude_std                   |
| fBodyAcc_mean_X                      | frequencybodyaccelerometer_mean_x                    |
| fBodyAcc_mean_Y                      | frequencybodyaccelerometer_mean_y                    |
| fBodyAcc_mean_Z                      | frequencybodyaccelerometer_mean_z                    |
| fBodyAcc_std_X                       | frequencybodyaccelerometer_std_x                     |
| fBodyAcc_std_Y                       | frequencybodyaccelerometer_std_y                     |
| fBodyAcc_std_Z                       | frequencybodyaccelerometer_std_z                     |
| fBodyAcc_meanFreq_X                  | frequencybodyaccelerometer_meanfreq_x                |
| fBodyAcc_meanFreq_Y                  | frequencybodyaccelerometer_meanfreq_y                |
| fBodyAcc_meanFreq_Z                  | frequencybodyaccelerometer_meanfreq_z                |
| fBodyAccJerk_mean_X                  | frequencybodyaccelerometerjerk_mean_x                |
| fBodyAccJerk_mean_Y                  | frequencybodyaccelerometerjerk_mean_y                |
| fBodyAccJerk_mean_Z                  | frequencybodyaccelerometerjerk_mean_z                |
| fBodyAccJerk_std_X                   | frequencybodyaccelerometerjerk_std_x                 |
| fBodyAccJerk_std_Y                   | frequencybodyaccelerometerjerk_std_y                 |
| fBodyAccJerk_std_Z                   | frequencybodyaccelerometerjerk_std_z                 |
| fBodyAccJerk_meanFreq_X              | frequencybodyaccelerometerjerk_meanfreq_x            |
| fBodyAccJerk_meanFreq_Y              | frequencybodyaccelerometerjerk_meanfreq_y            |
| fBodyAccJerk_meanFreq_Z              | frequencybodyaccelerometerjerk_meanfreq_z            |
| fBodyGyro_mean_X                     | frequencybodygyroscope_mean_x                        |
| fBodyGyro_mean_Y                     | frequencybodygyroscope_mean_y                        |
| fBodyGyro_mean_Z                     | frequencybodygyroscope_mean_z                        |
| fBodyGyro_std_X                      | frequencybodygyroscope_std_x                         |
| fBodyGyro_std_Y                      | frequencybodygyroscope_std_y                         |
| fBodyGyro_std_Z                      | frequencybodygyroscope_std_z                         |
| fBodyGyro_meanFreq_X                 | frequencybodygyroscope_meanfreq_x                    |
| fBodyGyro_meanFreq_Y                 | frequencybodygyroscope_meanfreq_y                    |
| fBodyGyro_meanFreq_Z                 | frequencybodygyroscope_meanfreq_z                    |
| fBodyAccMag_mean                     | frequencybodyaccelerometermagnitude_mean             |
| fBodyAccMag_std                      | frequencybodyaccelerometermagnitude_std              |
| fBodyAccMag_meanFreq                 | frequencybodyaccelerometermagnitude_meanfreq         |
| fBodyBodyAccJerkMag_mean             | frequencybodybodyaccelerometerjerkmagnitude_mean     |
| fBodyBodyAccJerkMag_std              | frequencybodybodyaccelerometerjerkmagnitude_std      |
| fBodyBodyAccJerkMag_meanFreq         | frequencybodybodyaccelerometerjerkmagnitude_meanfreq |
| fBodyBodyGyroMag_mean                | frequencybodybodygyroscopemagnitude_mean             |
| fBodyBodyGyroMag_std                 | frequencybodybodygyroscopemagnitude_std              |
| fBodyBodyGyroMag_meanFreq            | frequencybodybodygyroscopemagnitude_meanfreq         |
| fBodyBodyGyroJerkMag_mean            | frequencybodybodygyroscopejerkmagnitude_mean         |
| fBodyBodyGyroJerkMag_std             | frequencybodybodygyroscopejerkmagnitude_std          |
| fBodyBodyGyroJerkMag_meanFreq        | frequencybodybodygyroscopejerkmagnitude_meanfreq     |
| angle(tBodyAccMean,gravity)          | angle(timebodyaccelerometermean,gravity)             |
| angle(tBodyAccJerkMean),gravityMean) | angle(timebodyaccelerometerjerkmean),gravitymean)    |
| angle(tBodyGyroMean,gravityMean)     | angle(timebodygyroscopemean,gravitymean)             |
| angle(tBodyGyroJerkMean,gravityMean) | angle(timebodygyroscopejerkmean,gravitymean)         |
| angle(X,gravityMean)                 | angle(x,gravitymean)                                 |
| angle(Y,gravityMean)                 | angle(y,gravitymean)                                 |
| angle(Z,gravityMean)                 | angle(z,gravitymean)                                 |
| output                               | activity                                             |