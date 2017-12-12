################################################################################
# Step 1: MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET
################################################################################

# load the test data
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# load the training data
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# bind the test files into one data frame
test <- cbind(test_subject, test_y, test_x)

# bind the train files into one data frame
train <- cbind(train_subject, train_y, train_x)

# bind the test and train data frames into one data frame
data <- rbind(test, train)


################################################################################
# Step 2: EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR
# EACH MEASUREMENT
################################################################################

# load features
features <- read.table("./data/UCI HAR Dataset/features.txt")

# change column names
colnames(data)[1:2] = c("subject", "activity")

# change remaining column names using features   
colnames(data)[3:563] = as.character(features[, 2])

# get vector of numbers of column with either subject or activity in its name
columns_subject_activity <- grep("subject|activity", names(data))

# get vector of numbers of columns with either mean or std in its name 
columns_mean_std <- grep("mean|std", names(data))

# combine the two vectors with number of columns with relevant names
relevant_columns <- c(columns_subject_activity, columns_mean_std)

# subset columns with relevant columns
data <- data[relevant_columns]


################################################################################
# Step 3: USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
################################################################################

# load activties
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

colnames(activities)[1:2] = c("id", "activity_name")

# change activity IDs in second column of data 
# with activity names in second column of activities 
data[["activity"]] <- activities[match(data[['activity']], activities[['id']]),
                                 'activity_name']


################################################################################
# Step 4: APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES 
################################################################################

colnames <- colnames(data)

# replace hyphen with dots in colnames
colnames <- gsub("-", ".", colnames)

# remove parantheses in colnames
colnames <- sub("\\()", "", colnames)

# replace t with time 
colnames <- sub("^t", "time", colnames)

# replace f with frequency
colnames <- sub("^f", "frequency", colnames)

# replace Acc with Accelerometer
colnames <- sub("Acc", "Accelerometer", colnames) 
    
# replace Gyro with Gyroscope
colnames <- sub("Gyro", "Gyroscope", colnames)

# replace Mag with Magnitude 
colnames <- sub("Mag", "Magnitude", colnames)

# replace BodyBody with Body 
colnames <- sub("BodyBody", "Body", colnames)

# replace old column names with more understandable/cleaner column names
colnames(data) <- colnames


################################################################################
# Step 5: FROM THE DATA SET IN STEP 4, CREATE A SECOND, INDEPENDENT TIDY
# DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
################################################################################

library(dplyr)

# group by subject and activity
ind_tidy_data <- group_by(data, subject, activity)

# average the columns by group with only one observation 
# for each subject-activity pair 
ind_tidy_data <- summarise_all(ind_tidy_data, mean)

# write table 
write.table(ind_tidy_data, file = "./data/tidydata.txt", row.names = FALSE)