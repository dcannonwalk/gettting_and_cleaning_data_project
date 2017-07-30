#Initial setups
setwd("D:/Coursera/Data Cleansing/Project")
library(reshape2)

#Download the dataset
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("data/dataset.zip")){
  download.file(URL,destfile="./data/dataset.zip",method="libcurl")
}
  
#Unzip the data
unzip("data/dataset.zip")

#Step 1: Merges the training and the test sets to create one data set.
#Extract all data from files
#Train set
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Test set
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Combine xTrain with xTest
xAll <- rbind(xTrain,xTest)

#Combine yTrain with yTest
yAll <- rbind(yTrain,yTest)

#Combine subjectTrain with subjectTest
subject <- rbind(subjectTrain,subjectTest)


#Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
#Filter out the features that are required from the features table
features <- read.table("UCI HAR Dataset/features.txt")
featuresVec <- as.character(features[,2])
featuresWantedIdx <- grep(".*mean.*|.*std.*", featuresVec)
featuresWantedVec <- grep(".*mean.*|.*std.*", featuresVec, value=TRUE)
#Renaming for convinience of reading
featuresWantedVec = gsub('-mean', 'Mean', featuresWantedVec)
featuresWantedVec = gsub('-std', 'Std', featuresWantedVec)
featuresWantedVec <- gsub('[-()]', '', featuresWantedVec)

#Subset the data using the column indexes extracted
xAll <- xAll[,featuresWantedIdx]

#Set in the column names
names(xAll) <- featuresWantedVec

#Step 3:Uses descriptive activity names to name the activities in the data set
#Filter out the activities required
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabelsVec <- as.character(activityLabels[,2])
#Change the activity codes to names
yAll[, 1] <- activityLabelsVec[yAll[, 1]]
names(yAll) <- "activity"

#Step 4:Appropriately labels the data set with descriptive variable names.
names(subject) <- "subject"
#Combine all columns
allData <- cbind(xAll,yAll,subject)
 
#Step 5:From the data set in step 4, creates a second, independent tidy data set with the average 
#       of each variable for each activity and each subject.
allDataMelt <- melt(allData, id = c("activity", "subject"))
allData2 <- dcast(allDataMelt, activity + subject ~ variable, mean)
#Write into a new file
write.table(allData2, "tidyData.txt", row.names = FALSE)

