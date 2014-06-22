## ensure pre-requisite libraries are loaded
library(data.table)
library(reshape2)

## download "Human Activity Recognition Using Smartphones Data Set"
if(!file.exists("getdata_projectfiles_UCI_HAR_Dataset.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="getdata_projectfiles_UCI_HAR_Dataset.zip")
  dateDownloaded <- date()
 }

## unzip "Human Activity Recognition Using Smartphones Data Set"
if (!file.exists("har_data")) {
  dir.create("har_data")
  unzip("getdata_projectfiles_UCI_HAR_Dataset.zip",exdir="har_data")
  }


## load feature/variable label file for data files
features <- read.table("./har_data/UCI HAR Dataset/features.txt",colClasses=c("integer","character"))

## make the names suitable for column names and tidy up names
feature_labels <- make.names(features$V2,unique=TRUE)
feature_labels <- gsub("...","-",feature_labels,fixed=TRUE)

# read activity translation table
activities <- read.table("./har_data/UCI HAR Dataset/activity_labels.txt")
activity_labels <- activities$V2 

# load test data set and apply column names
x_test_df <- read.table("./har_data/UCI HAR Dataset/test/X_test.txt")
names(x_test_df) <- feature_labels 

#load activity information for test data set
DF <- read.table("./har_data/UCI HAR Dataset/test/y_test.txt")
names(DF) <- "activity" 
activity_test_dt <- as.data.table(DF)

# load subject information for test data set
DF <- read.table("./har_data/UCI HAR Dataset/test/subject_test.txt")
names(DF) <- "subject" 
subject_test_dt <- as.data.table(DF)

# merge/cbind paricipant information, activity information, and mean and standard 
# deviation related columns of test data sets. 
test_dt <- cbind(subject_test_dt,activity_test_dt,
                 x_test_df[,1:6],x_test_df[,41:46],x_test_df[,81:86],
                 x_test_df[,121:126],x_test_df[,161:166],
                 x_test_df[,201:202],x_test_df[,214:215],
                 x_test_df[,227:228],x_test_df[,240:241],
                 x_test_df[,253:254],x_test_df[,266:271],
                 x_test_df[,294:296],x_test_df[,345:350],
                 x_test_df[,373:375],x_test_df[,424:429],
                 x_test_df[,452:454],x_test_df[,503:504],
                 x_test_df[,513],x_test_df[,516:517],
                 x_test_df[,526],x_test_df[,529:530],
                 x_test_df[,539],x_test_df[,542:543],
                 x_test_df[,552])

# apply activity factors to convert activity numbers to levels
test_dt$activity <- factor(test_dt$activity)
levels(test_dt$activity) <- activities$V2

# load training data set and apply column names
x_train_df <- read.table("./har_data/UCI HAR Dataset/train/X_train.txt")
names(x_train_df) <- feature_labels 

#load activity information for training data set
DF <- read.table("./har_data/UCI HAR Dataset/train/y_train.txt")
names(DF) <- "activity" 
activity_train_dt <- as.data.table(DF)

# load subject information for training data set
DF <- read.table("./har_data/UCI HAR Dataset/train/subject_train.txt")
names(DF) <- "subject" 
subject_train_dt <- as.data.table(DF)

# merge/cbind paricipant information, activity information, and mean and standard 
# deviation related columns of training data sets. 
train_dt <- cbind(subject_train_dt,activity_train_dt,
                 x_train_df[,1:6],x_train_df[,41:46],x_train_df[,81:86],
                 x_train_df[,121:126],x_train_df[,161:166],
                 x_train_df[,201:202],x_train_df[,214:215],
                 x_train_df[,227:228],x_train_df[,240:241],
                 x_train_df[,253:254],x_train_df[,266:271],
                 x_train_df[,294:296],x_train_df[,345:350],              
                 x_train_df[,373:375],x_train_df[,424:429],                 
                 x_train_df[,452:454],x_train_df[,503:504],                 
                 x_train_df[,513],x_train_df[,516:517],
                 x_train_df[,526],x_train_df[,529:530],                 
                 x_train_df[,539],x_train_df[,542:543],
                 x_train_df[,552])
train_dt$activity <- factor(train_dt$activity)
levels(train_dt$activity) <- activities$V2

# merge/rbind test and training data
full_dt <- rbind(test_dt,train_dt)

# set certain column names in full data set due to cbind() bug
setnames(full_dt,72,feature_labels[513])
setnames(full_dt,75,feature_labels[526])
setnames(full_dt,78,feature_labels[539])
setnames(full_dt,81,feature_labels[552])

## re-shape, aggregate on subject+activity, compute means 
full_melt <- melt(full_dt, id=c("subject","activity"), measure.vars=c(3:81))
subjectActivityMean <- dcast(full_melt, subject+activity ~ variable, mean)

## set column names to descriptive names
names(subjectActivityMean) <-
c("subject","activity",
  "Average time domain Body Acceleration on the x axis of the phone mean",
  "Average time domain Body Acceleration on the y axis of the phone mean",
  "Average time domain Body Acceleration on the z axis of the phone mean",
  "Average time domain Body Acceleration on the x axis of the phone standard deviation",
  "Average time domain Body Acceleration on the y axis of the phone standard deviation",
  "Average time domain Body Acceleration on the z axis of the phone standard deviation",
  "Average time domain Gravity Acceleration on the x axis of the phone mean",
  "Average time domain Gravity Acceleration on the y axis of the phone mean",
  "Average time domain Gravity Acceleration on the z axis of the phone mean",
  "Average time domain Gravity Acceleration on the x axis of the phone standard deviation",
  "Average time domain Gravity Acceleration on the y axis of the phone standard deviation",
  "Average time domain Gravity Acceleration on the z axis of the phone standard deviation",
  "Average time domain Jerk Acceleration of the body on the x axiz of the phone mean",
  "Average time domain Jerk Acceleration of the body on the y axiz of the phone mean",
  "Average time domain Jerk Acceleration of the body on the z axiz of the phone mean",
  "Average time domain Jerk Acceleration of the body on the x axiz of the phone standard deviation",
  "Average time domain Jerk Acceleration of the body on the y axiz of the phone standard deviation",
  "Average time domain Jerk Acceleration of the body on the z axiz of the phone standard deviation",
  "Average time domain Body Gyroscope on the x axis of the phone mean",
  "Average time domain Body Gyroscope on the y axis of the phone mean",
  "Average time domain Body Gyroscope on the z axis of the phone mean",
  "Average time domain Body Gyroscope on the x axis of the phone standard deviation",
  "Average time domain Body Gyroscope on the y axis of the phone standard deviation",
  "Average time domain Body Gyroscope on the z axis of the phone standard deviation",
  "Average time domain Body Gyroscope Jerk on the x axis of the phone mean",
  "Average time domain Body Gyroscope Jerk on the y axis of the phone mean",
  "Average time domain Body Gyroscope Jerk on the z axis of the phone mean",
  "Average time domain Body Gyroscope Jerk on the x axis of the phone standard deviation",
  "Average time domain Body Gyroscope Jerk on the y axis of the phone standard deviation",
  "Average time domain Body Gyroscope Jerk on the z axis of the phone standard deviation",
  "Average time domain Body Acceleration of the phone Magnitude mean",
  "Average time domain Body Acceleration of the phone Magnitude standard deviation",
  "Average time domain Gravity Acceleration of the phone Magnitude mean",
  "Average time domain Gravity Acceleration of the phone Magnitude standard deviation",
  "Average time domain Jerk Acceleration of the phone Magnitude mean",
  "Average time domain Jerk Acceleration of the phone Magnitude standard deviation",
  "Average time domain Body Gyroscope of the phone Magnitude mean",
  "Average time domain Body Gyroscope of the phone Magnitude standard deviation",
  "Average time domain Body Gyroscope of the phone Magnitude mean",
  "Average time domain Body Gyroscope of the phone Magnitude standard deviation",
  "Average frequency domain Body Acceleration on the x axis of the phone mean",
  "Average frequency domain Body Acceleration on the y axis of the phone mean",
  "Average frequency domain Body Acceleration on the z axis of the phone mean",
  "Average frequency domain Body Acceleration on the x axis of the phone standard deviation",
  "Average frequency domain Body Acceleration on the y axis of the phone standard deviation",
  "Average frequency domain Body Acceleration on the z axis of the phone standard deviation",
  "Average frequency domain Body Acceleration on the x axis of the phone mean frequency",
  "Average frequency domain Body Acceleration on the y axis of the phone mean frequency",
  "Average frequency domain Body Acceleration on the z axis of the phone mean frequency",
  "Average frequency domain Jerk Acceleration of the body on the x axiz of the phone mean",
  "Average frequency domain Jerk Acceleration of the body on the y axiz of the phone mean",
  "Average frequency domain Jerk Acceleration of the body on the z axiz of the phone mean",
  "Average frequency domain Jerk Acceleration of the body on the x axiz of the phone standard deviation",
  "Average frequency domain Jerk Acceleration of the body on the y axiz of the phone standard deviation",
  "Average frequency domain Jerk Acceleration of the body on the z axiz of the phone standard deviation",
  "Average frequency domain Jerk Acceleration of the body on the x axiz of the phone mean frequency",
  "Average frequency domain Jerk Acceleration of the body on the y axiz of the phone mean frequency",
  "Average frequency domain Jerk Acceleration of the body on the z axiz of the phone mean frequency",
  "Average frequency domain Body Gyroscope on the x axis of the phone mean",
  "Average frequency domain Body Gyroscope on the y axis of the phone mean",
  "Average frequency domain Body Gyroscope on the z axis of the phone mean",
  "Average frequency domain Body Gyroscope on the x axis of the phone standard deviation",
  "Average frequency domain Body Gyroscope on the y axis of the phone standard deviation",
  "Average frequency domain Body Gyroscope on the z axis of the phone standard deviation",
  "Average frequency domain Body Gyroscope on the x axis of the phone mean frequency",
  "Average frequency domain Body Gyroscope on the y axis of the phone mean frequency",
  "Average frequency domain Body Gyroscope on the z axis of the phone mean frequency",
  "Average frequency domain Body Acceleration of the phone Magnitude mean",
  "Average frequency domain Body Acceleration of the phone Magnitude standard deviation",
  "Average frequency domain Body Acceleration of the phone Magnitude mean frequency",
  "Average frequency domain BodyJerk Acceleration of the phone Magnitude mean",
  "Average frequency domain BodyJerk Acceleration of the phone Magnitude standard deviation",
  "Average frequency domain BodyJerk Acceleration of the phone Magnitude mean frequency",
  "Average frequency domain BodyBody Gyroscope of the phone Magnitude mean",
  "Average frequency domain BodyBody Gyroscope of the phone Magnitude standard deviation",
  "Average frequency domain BodyBody Gyroscope of the phone Magnitude mean frequency",
  "Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude mean",
  "Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude standard deviation",
  "Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude mean frequency")


## write tidy data set
write.csv(subjectActivityMean,file="subjectActivityMean.txt",row.names=FALSE)
