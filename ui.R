# Shiny app (exploratory app for data sets)

library(shiny)
library(ggplot2)
data(mtcars)

ui <- fluidPage(
    titlePanel("Explore mtcars dataset"),
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "ind", label = "Independent Variable", choices = names(mtcars), selected = "mpg"),
            selectInput(inputId = "dep", label = "Dependent Variable", choices = names(mtcars), selected = "hp"),
            textInput(inputId = "title", label = "Title for Graph", value = "MPG vs. HP (default)")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Graph and linear fit", plotOutput("graph"), tableOutput(outputId = "fit")),
                tabPanel("About", "This app allows the user to explore dataset (i.e. mtcars) using simple 
                         drop down menus to define the x (independent) and y (dependent) variables. Once 
                         the desired data set has been selected the coeffecients for the linear model 
                         outputs at the bottom of the graph.In addition, the user has the option of 
                         providing a title for the graph generated.")
            )
        )
    )
)