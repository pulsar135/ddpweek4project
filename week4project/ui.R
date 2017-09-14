# Iris Data Application
# Shiny application that plots petal width vs petal length for each of the 3 
# flower species included in the iris dataset in the R datasets package. 
# The app also creates a simple linear model for each flower species that 
# estimates petal length based on the petal width and adds that to the plot
# The user is able to select the flower species of interest and input a petal
# width used to predict petal length with the linear model

# Load Libraries
library(shiny)
library(ggplot2)
library(markdown)

# Define UI for application that draws a scatterplot and outputs predicted 
# petal length
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris Data Application"),
  
  # Sidebar with a slider input for petal width and checkbox group for species 
  # selection
  sidebarLayout(
    sidebarPanel(
       sliderInput("slidePW", "Select a petal width:", 0.1, 2.5, value = 1),
       checkboxGroupInput("species", "Select Species of Interest:",
                          c("setosa", "versicolor", "virginica"), selected = c("setosa", "versicolor", "virginica"))
       
    ),
    
    # Main output panel
    mainPanel(
       tabsetPanel(type = "tabs",
                   
                   # Show a scatter plot of the petal width/length data and 
                   #output of predicted petal length values
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
                   
                   # Documentation for how the app works
                   tabPanel(
                              "Documentation",
                              mainPanel( includeMarkdown("appdoc.md")
                              )
                   )
       )
    )
  )
))
