features.txt: We will use the 561 variables in the dataset and set them as variable names

activity_labels.txt:  6 activitis that they use to produce the data

X_train.txt: a data frame contains 7352 rows and 561 variables

subject_train.txt: vector that contains 7352 nums, shows the ID

y_train.txt: a vector that contains 7352 nums

X_test.txt:  a data frame that contains 2947 rows and 561 variables

subject_test.txt:  vector that contains 2947 nums, shows the ID

y_test.txt:  vector that contains 2947 nums

*Steps performed on the files: 

1. Get features.txt and activity_labels.txt as vector
2. Go to test folder, read the X-test file and set it's variable names by using features, cbind activity, subject and X_test
3. Go to train folder, do the same as test.
4. rbind test and train data.
5. Select mean and std columns.
6. use reshape to collect another tidy data then write to tidy_data.csv
