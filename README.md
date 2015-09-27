getdata-032-cp
================
# Getting and Cleaning Data Course 32 Project

This repository contains code(run_analysis.R) to produce tidy text file (tidy_avg.txt), the CodeBook.md as a guidance to the tidy text file and this readme file to guide you to reproduce tidy text file.

# Steps to produce the same tidy_avg.txt
1. make sure you already have the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted to same directory as run_analysis.R without modifying anything inside "UCI HAR Dataset" folder.
2. So the data structure should looks like this  
   * run_analysis.R 
   * UCI HAR Dataset 
     * test  
         * Inertia Signals(we won't be using this folder)  
         * subject_test.txt  
         * X_test.txt  
         * y_test.txt  
     * train  
         * Inertia Signals(we won't be using this folder)  
         * subject_train.txt  
         * X_train.txt  
         * y_train.txt  
     * activity_labels.txt  
     * features.txt  
     * features_info.txt  
     * README.txt  
3. run source("run_analysis.R")