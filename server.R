# Shiny app (exploratory app for data sets)

library(shiny)
library(ggplot2)
data(mtcars)

server <- function(input, output) {
    data <- reactive({
        x <- grep(input$ind, names(mtcars)); x <- mtcars[ , x]
        y <- grep(input$dep, names(mtcars)); y <- mtcars[ , y]
        d <- data.frame(x = x, y = y)
    })
    output$graph <- renderPlot({
        g <- ggplot(data = data(), aes(x = x, y = y)) + xlab(input$ind) + ylab(input$dep) + ggtitle(input$title)
        g + geom_point() + geom_smooth(method = "lm")
    })
    output$fit <- renderTable({
        fit <- lm(y ~ x, data = data())
        t <- data.frame(intercept = coef(fit)[1], slope = coef(fit)[2]); row.names(t) <- NULL
        t
    })
}