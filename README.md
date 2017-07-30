Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R script file and documentation for the Data Science Specialization course "Getting and Cleaning data" for coursera.

The dataset that is being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files Description

The code takes for granted all the data is present in the same directory, uncompressed and no names are changed.

`CodeBook.md` summarizes the variables and operations that was performed on those variables to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 sections/steps.

The output of the 5th step is called `tidyData.txt`, and is uploaded with the rest of the files.

## Script overview

* This section describes the overview on the script file.

* The code is divided into 5 steps as instructed in the course project.

* Step 1 reads all the data from the sources.

* Step 2 subsets the data containing mean and standard deviation in column names and renames them.

* Step 3 replaces data in the activities column by its label data.

* Step 4 renames the last unnamed column.

* Step 5 melts the dataset and reshapes it using the mean of each variable with activity and subject as its ID.