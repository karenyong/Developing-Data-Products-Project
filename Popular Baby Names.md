Most Popular Baby Names Explorer
========================================================
author: Karen Yong
date: 16 January 2016

Overview
========================================================

Every year, parents all over the world scour the internet to find the perfect name for their newborns. This is done for various reasons including the desire to ensure that one's prince or princess does not have a name that is similar to 20,000 others in the country! 

In England & Wales, for example, between the years of 2011 - 2013, if you had wanted your baby son to have a unique name, you would have christened him something other than Harry, Oliver or Jack.

Most Popular Baby Names Explorer
========================================================

This application provides you with the ability to view the top 3 baby names by location (i.e. North America, England & Wales and South Australia) and gender, from 2011 - 2013.

The plot below shows you a sample output if you filter for baby boy names in England & Wales:

![plot of chunk unnamed-chunk-1](Popular Baby Names-figure/unnamed-chunk-1-1.png) 

Sample Code for England & Wales Plot
========================================================


```r
library(ggplot2)
library(dplyr)

#Load Data
bnames <- read.csv("Babynames_Complete.csv") 
bnames$year <- as.character(bnames$year)

mydata <- filter(bnames, location=="E&W" & gender=="M")
g <- ggplot(mydata, aes(x=year, y=total, fill=name))
g <- g + geom_bar(stat="identity", position=position_dodge(), color="black", width=0.5) + xlab("Year") + ylab("Total") + ggtitle("Top 3 Baby Names in England & Wales")
g
```

Application Link & Data Sources
========================================================

The "Most Popular Baby Names Explorer" application can be found here: 
https://kykl.shinyapps.io/Project/

Datasets have been obtained from:
- England & Wales (https://data.gov.uk/dataset/baby_names_england_and_wales)
- South Australia (https://data.sa.gov.au/data/dataset/popular-baby-names)
- North America (https://github.com/hadley/babynames)

Source codes can be found on Github: https://github.com/karenyong/Developing-Data-Products-Project



