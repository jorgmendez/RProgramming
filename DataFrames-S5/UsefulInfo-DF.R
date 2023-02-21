#Method1: Select The File Manually
stats<- read.csv(file.choose())
stats
rm(stats)


#Method 2: Set WD and Read Data
getwd()
#Windows
setwd('C:\\Users\\jemil\\Desktop\\UdemyR\\Section5')
stats<-read.csv("Demographic-Data.csv")


#Exploring Data
stats
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats,n=8)
str(stats)
summary(stats)



#Using the $
stats
head(stats)
stats[3,3]
stats[3,'Birth.rate']
stats$Internet.users

stats$Internet.users[2]
levels(stats$Income.Group)

stats$Income.Group<-factor(stats$Income.Group, labels = c('High income',"Low income" ,"Upper middle income" ,"Upper middle income"))

# ------------------------Basic Operations with a DF
stats[1:10,]  #subsetting
stats[3:9,]
stats[c(4,100),]

#Remeber how the [] work:
is.data.frame(stats[1,]) #no need for drop=F for rows
is.data.frame(stats[,1])  
is.data.frame(stats[,1,drop=F]) #we need drop for columns



#Add column
head(stats)
stats$mycalc<-stats$Birth.rate * stats$Internet.users


#test knwoledge

stats$xyz <- 1:4
head(stats,n=12)

#remove a column
head(stats)
stats$mycalc<-NULL


# ------------------------  Filtering Data Frames
head(stats$Internet.users)
filter<-stats$Internet.users <2 #Wich countries have less than 2% of Internet Users

stats[filter,]  


stats[stats$Birth.rate>40 & stats$Internet.users <2,]

stats[stats$Income.Group=='High income',]



stats[stats$Country.Name=='Malta',]


# ------------------------ Introduction to qplot()
library(ggplot2)

qplot(data=stats, x =Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      color=I('blue'))

qplot(data=stats, x=Income.Group, y=Birth.rate,geom='boxplot')


# ------------------------ Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2),
      color=I('red'))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2),
      color=Income.Group)


# ------------------------ Create data frames
my_data_frame <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
                            Regions_2012_Dataset)

my_data_frame
head(my_data_frame)
colnames(my_data_frame)<- c('Country','Code' ,'Region' )

my_data_frame <- data.frame(Country=Countries_2012_Dataset,
                            Code=Codes_2012_Dataset,
                            Region=Regions_2012_Dataset)

head(my_data_frame)
tail(my_data_frame)

summary(my_data_frame)
str(my_data_frame)

# ------------------------ Merging DF
head(stats)
tail(my_data_frame)


merged<- merge(stats,my_data_frame, by.x='Country.Code', by.y = 'Code')
head(merged)


merged$Country.Name<- NULL

# ------------------------ Visualizing with new split

qplot(data=merged, x=Internet.users, y=Birth.rate, size=I(2), color=Region)


#1. shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, size=I(2),
      color=Region, shape=I(23))

#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, size=I(2),
      color=Region, shape=I(19), 
      alpha=I(0.5))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, size=I(2),
      color=Region, shape=I(19), 
      alpha=I(0.5), main='Birth Rate vs Internet')








 
