#ui function
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)

shinyui(dashboardPage(skin="green",
     dashboardHeader(title = "My Dashboard"),
     ## Sidebar content
     dashboardSidebar(
          sidebarMenu(
               menuItem("Charts", tabName = "charts", icon = icon("bar-chart")),
               menuItem("About", tabName= "about", icon = icon("info")))
          )  
     ),
     
     ## Body content
     dashboardBody(
          tabItems(
               # First tab content
               tabItem(tabName = "charts",
                       fluidRow(
                            
                            box(height=150, status="primary", width=10,
                                selectInput("location", "Select Location:", c("North America"="US", "England & Wales" = "E&W", 
                                                                              "South Australia" = "SA")),
                                selectInput("gender", "Select Gender:", c("Male" ="M","Female"= "F")),
                                box(title="Top 3 Baby Names by Gender and Location (2011 - 2013)", status="warning", solidHeader = T,
                                    width=10,plotOutput("plot", height = 250))
                            )
                       )
               ),
               
               # Second tab content
               tabItem(tabName = "about",
                       h2("About the App"),
                       p("This app provides a summary of the top 3 baby names between the years of 2011 and 2013 by gender and location."),
                       p("Two selection inputs are available: location (i.e. North America, England & Wales, South Australia)
                         and gender (i.e. Male, Female)."),
                       p("Datasets were obtained from the following websites for England & Wales, South Australia and North America:"),
                       p(a("England & Wales - Popular Baby Names",href="https://data.gov.uk/dataset/baby_names_england_and_wales")),
                       p(a("South Australia - Popular Baby Names",href="https://data.sa.gov.au/data/dataset/popular-baby-names")),  
                       a("North America - Popular Baby Names", href="https://github.com/hadley/babynames"))
               )
     )
)