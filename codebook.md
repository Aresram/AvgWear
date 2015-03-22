#Codebook for AverageofTrainTestMeanStdCols 



##Going from raw data to AverageofTrainTestMeanStdCols.txt

*Data Transformations:*
*Read in test data, training data, activity codes, subject/volunteer ids, and feature/column names as data frames using _read.table_

*Saved single column from feature data frame as a list to be used as column names. Clean feature names of special characters and seperate terms by a "."

*Update test and training measurement data to use feature list as column names.

*Add column name to subject/volunteer id data frame: "Subject Identifier"

*Replace number values in activity data frame with their descriptive text counterparts i.e. replace(1, "WALKING"); see Metadata(1) _Activity Label_

*Add column name to activity data frame: "Activity Label"

*column bind activity and subject id with test/train measurement data frame to make one data frame

*row bind test and train data frames to make one measurement data frame

*subset measurement data frame to only include Subject Identifier, Activity Label, and columns with "mean" or "std" data/column name

*split measurement data frame by Subject Identifier and Activity label to obtain 1 list of data frames, split by Activity Label, per each Subject Identifier

*For each Subject, find average of all mean/std columns split by Activity Label.

*Row bind each Subject's means together to output one data frame using write.table

##Variable description

###Feature Selection and Naming

The measurements for this dataset are the averages of mean and standard deviation accelerometer and gyroscope values taken from the 30 subjects of the UCI HAR Dataset.

*Data from the UCI HAR Dataset is as follows
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable."


##Notes
*Values in the AverageofTrainTestMeanStdCols.txt data set are averages of the mean and std data in UCI HAR
*Variable/Column names are thus denoted as "Mean of"
*Original variable/column names abbreviate frequency and time measurements as "f" and "t", to be descriptive they have been denoted by "Time for" and "Frequency signal for"
*Original variable/column names have been cleaned of special characters to enhance human readability
*Variable/Column names use a version of the original names to preserve the connection between the Mean dataset and the raw data. Original column names serve to describe what measurements and operations were done to the data before being cleaned for this Mean dataset.
*Variable/Column names serve as easy reference for a human looking at both the Mean dataset and the raw data. The human can easily understand the relationship between the two data sets by the similar variable/column names 


###Metadata


1.*"Subject Identifier"*

Indicates a unique volunteer from which the data was taken. Volunteers numbered from 1-30

***Activities denoted in raw data as numbers 1-6, translated to text description of the activities***

2.*"Activity Label"*

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

##Measurement Data


*-Data taken for 3 axes*

3."Mean of Time.for.BodyAcc.mean.X"

4."Mean of Time.for.BodyAcc.mean.Y"

5."Mean of Time.for.BodyAcc.mean.Z"

*-Data taken for 3 axes*

6."Mean of Time.for.BodyAcc.std.X"

7."Mean of Time.for.BodyAcc.std.Y

8."Mean of Time.for.BodyAcc.std.Z"

*-Data taken for 3 axes*

9."Mean of Time.for.GravityAcc.mean.X"

10."Mean of Time.for.GravityAcc.mean.Y"

11."Mean of Time.for.GravityAcc.mean.Z"

*-Data taken for 3 axes*

12."Mean of Time.for.GravityAcc.std.X"

13."Mean of Time.for.GravityAcc.std.Y"

14."Mean of Time.for.GravityAcc.std.Z"

*-Data taken for 3 axes*

15."Mean of Time.for.BodyAccJerk.mean.X"

16."Mean of Time.for.BodyAccJerk.mean.Y"

17."Mean of Time.for.BodyAccJerk.mean.Z"

*-Data taken for 3 axes*

18."Mean of Time.for.BodyAccJerk.std.X"

19."Mean of Time.for.BodyAccJerk.std.Y"

20."Mean of Time.for.BodyAccJerk.std.Z"

*-Data taken for 3 axes*

21."Mean of Time.for.BodyGyro.mean.X"

22."Mean of Time.for.BodyGyro.mean.Y"

23."Mean of Time.for.BodyGyro.mean.Z"

*-Data taken for 3 axes*

24."Mean of Time.for.BodyGyro.std.X"

25."Mean of Time.for.BodyGyro.std.Y"

26."Mean of Time.for.BodyGyro.std.Z"

*-Data taken for 3 axes*

27."Mean of Time.for.BodyGyroJerk.mean.X"

28."Mean of Time.for.BodyGyroJerk.mean.Y"

29."Mean of Time.for.BodyGyroJerk.mean.Z"

*-Data taken for 3 axes*

30."Mean of Time.for.BodyGyroJerk.std.X"

31."Mean of Time.for.BodyGyroJerk.std.Y"

32."Mean of Time.for.BodyGyroJerk.std.Z"



33."Mean of Time.for.BodyAccMag.mean"

34."Mean of Time.for.BodyAccMag.std"

35."Mean of Time.for.GravityAccMag.mean"

36."Mean of Time.for.GravityAccMag.std"

37."Mean of Time.for.BodyAccJerkMag.mean"

38."Mean of Time.for.BodyAccJerkMag.std"

39."Mean of Time.for.BodyGyroMag.mean"

40."Mean of Time.for.BodyGyroMag.std"

41."Mean of Time.for.BodyGyroJerkMag.mean"

42."Mean of Time.for.BodyGyroJerkMag.std"



*-Data taken for 3 axes*

43."Mean of Frequency.signal.for.BodyAcc.mean.X"

44."Mean of Frequency.signal.for.BodyAcc.mean.Y"

45."Mean of Frequency.signal.for.BodyAcc.mean.Z"

*-Data taken for 3 axes*

46."Mean of Frequency.signal.for.BodyAcc.std.X"

47."Mean of Frequency.signal.for.BodyAcc.std.Y"

48."Mean of Frequency.signal.for.BodyAcc.std.Z"

*-Data taken for 3 axes*

49."Mean of Frequency.signal.for.BodyAcc.meanFreq.X"

50."Mean of Frequency.signal.for.BodyAcc.meanFreq.Y"

51."Mean of Frequency.signal.for.BodyAcc.meanFreq.Z"

*-Data taken for 3 axes*

52."Mean of Frequency.signal.for.BodyAccJerk.mean.X"

53."Mean of Frequency.signal.for.BodyAccJerk.mean.Y"

54."Mean of Frequency.signal.for.BodyAccJerk.mean.Z"

*-Data taken for 3 axes*

55."Mean of Frequency.signal.for.BodyAccJerk.std.X"

56."Mean of Frequency.signal.for.BodyAccJerk.std.Y"

57."Mean of Frequency.signal.for.BodyAccJerk.std.Z"

*-Data taken for 3 axes*

58."Mean of Frequency.signal.for.BodyAccJerk.meanFreq.X"

59."Mean of Frequency.signal.for.BodyAccJerk.meanFreq.Y"

"Mean of Frequency.signal.for.BodyAccJerk.meanFreq.Z"

*-Data taken for 3 axes*

"Mean of Frequency.signal.for.BodyGyro.mean.X"

"Mean of Frequency.signal.for.BodyGyro.mean.Y"

"Mean of Frequency.signal.for.BodyGyro.mean.Z"

*-Data taken for 3 axes*

"Mean of Frequency.signal.for.BodyGyro.std.X"

"Mean of Frequency.signal.for.BodyGyro.std.Y"

"Mean of Frequency.signal.for.BodyGyro.std.Z"

*-Data taken for 3 axes*

"Mean of Frequency.signal.for.BodyGyro.meanFreq.X"

"Mean of Frequency.signal.for.BodyGyro.meanFreq.Y"

"Mean of Frequency.signal.for.BodyGyro.meanFreq.Z"



"Mean of Frequency.signal.for.BodyAccMag.mean"

"Mean of Frequency.signal.for.BodyAccMag.std"

"Mean of Frequency.signal.for.BodyAccMag.meanFreq"

"Mean of Frequency.signal.for.BodyBodyAccJerkMag.mean"

"Mean of Frequency.signal.for.BodyBodyAccJerkMag.std"

"Mean of Frequency.signal.for.BodyBodyAccJerkMag.meanFreq"

"Mean of Frequency.signal.for.BodyBodyGyroMag.mean"

"Mean of Frequency.signal.for.BodyBodyGyroMag.std"

"Mean of Frequency.signal.for.BodyBodyGyroMag.meanFreq"

"Mean of Frequency.signal.for.BodyBodyGyroJerkMag.mean"

"Mean of Frequency.signal.for.BodyBodyGyroJerkMag.std"

"Mean of Frequency.signal.for.BodyBodyGyroJerkMag.meanFreq"










###License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


