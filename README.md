# Course-project

The R script ("run_analysis.R"), "tidydata" output file, and corresponding code book ("Codebook.md") in this repo are deliverables to satisfy the requirements for the final project for Coursera's "Getting and Cleaning Data" course.

In this Readme, I will first describe how run_analysis.R works; then comment on why my approach has created a tidy dataset that meets the course criteria; and finally provide a high level description of the data that will be embellished in Codebook.md.

1) How run_analysis.R works

Housekeeping: the script uses commands and structures that are part of the dplyr and nibble packages.  I load a superset, tidyverse.  The library commands to load these are not embedded in the code, and are assumed to be running in the execution environment.

Approach: the source .zip file is downloaded and unzipped.  Seven files are actually used to create first a complete dataset called completedata, with all 561 variables, 10,299 rows, and the subject and activity factors.  The test and training datasets are assembled with subject and activity columns; their headers are applied from "features.txt"; then the complex test and training datasets are combined.  This completes Part 1 and Part 4 of the assignment.

Part 3 simply resets levels according to the code translations in "activity_labels.txt."

Part 2 is extraction of only the mean- and sdv-related variables.  I found it easier to do this after creation of "complete data."  Also, this approach ensures that any other extractions for other purposes can readily be done by going back to the "completedata" master.  The extraction simply uses a grep statement to pull column names with mean or std in them, and selects out those columns (after adding back the subject and activity factor headers) into a dataset called musigma.  (From mu for mean, and sigma for standard deviation).

Part 5 uses a piped, combined group_by with summarize_all to calculate the means of all
the non-factor variables, grouped by the two factors (subject and activity).  The resulting "outputtable" is written to "tidyoutput."

2) "Tidyoutput" is tidy

The output file is a wide-style tidy dataset, consisting of two columns of the grouped factors, and 86 variables summarized by the mean function.  Since there are 30 subjects, each of whom engaged in 6 activities, there are 180 rows, showing a complete dataset.  Each variable forms a column; each observation forms a row; and each type of observational unit, here, the calculated means, is a table element with its own clearly labeled cell.

It is best viewed with the commands "data <- read.table("tidyoutput", header = TRUE)" (or with appropriate pathname, as needed), followed by "View(data)", which will use the Studio viewer.


3) High level data description

The raw data consisted of several zipped files that are described in the accompanying code book.  They were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip - see credits below in the "License" section.

The project entailed the combination of the original training and test datasets; adding the appropriate column headers and factors to identify subjects and activities; subsetting the combined data to include only columns pertaining to mean and standard deviation variables; and creating a new tidy dataset that summarizes the data by providing the mean of all the subsetted variables grouped by the two factors.

The dataset consisted of 561 observations of time and frequency domain variables collected from experiments in which 30 subjects performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone.  Measurements of the smartphone's embedded accelerometer and gyroscope were refined into the observations that formed the initial dataset.

The zip package included the 7 files used here:

For both the training data, three files were used to create the combined data set:

-  'X_train.txt': Training set - the actual data values.

-  'y_train.txt': The activity codes, from 1 - 6.

-  'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Similarly, for test data, 'X_test.txt', y_test.txt', and 'subject_train.txt' were used.

The names of the activities were substituted for numerically coded factors, using 'activity_labels.txt' as the key.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
