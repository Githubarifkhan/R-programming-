###########calculated column value##################

airquality
airquality[1,]
airquality[,]
airquality[,4]
data=airquality[,4]*.1
data
airquality

airquality$Tempcol <- airquality[,4]-airquality[,4]*.1
airquality

#########what is Tidyverse##################

#The tidyverse is the set of kages that work in harmony because they share common
#data representation and API design.The tidy verse packages is designed to makeit
#easy to install and load core paclages from the tidyverse in the single command.

install.packages(c("tidyverse","viridis","broomv"))

library(tidyverse)  #load all 'tidyverse' libraries.
#or
#library(ggplot2)
#library(tibble)
#library(tidyr)
#library(readr)
#library(purrr)
#library(dplyr)
#library(stringr)
#library(forcats)

#Tidyverse_conflicts conflicts between tand other  dyverse packages
tidyverse_conflicts()

#tidyverse_packages list all packages in the tidyverse
tidyverse_packages()
tidyverse_packages(include_self = TRUE)

#tidyverse_update_update tidyverse_packages(recursive=FALSE)
 
tidyverse_update(recursive=FALSE)
###############the other commomnly known and widely used packages##################
#magritter:piping to make code more readable

#################the other commony known#############

library(plasma)  #viridis other scale

x <- y <- seq(-8*pi, 8*pi, len =40)
r <- sqrt(outer(x^2 ,y^2, "+"))
filled.contour(cos(r^2)*exp(-r/(2*pi)),
               axes = FALSE,
               color.palette=plasma,
               asp=1)
##############packages for manupilating specific data format####################

#hms:easily read times
#stringr: provide a cohesive set of function designed ti make working with strings as easy to oposition 
#lubridate:advanced date/times manipulations
#forcats:advanced work with factors.
######################DATA IMPORT###################

#DBI: defines a common interface between the R and the DBMS
#haven:easily import SPSS, SAS and stata files.
#htrr :the aim of htrr is to  provide a wrapper for the curl packages, costomised to the demands of moden web API.
#jsonlite: a fast json parsor and generator optimised for statistical data and the web.
#readxl:read.xls and.xlsx files without need for dependency packages.
#rvest:rvest help you scrap information from web pages.
#xml: for xml



################ for modelling#################
#modelr: provides function that help you create elwgant pipelines when modelling
#broom: easily extract the models into tidy data.
