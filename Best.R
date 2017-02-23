best<- function(state, outcome){
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",stringsAsFactors= F, na.strings="Not Available")
    data<- data[,c(2,7,11,17,23)]
    colnames(data) <-c("name","state","heart attack","heart failure", "pneumonia")
    ## Check that state and outcome are valid
    if(!state %in% data$state){
        stop("invalid state")}
    if(!outcome %in% c("heart attack","heart failure", "pneumonia")){
        stop("invalid outcome")}
   
    data.state<-data[data$state == state,]
    idx <- which.min (as.numeric(data.state[,outcome]))
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    data.state[idx,"name"]
}



