## Install required packages
require(reshape2)
require(plyr)

## Script for function to read in correct files
getdata <- function(directory = getwd(), class="test") {

  ## Create File names and path
  subjectfile <- paste(directory,class,paste("subject_",class,".txt", sep=""), sep="/")
  Xfile <- paste(directory,class,paste("X_",class,".txt", sep=""), sep="/")
  Yfile <- paste(directory,class,paste("Y_",class,".txt", sep=""), sep="/")

  ## Read data in and combine all files
  subjectdata <- read.table(subjectfile,sep=" ", col.names="Subject_id")
  Xdata <- read.table(Xfile)
  Ydata <- read.table(Yfile,sep=" ", col.names="Activity_id")
  data <- cbind(subjectdata, Ydata, Xdata)
  
  ## return data   
  data   
}


## (Step 1) Extract Test & Training Data and combine
## Define path for files (assumes data unziped into working directory, but folder structure left intact)
path <- paste(getwd(), "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset",sep="/")

## Use function (script above) to extract data, and combine
testdata <- getdata(directory=path, class="test")
traindata <- getdata(directory=path, class="train")
alldata <- rbind(traindata, testdata)

## (Step 2) Create data set with just mean & std (deliberately ignoring meanFreq, and angle() variable features)
## Find required columns from the data in the features.txt file (row in features file = column of data)
features <- read.table(paste(path,"features.txt",sep="/"), sep="", colClasses=c("NULL","character"))
rowreq <- c(grep(("mean\\(\\)|std\\(\\)|meanFreq\\(\\)"),features[,1]))

## Melt data down to only contain correct columns
requiredalldata <- melt(alldata, id=colnames(alldata[c(1,2)]),measure.vars=colnames(alldata[,rowreq+2]))

## (Step 3) Apply Descriptive Activity Names
## Get Activity labels
activitylabelfile <- paste(path,"activity_labels.txt",sep="/")
activitylabels <- read.table(activitylabelfile, sep="", col.names=c("Activity_id", "activity"))

## Add to data
requiredalldata$Activity_id <- as.factor(requiredalldata$Activity_id)
levels(requiredalldata$Activity_id) <- activitylabels$activity

## (Step 4) Label Data with descriptive names (only labels created here, added in step 5)
reqnames <- as.character(features[rowreq,])
searchterm <- c("^t","^f", "Acc", "Gyro", "Jerk", "Mag", "-mean\\(\\)", 
                "-std\\(\\)","-meanFreq\\(\\)", "-X", "-Y", "-Z", "BodyBody","Body","Gravity")
replaceterm <- c("time_", "freq_", "acc_", "gyro_", "jerk_", "mag_", 
                 "mean", "stddev","meanfreq", "_x","_y","_z","Body","body_","gravity_")

for(i in seq(1:length(searchterm))) { reqnames <- gsub(searchterm[i],replaceterm[i],reqnames) }

## (Step 5) Calc mean based on Subject ID and Activity ID
requireddatamean <- ddply(requiredalldata, .(Subject_id, Activity_id, variable), summarize, mean=mean(value))

## Recast Data to required tidy format, and add colnames from Step 4 
finaldata <- as.data.frame(dcast(requireddatamean, Subject_id + Activity_id ~ variable, value.var="mean"))
colnames(finaldata) <- c(colnames(finaldata[1:2]),reqnames)

## Export Data as txt (comma separated)
## Saved in the working directory
fileout <- paste(getwd(),"TidyData.txt",sep="/")
write.table(finaldata, file=fileout, row.names=FALSE, sep=",")

