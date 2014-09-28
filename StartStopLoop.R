######## R Script for Creating a text file with start and stop positions for each UCE Core (MagicList.txt) #########
#Load required packages
library(ape)

#Set up the lists that will store the results of functions
individualalignment<-list()
psgendpointindex<-list()
psgstartpointindex<-list()
#Set up lists that depend on the length of the specified directory.
setwd("~/Documents/Research/Acanthomorpha/Coding/Github/probe_alignment_script/UCECoreFolder") #Set working directory to folder with each alignment file.
list.files(pattern="*.nex", all.files=FALSE,full.names=FALSE)-> ListOfFilesInFolder #This uploads each alignment file into R as both a list of names (ListOfFilesInFolder) and the actual alignments(individualalignment[[x]])
for (x in ListOfFilesInFolder) {
  individualalignment[[x]]<-read.nexus.data(x)
}
emptystorage<-vector("list",length(individualalignment))
endpoint<-vector("list",length(ListOfFilesInFolder))
startpoint<-vector("list",length(ListOfFilesInFolder))


#This function is what is repeated for each file inside the folder to find the endpoint.
endpointfunction<-function(x){
  UCE<-individualalignment[[x]]
  UCE
  matrixUCE<-as.data.frame(UCE) ##Transform the nexus file into a matrix format. 
  head(matrixUCE)
  transUCE<-t(matrixUCE) ####Transform the table so that columns of the matrix are now rows and the rows of the matrix are now columns.
  UCEarray<-as.array(transUCE) ### Change it to an array  
  UCEarray[1,] #Access the first probe (probe1)
  endpoint<-max(grep("[aA-zZ]", UCEarray[1,])) ##Select only that column that satifies the conditional statement
}

endpoint<-sapply(ListOfFilesInFolder,FUN=endpointfunction)
#This function is what is repeated for each file inside the folder to find the startpoint.
startpointfunction<-function(x){
  UCE<-individualalignment[[x]]
  UCE
  matrixUCE<-as.data.frame(UCE) ##Transform the nexus file into a matrix format. 
  head(matrixUCE)
  transUCE<-t(matrixUCE) ####Transform the table so that columns of the matrix are now rows and the rows of the matrix are now columns.
  UCEarray<-as.array(transUCE) ### Change it to an array
  startpoint<-min(grep("[aA-zZ]",UCEarray[2,]))
}
startpoint<-sapply(ListOfFilesInFolder,FUN=startpointfunction)
print(endpoint)
print(startpoint)
MagicList<-cbind(startpoint,endpoint)
print(MagicList)
write.table(MagicList,file="~/Documents/Research/Acanthomorpha/Coding/Github/probe_alignment_script/UCECoreFolder/MagicList.txt", sep= "  ", row.names=ListOfFilesInFolder, col.names=T)
