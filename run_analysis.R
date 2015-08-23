# acquire and install necessary packages
install.packages('dplyr')
library(dplyr)

# locate data
setwd("C:/Users/bmoore/Box Sync/Brian Moore/Challenge/UCI HAR Dataset")

# load features to workspace, remove first col & transform to character vector
features <- read.table('./features.txt', col.names=c("rowNumber","varName"))
features <- tbl_df(features) %>%
   select(varName)

vector <- as.character(features$varName)
class(vector)        ## QA the data type of the transformed variable names

# load test & train data to the workspace, applying column headers
testX <- read.table('./test/X_test.txt', header=FALSE, col.names = vector)
trainX <- read.table('./train/X_train.txt', header=FALSE, col.names = vector)

## load subject numbers to workspace
trainSubjects <- read.table('./train/subject_train.txt', header=FALSE, col.names="subject")
testSubjects <- read.table('./test/subject_test.txt', header=FALSE, col.names="subject")

## load activity IDs to workspace
trainY <- read.table('./train/y_train.txt', header=FALSE, col.names="activityId")
testY <- read.table('./test/y_test.txt', header=FALSE, col.names="activityId")

# merge test and training data first with themselves then together
testCombined <- bind_cols(testSubjects, testY, testX)
trainCombined <- bind_cols(trainSubjects, trainY, trainX)
level1Complete <- union(testCombined, trainCombined)

# house keeping
  rm(features, vector, 
     testX, testY, trainX, trainY, 
     testSubjects, trainSubjects, 
     testCombined, trainCombined)

## for part 2, I subset the full dataset for feature lables containing 'mean' 
## or 'std' then examine the resulting columns matching the criteria. 
step2 <- level1Complete[,grep("mean|std", colnames(level1Complete))]
colnames(step2)

## Add back the activity ID and Subject ID columns.
## Subset the column names to replace with their corresponding activity label
step3 <- level1Complete[,grep("mean|std|activityId|subject", colnames(level1Complete))]
cols <- as.array(colnames(step3))
class(cols)

sub3 <- as.array(step3$activity)

activityLabels <- sub("1", "walking", sub3 )
activityLabels <- sub("2", "walking_upstairs", activityLabels )
activityLabels <- sub("3", "walking_downstairs", activityLabels )
activityLabels <- sub("4", "sitting", activityLabels )
activityLabels <- sub("5", "standing", activityLabels )
activityLabels <- sub("6", "laying", activityLabels )
activityLabels <- as.data.frame(activityLabels)

## Re-arrange columns after substituting activity IDs with activityLabels
## leaving our feature names as the final columns of the data frame
revisedStep3 <- bind_cols(step3, activityLabels)
w <- ncol(revisedStep3) - 1
revisedStep3 <- revisedStep3[,c(1:2,w+1,3:w)]

colnames(revisedStep3) 

# Create tidy data table with average variable values grouped by subject and activity
tidyData <- revisedStep3 %>%
   group_by(subject,activityId,activityLabels) %>%
      summarise_each(funs(mean))

# Write to txt file
write.table(tidyData, "./tidy-data.txt", sep="\t", row.name=FALSE)

# More housekeeping
rm(w, cols, sub3, activityLabels, step3)
