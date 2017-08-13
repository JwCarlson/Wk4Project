#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
didata <- diamonds

shinyServer(function(input, output) {
   
        # Filter data based on selections
        output$table <- renderDataTable({
                didata <- diamonds
                if (input$cut != "All") {
                        didata <- didata[didata$cut == input$cut,]
                }
                if (input$color != "All") {
                        didata <- didata[didata$color == input$color,]
                }
                if (input$clarity != "All") {
                        didata <- didata[didata$clarity == input$clarity,]
                }
                
                didata
        })
        
        datasubset <- reactive({
                cutInput <- input$cut
                colorInput <- input$color
                clarityInput <- input$clarity
                seldata <- diamonds[which(didata$cut== cutInput & didata$color == colorInput & didata$clarity == clarityInput),]
                mean(seldata$price)
        })
        
        output$meanprice <- renderText({
                paste("Mean price is: ",datasubset())
        })
        
        output$startup <- renderText({
                paste("This shows the diamonds dataset from ggplot2.  When data for the all criterion is selected, the mean price will be calculated for the subset of data.  Select from the drop-down menu.")
        })  
})
