data("airquality")
view(airquality)
#drop N/A  values using libraries


library(tidyr)
clean<-drop_na(airquality)
view(clean)
str(clean)  


#clean up data
clean$Month<-as.factor(clean$Month)
str(clean)


#binary classifier
x<-mean(clean$Ozone)
#create new variable, "quality" where if the ozone >mean, quality= "bad." if not,
#quality="good"

clean$Quality <- as.factor(ifelse(clean$Ozone>x,"bad","good"))
view(clean)
str(clean)

#create linear regression using the "lm" command
model<-lm(Ozone~Solar.R+Wind+Temp, data=clean)
summary(model)



