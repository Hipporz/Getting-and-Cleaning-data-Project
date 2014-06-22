Getting-and-Cleaning-data-Project
=================================
This is the code book explains each column name and row name in the tidy dataset.

##Column names
--Column 1 through 561 are variables used on the feature vector. For example,     "FeatureV23" means the 23rd variable for the feature vector.

-- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### For the following three types of variables, first two words of its column name are decription of the measurement type. "X","Y" or "Z" stand for the axis. Last number part following letter "V" stands for the vector's element index. Each vecor has 128 element.

-- "TotalAccX-V1" : The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.

-- "BodyAccX-V1": The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

-- "BodyGyroX-V1": The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Row names
--row names consist of three parts. It usually comes in the form as "Train.1.1" or "Test.1.1". The first word clearly stands for the dataset(test data or training data). The following two numbers stand for the suject ID and activity ID. For example, "Train.7.4" means this row of record is from training data, subject No.7 and activity No.4, which is sitting.

### Here is a decription of activity_labels

*1 WALKING
*2 WALKING_UPSTAIRS
*3 WALKING_DOWNSTAIRS
*4 SITTING
*5 STANDING
*6 LAYING
