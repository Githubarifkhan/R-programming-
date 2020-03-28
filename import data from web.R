

###################### Load the data from the External Link ##########################

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"

filename <- "msleep_ggplot2.csv"
if (!file.exists(filename))
msleep <- read.csv("msleep_ggplot2.csv")
head(msleep)


                    #or
                    
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
msleep <- read.csv(url)
head(msleep)
msleep
