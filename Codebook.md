Please consider looking in my repository for the file "Codebook.pdf", which includes very easy to read tables.  

OUTPUT DESCRIPTION

The output file, "tidyoutput," is a wide-style tidy dataset, consisting of two columns of the grouped factors, and 86 variables summarized by the mean function.  Since there are 30 subjects, each of whom engaged in 6 activities, there are 180 rows, showing a complete dataset.  Each variable forms a column; each observation forms a row; and each type of observational unit, here, the calculated means, is a table element with its own clearly labeled cell.

It is best viewed with the commands "data <- read.table("tidyoutput", header = TRUE)" (or with appropriate pathname, as needed), followed by "View(data)", which will use the Studio viewer.

To understand the meaning of the variable names in tidyoutput, it helps to understand the pattern of the complete dataset.

Variable groups in complete data set "completedata" (before extraction of mean and std columns)			
(This shows the pattern that results in creation of the original 561 variables.) 	
 
 Start column 	End column	Time or Fourier	Variable Group	# vars
   1 	 40 	t	BodyAcc	40
  41 	 80 	t	GravityAcc	40
  81 	 120 	t	BodyAccJerk	40
 121 	 160 	t	BodyGyro	40
 161 	 200 	t	BodyGyroJerk	40
 201 	 213 	t	BodyAccMag	13
 214 	 226 	t	GravityAccMag	13
 227 	 239 	t	BodyAccJerkMag	13
 240 	 252 	t	BodyGyroMag	13
 253 	 265 	t	BodyGyroJerkMag	13
 266 	 344 	f	BodyAcc	79
 345 	 423 	f	BodyAccJerk	79
 424 	 502 	f	BodyGyro	79
 503 	 515 	f	BodyAccMag	13
 516 	 528 	f	BodyBodyAccJerkMag	13
 529 	 541 	f	BodyBodyGyroMag	13
 542 	 554 	f	BodyBodyGyroJerkMag	13
 555 	 555 	f	angleangle(tBodyAccMean,gravity)	1
 556 	 556 	f	angle(tBodyAccJerkMean),gravityMean)	1
 557 	 557 	f	angle(tBodyGyroMean,gravityMean)	1
 558 	 558 	f	angle(tBodyGyroJerkMean,gravityMean)	1
 559 	 559 	f	angle(X,gravityMean)	1
 560 	 560 	f	angle(Y,gravityMean)	1
 561 	 561 	f	angle(Z,gravityMean)	1
 
Columns 1 - 200: 40-column chunks consist of:
9x3: mean, std, mad, max, min, energy, igr, entropy, correlation; 1: sma; 12: arCoeff

Columns 201 - 265: 13-column chunks consist of:
9: mean, std, mad, max, min, energy, sma, igr, entropy; 4 arCoeff

Columns 266 - 502: 79-column chunks consist of:
sma (1), mean - entropy (8x3, no correlation), + maxInds-kurtosis (4x3) + bandsEnergy (42)

Colums 503 - 554: 13-column chunks consist of:
mean, std, mad, max, min, sma, energy, igr, entropy, maxInds, meanFrew, skewness, kurtosis (9, no correlation), + maxInds-kurtosis (4)

Collumns 555 - 561 are unique summary variables.

KEY
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
angle(): Angle between two vectors.



ORIGINAL RAW DATA FILES - what was used from the unzip, and what wasn't

Not required for dataset creation, and not used:
1 file README.txt
1 file features_info.txt Shows information about the variables used on the feature vector.
18 files Inertial Signals Detailed measurements from smartphones

Used to create complete data set:
Use File name Rows Columns Range of values Comments

features.txt
Variable names  561 rows
Contains the complete list of 561 variables of each
feature vector (row) in X_test.txt and X_train.txt. Splits
into two columns in dataframe: rownumbers (1-561)
and names.

activity_labels.txt
Activity labels  6 rows
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
Links the activity labels with their activity codes in
y_test.txt and y_training.txt.

X_test.txt
Test dataset  2,947 rows 561 observations delimited by tabs

Activity
codes y_test.txt 2,947 
Values: 1-6 Activity codes for test dataset

subject_test.txt
Subject ID's  2,947 rows
Values: 2, 4, 9, 10, 12, 13 ,18, 20, 24
User ID's of the 9 subjects (30%) randomly selected
for the test data set. Each row identifies the subject
who performed the activity for each window sample.

X_train.txt
Training dataset  7,352 rows, 561 observations delimited by tabs

y_train.txt
Activity codes  7,352 rows Activity codes for training dataset

subject_train.txt
Subject ID's  7,352 rows
Values: 1, 3, 5-8, 11, 14-17, 19, 21-23, 25-30
User ID's of the 21 subjects (70%) randomly selected
for the training data set. Each row identifies the
subject who performed the activity for each window
sample.
