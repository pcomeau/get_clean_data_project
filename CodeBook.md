Codebook for Tidy Data Set Average Measurment by Activity and Subject
========================================================

Data Set Description
-----------

This code book describes the variables, the data, and any transformations for the data set "Average Measurment by Activity and Subject"

This is a tidy data set created using the "Human Activity Recognition Using Smartphones Data Set" collected from the accelerometers from the Samsung Galaxy S smartphone. Per the  "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. [1] A full description of this data set can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This data set provides averages of the mean and standard deviation measuement by activity and subject. This data consists of 1 data file in csv format having 81 variables and 180 observations.

The data set adheres to the principles of tidy data:

1. Each Variable measured is in one column. The columns have been given descriptive names

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

- the aggregated tidy data set is written to a csv formatted file "subjectActivityMean.txt" in the working directory

Variables
---------

Following is a description of the variables in the data set by position:

1:subject - the numberof the subject performing the activity

2:activity - the specific activity ; activities include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

3:Average time domain Body Acceleration on the x axis of the phone mean

4:Average time domain Body Acceleration on the y axis of the phone mean

5:Average time domain Body Acceleration on the z axis of the phone mean

6:Average time domain Body Acceleration on the x axis of the phone standard deviation

7:Average time domain Body Acceleration on the y axis of the phone standard deviation

8:Average time domain Body Acceleration on the z axis of the phone standard deviation

9:Average time domain Gravity Acceleration on the x axis of the phone mean

10:Average time domain Gravity Acceleration on the y axis of the phone mean

11:Average time domain Gravity Acceleration on the z axis of the phone mean

12:Average time domain Gravity Acceleration on the x axis of the phone standard deviation

13:Average time domain Gravity Acceleration on the y axis of the phone standard deviation

14:Average time domain Gravity Acceleration on the z axis of the phone standard deviation

15:Average time domain Jerk Acceleration of the body on the x axiz of the phone mean

16:Average time domain Jerk Acceleration of the body on the y axiz of the phone mean

17:Average time domain Jerk Acceleration of the body on the z axiz of the phone mean

18:Average time domain Jerk Acceleration of the body on the x axiz of the phone standard 
deviation

19:Average time domain Jerk Acceleration of the body on the y axiz of the phone standard 
deviation

20:Average time domain Jerk Acceleration of the body on the z axiz of the phone standard 
deviation

21:Average time domain Body Gyroscope on the x axis of the phone mean

22:Average time domain Body Gyroscope on the y axis of the phone mean

23:Average time domain Body Gyroscope on the z axis of the phone mean

24:Average time domain Body Gyroscope on the x axis of the phone standard deviation

25:Average time domain Body Gyroscope on the y axis of the phone standard deviation

26:Average time domain Body Gyroscope on the z axis of the phone standard deviation

27:Average time domain Body Gyroscope Jerk on the x axis of the phone mean

28:Average time domain Body Gyroscope Jerk on the y axis of the phone mean

29:Average time domain Body Gyroscope Jerk on the z axis of the phone mean

30:Average time domain Body Gyroscope Jerk on the x axis of the phone standard deviation

31:Average time domain Body Gyroscope Jerk on the y axis of the phone standard deviation

32:Average time domain Body Gyroscope Jerk on the z axis of the phone standard deviation

33:Average time domain Body Acceleration of the phone Magnitude mean

34:Average time domain Body Acceleration of the phone Magnitude standard deviation

35:Average time domain Gravity Acceleration of the phone Magnitude mean

36:Average time domain Gravity Acceleration of the phone Magnitude standard deviation

37:Average time domain Jerk Acceleration of the phone Magnitude mean

38:Average time domain Jerk Acceleration of the phone Magnitude standard deviation

39:Average time domain Body Gyroscope of the phone Magnitude mean

40:Average time domain Body Gyroscope of the phone Magnitude standard deviation

41:Average time domain Body Gyroscope of the phone Magnitude mean

42:Average time domain Body Gyroscope of the phone Magnitude standard deviation

43:Average frequency domain Body Acceleration on the x axis of the phone mean

44:Average frequency domain Body Acceleration on the y axis of the phone mean

45:Average frequency domain Body Acceleration on the z axis of the phone mean

46:Average frequency domain Body Acceleration on the x axis of the phone standard deviation

47:Average frequency domain Body Acceleration on the y axis of the phone standard deviation

48:Average frequency domain Body Acceleration on the z axis of the phone standard deviation

49:Average frequency domain Body Acceleration on the x axis of the phone mean frequency

50:Average frequency domain Body Acceleration on the y axis of the phone mean frequency

51:Average frequency domain Body Acceleration on the z axis of the phone mean frequency

52:Average frequency domain Jerk Acceleration of the body on the x axiz of the phone mean

53:Average frequency domain Jerk Acceleration of the body on the y axiz of the phone mean

54:Average frequency domain Jerk Acceleration of the body on the z axiz of the phone mean

55:Average frequency domain Jerk Acceleration of the body on the x axiz of the phone 
standard deviation

56:Average frequency domain Jerk Acceleration of the body on the y axiz of the phone standard deviation

57:Average frequency domain Jerk Acceleration of the body on the z axiz of the phone standard deviation

58:Average frequency domain Jerk Acceleration of the body on the x axiz of the phone mean frequency

59:Average frequency domain Jerk Acceleration of the body on the y axiz of the phone mean frequency

60:Average frequency domain Jerk Acceleration of the body on the z axiz of the phone mean frequency

61:Average frequency domain Body Gyroscope on the x axis of the phone mean

62:Average frequency domain Body Gyroscope on the y axis of the phone mean

63:Average frequency domain Body Gyroscope on the z axis of the phone mean

64:Average frequency domain Body Gyroscope on the x axis of the phone standard deviation

65:Average frequency domain Body Gyroscope on the y axis of the phone standard deviation

66:Average frequency domain Body Gyroscope on the z axis of the phone standard deviation

67:Average frequency domain Body Gyroscope on the x axis of the phone mean frequency

68:Average frequency domain Body Gyroscope on the y axis of the phone mean frequency

69:Average frequency domain Body Gyroscope on the z axis of the phone mean frequency

70:Average frequency domain Body Acceleration of the phone Magnitude mean

71:Average frequency domain Body Acceleration of the phone Magnitude standard deviation

72:Average frequency domain Body Acceleration of the phone Magnitude mean frequency

73:Average frequency domain BodyJerk Acceleration of the phone Magnitude mean

74:Average frequency domain BodyJerk Acceleration of the phone Magnitude standard deviation

75:Average frequency domain BodyJerk Acceleration of the phone Magnitude mean frequency

76:Average frequency domain BodyBody Gyroscope of the phone Magnitude mean

77:Average frequency domain BodyBody Gyroscope of the phone Magnitude standard deviation

78:Average frequency domain BodyBody Gyroscope of the phone Magnitude mean frequency

79:Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude mean

80:Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude standard deviation

81:Average frequency domain BodyBody Gyroscope Jerk of the phone Magnitude mean frequency

Citation
--

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



