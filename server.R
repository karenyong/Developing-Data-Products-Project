#server function
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
     
     #Load data
     bnames <- read.csv("Babynames_Complete.csv")
     bnames$year <- as.character(bnames$year)

     output$plot <- renderPlot({
          mydata <- filter(bnames, location==input$location & gender==input$gender)
          g <- ggplot(mydata, aes(x=year, y=total, fill=name))
          g <- g + geom_bar(stat="identity", position=position_dodge(),
                            color="black", width=0.5) + xlab("Year") + ylab("Total")
          print(g)
     })
})

