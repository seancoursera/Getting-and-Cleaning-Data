#1. Merges the training and the test sets to create one data set.
#get featuresdf
featuresdf <- read.table('features.txt')

#get activity
activity <- read.table('activity_labels.txt')

#set the wd to test folder, use features as variable names
setwd('test')
X_test <- data.frame(read.table('X_test.txt'))
names(X_test) <- featuresdf$V2

#read ytest to act_id, change variable name to act_id
act_id <- data.frame(read.table('y_test.txt'))
names(act_id) <- 'act_id'

#read subject to sub, change variable name to sub
sub <- read.table('subject_test.txt')
names(sub) <- 'sub'

#cbind three tables: x_test, sub and act_id
testdata <- cbind(act_id, sub, X_test)


#Same as test folder, set wd to train folder, use features as variable names
setwd('..')
setwd('train')
X_train <- data.frame(read.table('X_train.txt'))
names(X_train) <- featuresdf$V2
y_train <- data.frame(read.table('y_train.txt'))
names(y_train) <- 'act_id'
sub <- read.table('subject_train.txt')
names(sub) <- 'sub'

#cbind x_train, sub and act_id
traindata <- cbind(y_train, sub, X_train)

#rbind test and train data to X_df
X_df <- rbind(testdata, traindata)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)

no_dup<- X_df[,!duplicated(colnames(X_df))]
meanandstd <- select(no_dup, act_id, sub, contains("mean"), contains("std"))

#3. Uses descriptive activity names to name the activities in the data set
meanandstd$act_id <- as.factor(meanandstd$act_id)
levels(meanandstd$act_id) <- activity$V2

#4. Appropriately labels the data set with descriptive variable names.
#I think this is done in the previous stpes. 

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
melted <- melt(meanandstd, id=c("act_id","sub"))
tidy_data <- dcast(melted, sub+act_id ~ variable, mean)

#write to the file
write.csv(tidy_data, "tidy_data.txt", row.names=FALSE)




