dir.create("project")

##Reading in Data
features <- read.table("./project/UCI HAR Dataset/features.txt", 
                       col.names = c("number", "feature"))
activities <- read.table("./project/UCI HAR Dataset/activity_labels.txt",
                         col.names = c("number", "activity"))
xtest <- read.table("./project/UCI HAR Dataset/test/X_test.txt",
                    col.names = features$feature)
ytest <- read.table("./project/UCI HAR Dataset/test/y_test.txt",
                    col.names = "act_code")
subjecttest <- read.table("./project/UCI HAR Dataset/test/subject_test.txt",
                          col.names = "subject")
xtrain <- read.table("./project/UCI HAR Dataset/train/X_train.txt",
                    col.names = features$feature)
ytrain <- read.table("./project/UCI HAR Dataset/train/y_train.txt",
                     col.names = "act_code")
subjecttrain <- read.table("./project/UCI HAR Dataset/train/subject_train.txt",
                          col.names = "subject")

## Combining the Data
xbound <- rbind(xtest, xtrain)
ybound <- rbind(ytest, ytrain)
subjbound <- rbind(subjecttest, subjecttrain)
data_full <- cbind(subjbound, ybound, xbound)

## Extracing Mean and Standard Dev
tidydata <- select(data_full, subject, act_code, contains("mean"), contains("std"))

## Naming Activities
tidydata$act_code <- gsub("1", "walking", tidydata$act_code)
tidydata$act_code <- gsub("2", "walking_upstairs", tidydata$act_code)
tidydata$act_code <- gsub("3", "walking_downstairs", tidydata$act_code)
tidydata$act_code <- gsub("4", "sitting", tidydata$act_code)
tidydata$act_code <- gsub("5", "standing", tidydata$act_code)
tidydata$act_code <- gsub("6", "laying", tidydata$act_code)

## Renaming Variables
names(tidydata)[2] <- "activities"
names(tidydata) <- gsub("^t", "time", names(tidydata))
names(tidydata) <- gsub("^f", "frequency", names(tidydata))
names(tidydata) <- gsub("Mag", "magnitude", names(tidydata))
names(tidydata) <- gsub("Acc", "accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "gyroscope", names(tidydata))
names(tidydata) <- gsub("Freq", "frequency", names(tidydata))
names(tidydata) <- gsub("BodyBody", "body", names(tidydata))
names(tidydata) <- gsub("tBody", "timebody", names(tidydata))

## Creating a Final Data set
means_data <- tidydata %>% 
  group_by(subject, activities) %>%
  summarise_all(list(mean))
str(means_data)
