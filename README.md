## Data: Mammals Sleep

The msleep (mammals sleep) data set contains the sleep times and weights for a set of mammals and is available in the dagdata repository on github. This data set contains 83 rows and 11 variables.  

Download the msleep data set in CSV format from [here](https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv), and then load into R:

```{r}
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
msleep <- read.csv(url)
head(msleep)
```

The columns (in order) correspond to the following: 

column name | Description
--- | ---
name | common name
genus | taxonomic rank
vore | carnivore, omnivore or herbivore?
order | taxonomic rank
conservation | the conservation status of the mammal
sleep\_total | total amount of sleep, in hours
sleep\_rem | rem sleep, in hours
sleep\_cycle | length of sleep cycle, in hours
awake | amount of time spent awake, in hours
brainwt | brain weight in kilograms
bodywt | body weight in kilograms
