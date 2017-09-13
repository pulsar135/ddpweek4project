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
  titlePanel("Iris Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("slidePW", "Select a petal width:", 0.1, 2.5, value = 1),
       checkboxGroupInput("species", "Select Species of Interest:",
                          c("setosa", "versicolor", "virginica"), selected = c("setosa", "versicolor", "virginica"))
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(type = "tabs",
                   
                   tabPanel(
                              "Application",
                              
                              h3("Plot of Iris Dataset"),
                              plotOutput("plot"),
       
                              h3("Setosa Model Predicted Petal Length"),
                              textOutput("setospred"),
       
                              h3("Versicolor Model Predicted Petal Length"),
                              textOutput("versipred"),
       
                              h3("Virginica Model Predicted Petal Length"),
                              textOutput("virgipred")
                   ),
                   
                   tabPanel(
                              "Documentation",
                              h2("Explain Stuff Here")
                   )
       )
    )
  )
))
