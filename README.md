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
To create the tidy datafile, we perform the steps assigned in the project description: first to merge the training and test data sets together with the activity IDs and subject numbers. This comprehensive raw data set is then applied the variable names from the ‘features.txt’ file supplied with the raw data. Then we filter the data set for columns containing Mean or Std (deviation) to perform final analyses.
