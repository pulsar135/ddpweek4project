# Iris Data Application Documentation

## Application Overview
This application uses the iris dataset from the R datasets package. The app 
creates a scatter plot of petal width vs petal length for each of the three 
flower species included in the dataset and overlays a simple linear model as 
well for each of the three species.

## Iris Dataset Description
This famous (Fisher's or Anderson's) iris data set gives the measurements in 
centimeters of the variables sepal length and width and petal length and width, 
respectively, for 50 flowers from each of 3 species of iris. The species are 
Iris setosa, versicolor, and virginica.  This description along with further
information can be found in the R help file for this dataset.

## User Inputs
1. Petal Width - The user may use the slider in the sidebar to select the petal
width for which they would like the linear model to predict a petal length.
2. Species of Interest - The user may select any combination of the three 
flower species for which they would like to see plot and petal length 
prediction outputs.

## Application Outputs
1. Plot - A scatter plot of the petal width vs the petal length data included
in the iris dataset. The plot also includes three line plots of a simple linear
model based on the petal data for each of the three flower species. Finally the 
plot includes a point along each of the linear model lines showing the location
of the point identified by the user input petal width and linear model 
predicted petal length.
2. Preicted Petal Length - The predicted petal length from the linear model on
each of the three flower species based on the user input petal width.
