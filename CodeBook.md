Codebook for Tidy Data Set Average Measurment by Activity and Subject
========================================================

Data Set Description
-----------

This code book describes the variables, the data, and any transformations for the data set "Average Measurment by Activity and Subject"

This is a tidy data set created using the "Human Activity Recognition Using Smartphones Data Set" collected from the accelerometers from the Samsung Galaxy S smartphone. Per the  "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. [1] A full description of this data set can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This data set provides averages of the mean and standard deviation measuement by activity and subject. This data consists of 1 data file in csv format having 81 variables and 180 observations.

The data set adheres to the principles of tidy data:

1. Each Variable measured is in one column

2. Each observation is in a separate row

3. Only a single type of variable exist, hence the data set contains a single table


Transformations
-----

This data set is created using an analysis script, run_Analysis.R, written in the R programming language. This script performs the following transformation in order to create a final data set aggregated by subject and activity:

- Download the "Human Activity Recognition Using Smartphones Data Set" and unzip into a data directory

- load the test data set with labels

- merge test data subject information, activities information, and the measurements on the mean and standard deviation for each observation in the test data set. The subset of measurments was determined via the raw data variable names. All variables containing the "mean" or "std" were included in the data set. 

- load the training data set with labels

- merge training data subject information, activities information, and the measurements on the mean and standard deviation for each observation in the training data set. The subset of measurments was determined via the raw data variable names. All variables containing the "mean" or "std" were included in the data set.

- merge the resulting test and training data

- the merged data set is reshaped using the melt() function

- the melted data set is then aggregated across subject and activity computing the mean of each measurement  

- the aggregated tidy data set is written to a csv formatted file "subjectActivityMean.csv" in the working directory

Variables
---------

Following is a description of the variables in the data set by position:

1:subject - the numberof the subject performing the activity

2:activity - the specific activity ; activities include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The remaining variables following the naming convention provided in the "Human Activity Recognition Using Smartphones Data Set" with the exception that each of the measurments in this data set represent an average. (prefixed by "avg-"). Hence, this code book will not re-describe each of the variables but instead provide exerpts from the referenced data set's code book:

... the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. [1]

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). [1]

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). [1]

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. [1]


3:avg- tBodyAcc.mean-X

4:avg- tBodyAcc.mean-Y

5:avg- tBodyAcc.mean-Z

6:avg- tBodyAcc.std-X

7:avg- tBodyAcc.std-Y

8:avg- tBodyAcc.std-Z

9:avg- tGravityAcc.mean-X

10:avg- tGravityAcc.mean-Y

11:avg- tGravityAcc.mean-Z

12:avg- tGravityAcc.std-X

13:avg- tGravityAcc.std-Y

14:avg- tGravityAcc.std-Z

15:avg- tBodyAccJerk.mean-X

16:avg- tBodyAccJerk.mean-Y

17:avg- tBodyAccJerk.mean-Z

18:avg- tBodyAccJerk.std-X

19:avg- tBodyAccJerk.std-Y

20:avg- tBodyAccJerk.std-Z

21:avg- tBodyGyro.mean-X

22:avg- tBodyGyro.mean-Y

23:avg- tBodyGyro.mean-Z

24:avg- tBodyGyro.std-X

25:avg- tBodyGyro.std-Y

26:avg- tBodyGyro.std-Z

27:avg- tBodyGyroJerk.mean-X

28:avg- tBodyGyroJerk.mean-Y

29:avg- tBodyGyroJerk.mean-Z

30:avg- tBodyGyroJerk.std-X

31:avg- tBodyGyroJerk.std-Y

32:avg- tBodyGyroJerk.std-Z

33:avg- tBodyAccMag.mean..

34:avg- tBodyAccMag.std..

35:avg- tGravityAccMag.mean..

36:avg- tGravityAccMag.std..

37:avg- tBodyAccJerkMag.mean..

38:avg- tBodyAccJerkMag.std..

39:avg- tBodyGyroMag.mean..

40:avg- tBodyGyroMag.std..

41:avg- tBodyGyroJerkMag.mean..

42:avg- tBodyGyroJerkMag.std..

43:avg- fBodyAcc.mean-X

44:avg- fBodyAcc.mean-Y

45:avg- fBodyAcc.mean-Z

46:avg- fBodyAcc.std-X

47:avg- fBodyAcc.std-Y

48:avg- fBodyAcc.std-Z

49:avg- fBodyAcc.meanFreq-X

50:avg- fBodyAcc.meanFreq-Y

51:avg- fBodyAcc.meanFreq-Z

52:avg- fBodyAccJerk.mean-X

53:avg- fBodyAccJerk.mean-Y

54:avg- fBodyAccJerk.mean-Z

55:avg- fBodyAccJerk.std-X

56:avg- fBodyAccJerk.std-Y

57:avg- fBodyAccJerk.std-Z

58:avg- fBodyAccJerk.meanFreq-X

59:avg- fBodyAccJerk.meanFreq-Y

60:avg- fBodyAccJerk.meanFreq-Z

61:avg- fBodyGyro.mean-X

62:avg- fBodyGyro.mean-Y

63:avg- fBodyGyro.mean-Z

64:avg- fBodyGyro.std-X

65:avg- fBodyGyro.std-Y

66:avg- fBodyGyro.std-Z

67:avg- fBodyGyro.meanFreq-X

68:avg- fBodyGyro.meanFreq-Y

69:avg- fBodyGyro.meanFreq-Z

70:avg- fBodyAccMag.mean..

71:avg- fBodyAccMag.std..

72:avg- fBodyAccMag.meanFreq..

73:avg- fBodyBodyAccJerkMag.mean..

74:avg- fBodyBodyAccJerkMag.std..

75:avg- fBodyBodyAccJerkMag.meanFreq..

76:avg- fBodyBodyGyroMag.mean..

77:avg- fBodyBodyGyroMag.std..

78:avg- fBodyBodyGyroMag.meanFreq..

79:avg- fBodyBodyGyroJerkMag.mean..

80:avg- fBodyBodyGyroJerkMag.std..

81:avg- fBodyBodyGyroJerkMag.meanFreq..

Citation
--

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



