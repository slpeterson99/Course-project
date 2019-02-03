## NOTE: Tidyverse package assumed to be installed and loaded with library()

## Create and set working directory
if(!file.exists("./Course Project"))
  {dir.create("./Course Project")}
setwd("./Course Project")

## Download and unzip data files
fileUrl <- 
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileUrl, temp)
unzip(temp,exdir = "./", junkpaths = TRUE)  # The junkpaths parameter dumps all files into the working directory.
unlink(temp)

###########################################################################
## Part 1) Merges the training and the test sets to create one data set. ##
###########################################################################

testdata <- read.table("X_test.txt", header = FALSE)
testsubjects <- read.table("subject_test.txt", header = FALSE)
testactivities <- read.table("Y_test.txt", header = FALSE)
testdata <- cbind(testsubjects, testactivities, testdata)

traindata <- read.table("X_train.txt", header = FALSE)
trainsubjects <- read.table("subject_train.txt", header = FALSE)
trainactivities <- read.table("Y_train.txt", header = FALSE)
traindata <- cbind(trainsubjects, trainactivities, traindata)

######################################################################################
## Part 4) Appropriately labels the data set with descriptive variable names.       ##
######################################################################################

# Read column headers (column 2 contains variable names), 
#             insert "subject" and "activity" as cols 1&2 names
headers <- read.table("features.txt", header = FALSE, stringsAsFactors=FALSE)
headers <- c("subject", "activity", headers[,2])

# Assign test and train data sets identical "headers" and combines them
colnames(testdata) <- headers
colnames(traindata) <- headers
completedata <- rbind(testdata, traindata)

######################################################################################
## Part 3) Uses descriptive activity names to name the activities in the data set.  ##
######################################################################################

completedata$activity <- as.factor(completedata$activity)
levels(completedata$activity)[levels(completedata$activity)=="1"] <- "WALKING"
levels(completedata$activity)[levels(completedata$activity)=="2"] <- "WALKING_UPSTAIRS"
levels(completedata$activity)[levels(completedata$activity)=="3"] <- "WALKING_DOWNSTAIRS"
levels(completedata$activity)[levels(completedata$activity)=="4"] <- "SITTING"
levels(completedata$activity)[levels(completedata$activity)=="5"] <- "STANDING"
levels(completedata$activity)[levels(completedata$activity)=="6"] <- "LAYING"
completedata$subject <- as.factor(completedata$subject)

#####################################################################################################
## Part 2) Extracts only the measurements on the mean and standard deviation for each measurement. ##
#####################################################################################################

# Extract into new dataframe, "musigma"
variables <- grep("(.*)[Mm]ean|[Ss]td", headers)
musigmaheaders <- c(1, 2, variables)
musigma <- completedata[,musigmaheaders]

#####################################################################################################
## Part 5) From the data set in step 4, creates a second, independent tidy data set with the       ## 
##         average of each variable for each activity and each subject.                            ##
#####################################################################################################

# Calculate mean of all 86 variables, grouped by 2 dimensions: user and activity

outputtable <-  musigma %>%
  group_by(subject, activity) %>%
  summarize_all(funs(mean), na.rm = TRUE)
write.table(outputtable, file = "tidyoutput.txt", row.name=FALSE)
