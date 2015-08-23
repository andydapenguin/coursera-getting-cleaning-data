---
title: "Getting & Cleaning Data Course Project"
author: "Brian Moore"
date: "2015-08-22"
output:
  html_document:
    keep_md: yes
---

## Project Description
The course project instructs students to load raw data and massage it into a more usable and readable format. The raw data came with its own readme files and well-documented descriptions of variables and methodology.

##Study design and data processing
The UCI Human Activity Regonition study obsereved 30 volunteers aged 19-48 performing 6 activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) while wearing a smartphone on the waist. The embedded accelerometer and gyroscope recorded 3-axel linear acceleration and 3-axial angular velocity. 

###Collection of the raw data
The sensor signals of the accelerometer and gyroscope were pre-processed by applying noise filters and then sampled in fixed increments of 2.56 seconds and 50% overlap to make for 128 readings/increment. The values were normalized and bound between -1 and 1. The volunteers were split into a 30% subset of training data with the remaining 70% as test data.

###Notes on the original (raw) data 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

##Creating the tidy datafile
###Guide to creating the tidy data file
To create the tidy datafile, we perform the steps assigned in the project description: first to download the data from the UCI link provided (). Then we merge the training and test data sets together with the activity IDs and subject numbers. This comprehensive raw data set is then applied the variable names from the ‘features.txt’ file supplied with the raw data. Then we filter the data set for columns containing Mean or Std (deviation) to perform final analyses.

###Cleaning of the data
Short high-level desc of the script's cleaning performance

##Description of variables in the final file
The first three variables in the final file are the subject (1-30), the activity label (walking, walking_upstairs, walking_downstairs, sitting, standing or laying) and the activity ID corresponding to the activity label as described in the activity_labels.txt file in the original data set.

The additional features in the final table come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ. Note the 'f' to indicate frequency domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ

The set of variables that were estimated from these signals are: 

* mean: Mean value
* std: Standard deviation

####Notes on variables
- Features are normalized and bounded within [-1,1].

##Sources
**Human Activity Recognition Using Smartphones Dataset**
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

