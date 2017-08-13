#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Data Set"),
  tabsetPanel(type = "tabs",
              tabPanel("Start-Up Instructions", br(), 
                        textOutput("startup")),
              tabPanel("Data and Output",
  
  fluidRow( 
           column(12,h3("User must select all traits with data for the mean price to be displayed.  Hit submit when you have made your selection."))
                       ),
                       
  fluidRow(
          column(3,
                 selectInput("cut",
                             "Cut:",
                             c("All",
                               unique(as.character(diamonds$cut))))
          ),
          column(3,
                 selectInput("color",
                             "Color:",
                             c("All",
                               unique(sort(as.character(diamonds$color)))))
          ),
          column(3,
                 selectInput("clarity",
                             "Clarity:",
                             c("All",
                               unique(as.character(diamonds$clarity))))

          )
  ),
  
  submitButton("Submit"),
  
  fluidRow(
          column(12, textOutput("meanprice"))
  ),
    # Create a new row for the table.
  fluidRow(
          column(12, dataTableOutput("table"))
  ))
  
)))

