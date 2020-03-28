#################Apply join in R####################
mtcars
cars_4g <- mtcars[mtcars$gear ==4,]
cars_4g
cars_mpg_25 <- mtcars[mtcars$mpg >=25,]
cars_mpg_25
?merge
mergecar <- merge(cars_4g,cars_mpg_25)
merge(cars_mpg_25, cars_4g)
mergecar
#Full join
merge(cars_4g,cars_mpg_25, all=TRUE)
#left outer join
merge_right <- merge(cars_4g,cars_mpg_25,all.x =TRUE)
merge_right

#right outer join
merge_right1 <- merge(cars_4g, cars_mpg_25, all.y =TRUE)
merge_right1

#There are amny platform from data analysis.lf one wants to continue analysing data frames that belongs to
#other dataframes w to import few tools where you must know diff types of data in R.
#following are most  common types


#types of data:       1:Flat files, 2:excel files, 3:statistical software, 4:Data from the web


#==============================Flat files==========================================================

#-----------------------importing data from flat files with utils-----------------------


#flat files are simple text files that contain table data.
#The files are converted for suitable view in R by the utilspackage.which is loaded by default when we start

ls()  #Gives out object that are in the environment.

getwd()  # shows the current working directory
setwd("F:\\eckovation.R")
getwd()
data <- read.table("titanic.csv", header = TRUE, sep=",",
                   stringsAsFactors = FALSE)
data
str(data)

#header  = true ,says that 1st row is a var. name and you want it as a header of a column.
#it is false by default ,consedering it as a part of the observation.

#sep, says the text files or data sep.since it is a csv file, the field it sep. by comma.
#stringAsfactors, are true by default . the strings atr imported as factors.
#here  sex,name,cols should not be a factor ,so stringasfactor=false.
#we can avoid specifying the requirement by read.csv() func, the requirements are set by default.
#read.csv <-("c:/Downloads/R docs/titanic.csv", stringAsfactor=FALSE)


#-------------------------------------readr----------------------------
#readr' packages reads rectangular data (like csv, tsv and fwf), its faster than utils.
#install.packages(readr)

library(readr)


data1 <- read_delim("titanic.csv", delim =",")
#we dont to specify header =true and stringasfactor =false,like we need to do in read .table()
#read_delim expects the first row to be the column names, col_names is the argument which is true by default

head(data1)
sapply(data1, class)

#col_types-------------------------

data1.2 <- read_delim("titanic.csv", delim =",",
                     col_types ="cddccdddcdcc")
head(data1.2)

#here we have changedthe class of passengerID as character by assigning it to col_types()
#c = character, d =double, i= integer, l=logical, _ =skip
sapply(data1.2, class)




#we can skip loading any particularcolumn by using skip"_" , here passengerID is not important , lets skip it.

data.1 <- read.delim("titanic.csv", delim =",",
                     col_types ="ddccdddcdcc")

head(data1.2) 

#skip and n_max-----------------------------------------------------------------

#here we will use weather.csv dataset
#we  skipped the first 5 rows but colnames also got removed.
data.w <-read_delim("weather.csv",delim = ",")
data.w=read_delim("weather.csv", delim =",", skip =5, n_max=3)
data.w


#the above problem can be solved by specyfying col_names
data.w1 =read_delim("weather.csv", delim = ",",
                    col_names = c("ID","year", "month","day","element","value"),skip = 5,n_max = 3)
data.w1
#this can be useful while working with huge datasets


#-----------------------------data.table--------------------------

#Data manipulation is done using this package but data can be read in to R by a func :fread()

#instal.packages("data.table")
library(data.table)


#here we will use similar data with and without the header colnames

#there are column names present in the data , so fread has used them as header
fread("titanic.csv")
#while here we have usedsame data with missing 1st row, which is column so fread() has put head respectively.
fread("titanic.csv")

#fread() can be said the improved version of read.table()


#==========================importing excel data=================================

#excel data can be imported using 3 packages:gdata, readxl,xlconnect

#gdata can load files from the web but only xls

#you can click on import dataset > from excel >browse , you can select import option.
#after getting done , just copy the code preview and paste it here.
#This is a faster way and will prevent you from making mistakes.

#instal.packages(gdata)
library(gdata)

#attend_data <-read.xls()

library("readxl")

#the readxl package can import both .xlsx and.xls files.
attend_data1<- read_excel("F:\\eckovation.R\\attendance.xls")
attend_data1


#you can skip the 1st row by similar steps we did back, and put new col_names()


mbta <- read_excel("mbta.xlsx")
mbta

#specify sheet with a number or name

load<- read_excel("loan.xlsx", sheet = "loan")
head(load)

loan1 <-read_excel("loan.xlsx", sheet = 2)
head(loan1)

#if missing value are available but represented(say"--",  " "), we can set  the "na" argument

loan3 <- read_excel("loan.xlsx", na= " ")
head(loan3)

#reproducible excel work with XLconnect

#remove.packages("XLconnectjars")
#remove.packages("XLconnect")
#remove.packages("rjava")

#install.packages("XLconnectjars")
#install.packages("XLconnect")
#install.packages("rjava")


#library(XLconnectjars)
#library(XLconnect)

#mbta1 <- loadworkbook("mbta.xlsx",create= F)

#wb.mtcars <- loadworkbook(system.file("demoFiles/mtcars.xlsx", package = "XLConnect"))



#============================importing data from the web ====================


df <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/zoo/zoo.data",
                 header= FALSE)

df
#==========================importing data from statistical software packages======================
#statistical software are SAS, SPSS , STATA etc.

#SAS

#install.package("haven")
library(haven)
#install.packages("sas7bdat")
library(sas7bdat)

sas.file <-read.sas7bdat("cola.sas7bdat")
sas.file


#SPSS-------------------------------------------------------------------------

#read any SPSS file based on file extension

#install.packages("foreign")
library(foreign)

#read.sav file:
read_sav("staffsurvey.sav")

read.spss("staffsurvey.sav", to.data.frame= TRUE, use.value.labels=FALSE)

data <-read.spss("staffsurvey.sav", to.data.frame= TRUE, use.value.labels=FALSE)
data


#STATA

#for state files, we need "foreign"package

stata.file <- read.dta("hpv.dta")
stata.file















