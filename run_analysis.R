setwd("C:/oppimateriaali/coursera/ds/dataClean/data/UCI HAR Dataset")

setwd("train")
X_train <- read.table("X_train.txt", header=FALSE,nrows=-1)
Subjects_train <- read.table("subject_train.txt")
Y_train <- read.table("Y_train.txt",header = F)

setwd("../test")
X_test <- read.table("X_test.txt", header=FALSE,nrows=-1)
Subjects_test <- read.table("subject_test.txt")
Y_test <- read.table("Y_test.txt",header = F)

X <- rbind(X_train,X_test)
Y <- rbind(Y_train,Y_test)
subjects <- rbind(Subjects_train, Subjects_test)

setwd("..")
featureNames <- read.table("features.txt")
names(X)<- featureNames[,2]

means <- grepl("mean",names(X))
stds <- grepl("std",names(X))
X_means_stds <- X[ ,means | stds]

activityLabels <- read.table("activity_labels.txt")
Y_labels <- merge(activityLabels, Y, by.x = "V1", by.y = "V1")
measures_labels <- cbind(subjects, X_means_stds, Y_labels$V2)
names(measures_labels) <- c("subject",names(X_means_stds),"label")

library(dplyr)
tidy_data <- measures_labels %>% group_by(label,subject) %>% summarise_each(funs(mean))

setwd("..")
write.table(tidy_data, "tidy_data.txt", sep=",", row.names=FALSE)
