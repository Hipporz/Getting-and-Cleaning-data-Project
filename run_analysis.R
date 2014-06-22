

##Read test files
setwd("~/UCI HAR Dataset")
setwd("test")
filenames<-list.files()
TestData<-list()
for (i in 2:length(filenames)) {
  TestData[[i]]<-read.table(filenames[i])
}

##read Test inertial Signals data
setwd("Inertial Signals")
filenames<-list.files()
TestDataIS<-list()
for (i in 1:length(filenames)) {
  TestDataIS[[i]]<-read.table(filenames[i])
}


##Read Training files
setwd("~/UCI HAR Dataset")
setwd("train")
filenames<-list.files()
TrainData<-list()
for (i in 2:length(filenames)) {
  TrainData[[i]]<-read.table(filenames[i])
}

##read Training inertial Signals data
setwd("Inertial Signals")
filenames<-list.files()
TrainDataIS<-list()
for (i in 1:length(filenames)) {
  TrainDataIS[[i]]<-read.table(filenames[i])
}


##Edit Variable Names in test data
colnames(TestData[[2]])<-"Subject"
colnames(TestData[[3]])<-paste("Feature",colnames(TestData[[3]]),sep="")
colnames(TestData[[4]])<-"Activity"

colnames(TestDataIS[[1]])<-paste("BodyAccX_",colnames(TestDataIS[[1]]),sep="")
colnames(TestDataIS[[2]])<-paste("BodyAccY_",colnames(TestDataIS[[2]]),sep="")
colnames(TestDataIS[[3]])<-paste("BodyAccZ_",colnames(TestDataIS[[3]]),sep="")

colnames(TestDataIS[[4]])<-paste("GyroAccX_",colnames(TestDataIS[[4]]),sep="")
colnames(TestDataIS[[5]])<-paste("GyroAccY_",colnames(TestDataIS[[5]]),sep="")
colnames(TestDataIS[[6]])<-paste("GyroAccZ_",colnames(TestDataIS[[6]]),sep="")

colnames(TestDataIS[[7]])<-paste("TotalAccX_",colnames(TestDataIS[[7]]),sep="")
colnames(TestDataIS[[8]])<-paste("TotalAccY_",colnames(TestDataIS[[8]]),sep="")
colnames(TestDataIS[[9]])<-paste("TotalAccZ_",colnames(TestDataIS[[9]]),sep="")

##Bind all the tables from test dataset
nTest<-nrow(TestData[[2]])
Dataset<-rep("Test",nTest)
Test<-cbind(Dataset,TestData[[2]],TestData[[4]],TestData[[3]],
            TestDataIS[[1]],TestDataIS[[2]],TestDataIS[[3]],
            TestDataIS[[4]],TestDataIS[[5]],TestDataIS[[6]],
            TestDataIS[[7]],TestDataIS[[8]],TestDataIS[[9]])

##Edit Variable Names in training data
colnames(TrainData[[2]])<-"Subject"
colnames(TrainData[[3]])<-paste("Feature",colnames(TrainData[[3]]),sep="")
colnames(TrainData[[4]])<-"Activity"

colnames(TrainDataIS[[1]])<-paste("BodyAccX_",colnames(TrainDataIS[[1]]),sep="")
colnames(TrainDataIS[[2]])<-paste("BodyAccY_",colnames(TrainDataIS[[2]]),sep="")
colnames(TrainDataIS[[3]])<-paste("BodyAccZ_",colnames(TrainDataIS[[3]]),sep="")

colnames(TrainDataIS[[4]])<-paste("GyroAccX_",colnames(TrainDataIS[[4]]),sep="")
colnames(TrainDataIS[[5]])<-paste("GyroAccY_",colnames(TrainDataIS[[5]]),sep="")
colnames(TrainDataIS[[6]])<-paste("GyroAccZ_",colnames(TrainDataIS[[6]]),sep="")

colnames(TrainDataIS[[7]])<-paste("TotalAccX_",colnames(TrainDataIS[[7]]),sep="")
colnames(TrainDataIS[[8]])<-paste("TotalAccY_",colnames(TrainDataIS[[8]]),sep="")
colnames(TrainDataIS[[9]])<-paste("TotalAccZ_",colnames(TrainDataIS[[9]]),sep="")

##Bind all the tables from training dataset
nTrain<-nrow(TrainData[[2]])
Dataset<-rep("Train",nTrain)
Train<-cbind(Dataset,TrainData[[2]],TrainData[[4]],TrainData[[3]],
            TrainDataIS[[1]],TrainDataIS[[2]],TrainDataIS[[3]],
            TrainDataIS[[4]],TrainDataIS[[5]],TrainDataIS[[6]],
            TrainDataIS[[7]],TrainDataIS[[8]],TrainDataIS[[9]])

##Merge test and train data
AllData<-rbind(Test,Train)

##Write all data to file
setwd("~/UCI HAR Dataset")
write.table(AllData,file="AllData.txt",sep="\t")

##Split data by subject and activity
s<-split(AllData,list(AllData$Dataset,AllData$Subject,AllData$Activity),drop=TRUE)
variable<-colnames(AllData)[c(4:1716)]
TidyData<-t(data.frame(lapply(s,function(x) colMeans(x[,variable])),na.rm=TRUE))
write.table(TidyData,file="tidyData.txt",sep="\t")
