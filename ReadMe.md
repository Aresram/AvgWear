 
#ReadMe for AverageofTrainTestMeanStdCols.txt

##Generate AverageofTrainTestMeanStdCols.txt
*source("run_analysis.R"); cleaning, subsetting, and outputting code will be run
*Working directory will have files
	1. TrainTestMeanStdCols.txt; list of activity and measurement data frames for each subject/volunteer
	2. AverageofTrainTestMeanStdCols.txt; data frame of means of activity and measurement data frames from each subject/volunteer


##Assumptions
*Hmisc package is installed on working machine
*Working directory of script has folder ./UCI HAR Dataset containing the relevant training, testing, subject, activity, and feature data as of 03/21/2015
*User and script have permission to write/create new files in working directory

##Using library
*Hmisc, will be loaded but not installed in script

##Helper scripts
*actreplace; given numeric activity code and activity code data frame with columns code/descriptive text, return descriptive text that corresponds to the given numeric code
*isf; given a char equal to "f" return "Frequency signal for" to descriptively title column/measurement names
*ist; given a char equal to "t" return "Frequency signal for" to descriptively title column/measurement names
*first; given a string return first char; used to descriptively title column/measurement names
*rest; given a string return chars after the first char; used to descriptively title column/measurement names
*one; given a string check if first char is "t" or "f" using isf and ist, append text to given string to build descriptive title/column



##Going from raw data to AverageofTrainTestMeanStdCols.txt

*Data Transformation:*
*Read in test data, training data, activity codes, subject/volunteer ids, and feature/column names as data frames using *read.table*

*Saved single column from feature data frame as a list to be used as column names. Clean feature names of special characters and seperate terms by a "."

*Update test and training measurement data to use feature list as column names.

*Add column name to subject/volunteer id data frame: "Subject Identifier"

*Replace number values in activity data frame with their descriptive text counterparts i.e. replace(1, "WALKING"); see Metadata(1) *Activity Label*

*Add column name to activity data frame: "Activity Label"

*column bind activity and subject id with test/train measurement data frame to make one data frame

*row bind test and train data frames to make one measurement data frame

*subset measurement data frame to only include Subject Identifier, Activity Label, and columns with "mean" or "std" data/column name

*split measurement data frame by Subject Identifier and Activity label to obtain 1 list of data frames, split by Activity Label, per each Subject Identifier

*For each Subject, find average of all mean/std columns split by Activity Label.

*Row bind each Subject's means together to output one data frame using write.table

