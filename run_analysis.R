library(dplyr)
library(tidyr)
library(lubridate)


#Step 0: Download and extract files
path <- file.path(getwd(),"test.zip")
if(!file.exists(path))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",path,method = "auto")
}
if (!file.exists(file.path(path,"UCI HAR Dataset"))) { 
  unzip(path,exdir = file.path(getwd())) 
}


#Step 1: read the activity labels and Feature Labels
data_path <- file.path(getwd())
rep_path <-  file.path(data_path,"UCI HAR Dataset")
features_labels <- read.delim(file.path(rep_path,"features.txt"),sep = "",header=FALSE,colClasses = c("numeric","character"), col.names = c("id","name"))
activity_labels <- read.delim(file.path(rep_path,"activity_labels.txt"),sep = "",header=FALSE,colClasses = c("numeric","character"),col.names = c("id","name"))

#Step 2: filter only the mean and standard deviation column
features_labels$name <- gsub("-","_",gsub("\\(\\)","",features_labels$name))
features_selected = features_labels[grep(".*([Mm]ean|[Ss]td).*",features_labels$name),2]

#Read the training activity data, output data, subject data
training_activity_data <- read.delim(file.path(rep_path,"train","X_train.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = features_labels$name,check.names = FALSE)
training_output_data <-  read.delim(file.path(rep_path,"train","y_train.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = c("activity"))
training_subject_data <-  read.delim(file.path(rep_path,"train","subject_train.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = c("subject"))

#Filter the mean and std column and bind the results
training_activity_filtered_data <- training_activity_data[,features_selected]
training_data <- cbind(training_subject_data,training_activity_filtered_data,training_output_data)


#Read the testing activity data, output data, subject data
testing_activity_data <- read.delim(file.path(rep_path,"test","X_test.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = features_labels$name,check.names = FALSE)
testing_output_data <-  read.delim(file.path(rep_path,"test","y_test.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = c("activity"))
testing_subject_data <-  read.delim(file.path(rep_path,"test","subject_test.txt"),sep = "",header=FALSE,colClasses = c("numeric"),col.names = c("subject"))

#Filter the mean and std column and bind the results
testing_activity_filtered_data <- testing_activity_data[,features_selected]
testing_data <- cbind(testing_subject_data,testing_activity_filtered_data,testing_output_data)


#Merge data
whole_data <- rbind(training_data,testing_data)

#Replace  activity id with activity names
whole_data$activity <- activity_labels$name[match(whole_data$activity,activity_labels$id)]

#clean up the column names
names(whole_data)<-gsub("mean","Mean",names(whole_data))
names(whole_data)<-gsub("Mean","Mean",names(whole_data))
names(whole_data)<-gsub("std","Std",names(whole_data))
names(whole_data)<-gsub("Acc", "Accelerometer", names(whole_data))
names(whole_data)<-gsub("Gyro", "Gyroscope", names(whole_data))
names(whole_data)<-gsub("Mag", "Magnitude", names(whole_data))
names(whole_data)<-gsub("^t", "Time", names(whole_data))
names(whole_data)<-gsub("^f", "Frequency", names(whole_data))
names(whole_data)<-gsub("tBody", "TimeBody", names(whole_data))
names(whole_data)<-gsub("angle", "Angle", names(whole_data))
names(whole_data)<-gsub("gravity", "Gravity", names(whole_data))
names(whole_data) <- tolower(names(whole_data))

names(whole_data)


factored_data<- whole_data %>% 
  mutate(activity = factor(activity))%>%
  mutate(subject = factor(subject))%>%
  group_by(activity,subject)%>%
  summarise_at(vars(timebodyaccelerometer_mean_x:frequencybodybodygyroscopejerkmagnitude_meanfreq),mean,na.rm=TRUE)

write.table(factored_data, "finalOutput.txt", row.name=FALSE)

