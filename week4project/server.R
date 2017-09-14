# Server logic for the shiny web application described in the accompanying ui.R 
# file

library(shiny)

# Define server logic
shinyServer(function(input, output) {
   # Create a simple linear model on petal length for each flower species
   modelsetos <- lm(Petal.Length ~ Petal.Width, 
                    data = subset(iris, Species == "setosa"))
   modelversi <- lm(Petal.Length ~ Petal.Width, 
                    data = subset(iris, Species == "versicolor"))
   modelvirgi <- lm(Petal.Length ~ Petal.Width, 
                    data = subset(iris, Species == "virginica"))
   
   # Predict a petal length from each linear model based on petal width input
   modelsetospred <- reactive({
         PWinput <- input$slidePW
         predict(modelsetos, newdata = data.frame(Petal.Width = PWinput))
   })
   
   modelversipred <- reactive({
         PWinput <- input$slidePW
         predict(modelversi, newdata = data.frame(Petal.Width = PWinput))
   })
   
   modelvirgipred <- reactive({
         PWinput <- input$slidePW
         predict(modelvirgi, newdata = data.frame(Petal.Width = PWinput))
   })
   
   # Create the output scatterplot with linear model overlays
   output$plot <- renderPlot({
         g <- ggplot(subset(iris, Species %in% input$species), 
                     aes(x = Petal.Width, y = Petal.Length, color = Species)) +
         labs(title = "Iris Data: Petal Width vs Petal Length") + 
         labs(x = "Petal Width") + 
         labs(y = "Petal Length") + 
         theme(plot.title = element_text(hjust = 0.5)) +
         geom_point() +
         scale_color_manual(values = c( "setosa" = "red", 
                                        "versicolor" = "green", 
                                        "virginica" = "blue"))
         
         if("setosa" %in% input$species) {
               g <- g + geom_abline(intercept = coef(modelsetos)[1], 
                                    slope = coef(modelsetos)[2], color = "red", 
                                    size = 0.75) + 
                        geom_point(x = input$slidePW, y = modelsetospred(), 
                                   color = "red", size = 5)
         }
         
         
         if("versicolor" %in% input$species) {
               g <- g + geom_abline(intercept = coef(modelversi)[1], 
                                    slope = coef(modelversi)[2], 
                                    color = "green", size = 0.75) +
                        geom_point(x = input$slidePW, y = modelversipred(), 
                                   color = "green", size = 5)
         }
         
         if("virginica" %in% input$species) {
               g <- g + geom_abline(intercept = coef(modelvirgi)[1], 
                                    slope = coef(modelvirgi)[2], color = "blue", 
                                    size = 0.75) +
                        geom_point(x = input$slidePW, y = modelvirgipred(), 
                                   color = "blue", size = 5)
         }
         
         g
  })
  
  # Create output text of the predicted petal lengths based on 
  # input petal widths
  output$setospred <- renderText({ 
                                    if("setosa" %in% input$species) { 
                                          modelsetospred()
                                    } 
  })
  
  output$versipred <- renderText({ 
                                    if("versicolor" %in% input$species) {
                                          modelversipred()
                                    } 
  })
  
  output$virgipred <- renderText({ 
                                    if("virginica" %in% input$species) {
                                          modelvirgipred()
                                    } 
  })
})
