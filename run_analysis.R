library(Hmisc)

##in
##url<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##file<-"UCIHARDataset.zip"
##download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile=file,method="internal")
##unzip(file,overwrite=TRUE)

## helper functions
actreplace<-function(i,names) names[i,2]
isf<-function(l)if(l=="f") "Frequency signal for" else "1"
ist<-function(l)if(l=="t") "Time for" else "1"
first<-function(name)substr(name,0,1)
rest<-function(name)substr(name,2,nchar(name))
csplit<-function(name)strsplit(name,split="-")
##check 1st character for measurement type
one<-function(z){
f<-first(z)
v<-NULL
if(isf(f)!="1"){
v<-isf(f)}
else if (ist(f)!="1"){
v<-ist(f)}
else v<-""
v<-paste(v,rest(z))
v
}


act<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
feat<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

sub<-read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
y<-read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE)
x<-read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)

trainsub<-read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
trainy<-read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE)
trainx<-read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)

##rename cols
a<-feat[,2]

acc<-NULL
for(i in seq_along(a)){
n<-gsub("[^[:alnum:][:blank:]+?&/\\-]", "", one(a[i]))
n<-str_replace_all(n,"\\-"," ")
n<-str_replace_all(n," ",".")
acc<-c(acc,n)
}


##name columns
colnames(x)<-acc
colnames(trainx)<-acc
		
colnames(sub)<-c("Subject Identifier")
colnames(trainsub)<-c("Subject Identifier")

##convert numbers to activity label
trainactivities<-lapply(trainy,actreplace,act)
activities<-lapply(y,actreplace,act)
activities<-data.frame(activities,stringsAsFactors=FALSE)
trainactivities<-data.frame(trainactivities,stringsAsFactors=FALSE)
colnames(activities)<-c("Activity Label")
colnames(trainactivities)<-c("Activity Label")

##add subject id and activity to df
test<-cbind(sub,activities,x)
train<-cbind(trainsub,trainactivities,trainx)


##merge test and train to one data frame
obs<-rbind(test,train)

##get only mean|std columns
subobs<-obs[c(1,2,grep("mean|std", colnames(obs)))]
##subobs<-obs[grep("mean|std", colnames(obs))]


##split up
a<-split(subobs,subobs$"Subject Identifier")
partition<-function(a){
	b<-vector("complex",length(a))
	for(n in seq_along(a))
	{	
		tmp<-NULL
		tmp<-a[[n]]
		##b[n]<-NULL
		b[n]<-list(split(tmp,tmp[,"Activity Label"]))

	}
b
}

d<-partition(a) ##list 0f 30 [list of 6 [data frame w/81 cols]]

##write mean std data
col<-TRUE
app<-TRUE
for(i in seq_along(d)){
for(n in seq_along(d[[i]])){
if(n>1||i>1) col<-FALSE
if(n==1&&i==1) app<-FALSE
else app<-TRUE
write.table(d[[i]][[n]],file="TrainTestMeanStdCols.txt",append=app,na="NA",sep=",",row.names=FALSE,col.names=col)
}
}

##compile means
r<-NULL
df<-data.frame()
for(i in seq_along(d)){
for(n in seq_along(d[[i]])){

m<-colMeans(d[[i]][[n]][,3:81]) ##mean of cols 3:81
n<-c(d[[i]][[n]][1,1],d[[i]][[n]][1,2]) ##make subject/activity list
names(n)<-c("Subject Identifier","Activity Label") ##add col names to sub/act list
l<-c(n,m) ## merge means back with sub/act
colnames(l)<-c()
r<-rbind(r,l)
##df<-data.frame(df,r,row.names=NULL,stringsAsFactors=FALSE)
}
}
df<-data.frame(r,row.names=NULL,stringsAsFactors=FALSE)
a<-colnames(df)

colnames(df)<-c("Subject Identifier","Activity Label",paste("Mean of",colnames(df[3:length(df)])))


##out
write.table(df,file="AverageofTrainTestMeanStdCols.txt",append=FALSE,na="NA",sep=",",row.names=FALSE)

write.table(colnames(df),file="codebook.txt",append=FALSE,na="NA",sep=",",row.names=FALSE)























