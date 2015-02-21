library(UsingR)
# data(galton)
# shinyServer(
#   function(input, output) {
#     output$newHist <- renderPlot({
#       hist(sample(galton$child,300), xlab='child height', col='lightblue',main='Histogram')
#       mu <- input$mu
#       lines(c(mu, mu), c(0, 200),col="red",lwd=5)
#       mse <- mean((galton$child - mu)^2)
#       text(63, 40, paste("mu = ", mu))
#       text(63, 30, paste("MSE = ", round(mse, 2)))
#     })
#   }
# )

# shinyServer(
#   function(input, output) {
#     output$text1 <- renderText({input$text1})
#     output$text2 <- renderText({input$text2})
# #     output$text3 <- renderText({
# #       input$goButton
# #       isolate(paste(input$text1, input$text2))
# output$text3 <- renderText({
#   if (input$goButton == 0) "You have not pressed the button"
#   else if (input$goButton == 1) "you pressed it once"
#   else "OK quit pressing it"
# })
#   }
# )


# ## server.r
# require(rCharts)
# shinyServer(function(input, output) {
#   output$myChart <- renderChart({
#     names(iris) = gsub("\\.", "", names(iris))
#     p1 <- rPlot(input$x, input$y, data = iris, color = "Species", 
#                 facet = "Species", type = 'point')
#     p1$addParams(dom = 'myChart')
#     return(p1)
#   })
# })

# 
# 
# suppressPackageStartupMessages(library(googleVis))
# gvisMotionChart(Fruits, "Fruit", "Year", options = list(width = 600, height = 400))
# print(M, "chart")
# 
# library(shiny)
# library(ggplot2)
# suppressPackageStartupMessages(library(googleVis))
# 
# shinyServer(function(input, output) {
#   
# #   dataset <- reactive(function() {
# #     diamonds[sample(nrow(diamonds), input$sampleSize),]
# #   })
#   
# #   output$plot <- reactivePlot(function() {
# #     
# #     p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
# #     
# #     if (input$color != 'None')
# #       p <- p + aes_string(color=input$color)
# #     
# #     facets <- paste(input$facet_row, '~', input$facet_col)
# #     if (facets != '. ~ .')
# #       p <- p + facet_grid(facets)
# #     
# #     if (input$jitter)
# #       p <- p + geom_jitter()
# #     if (input$smooth)
# #       p <- p + geom_smooth()
# #     
# #     print(p)
# #     
# #   }, height=700)
#   
#   output$plot <- reactivePlot(function() {
#     
#     Line <- gvisLineChart(diamond, xvar=input$x, yvar=input$y,
#                           options=list(title="Hello World", legend="bottom",
#                                        titleTextStyle="{color:'red', fontSize:18}",
#                                        vAxis="{gridlines:{color:'red', count:3}}",
#                                        hAxis="{title:'My Label', titleTextStyle:{color:'blue'}}",
#                                        series="[{color:'green', targetAxisIndex: 0},
#  {color: 'blue',targetAxisIndex:1}]",
#                                        vAxes="[{title:'Value 1 (%)', format:'##,######%'},
#  {title:'Value 2 (\U00A3)'}]",
#                                        curveType="function", width=500, height=300
#                           ))
#     
#     print(Line,"chart")
#     
#   }, height=700)
#   
#   
#   
#   
# })


# Contributed by Joe Cheng, February 2013
# Requires googleVis version 0.4.0 and shiny 0.4.0 or higher
# server.R
library(googleVis)
library(shiny)
shinyServer(function(input, output) {
#   datasetInput <- reactive({
#     switch(input$dataset,
#            "rock" = rock,
#            "pressure" = pressure,
#            "cars" = cars)
#   })
  output$view <- renderGvis({
    #gvisScatterChart(datasetInput())
    gvisLineChart(data=pressure,xvar=input$x,yvar=input$y,
                  options=list(title="Pressure dataset line chart", legend="bottom",
                                  titleTextStyle="{color:'red', fontSize:18}",
                                                                      #vAxis="{gridlines:{color:'red', count:3}}",
                                                                      #hAxis="{title:'My Label', titleTextStyle:{color:'blue'}}",
                                                                      #series="[{color:'green', targetAxisIndex: 0},
                                #{color: 'blue',targetAxisIndex:1}]",
                                 #                                     vAxes="[{title:'Value 1 (%)', format:'##,######%'},
                                #{title:'Value 2 (\U00A3)'}]",
                                curveType="function", width=500, height=300
                                                         ))
  })
  
  output$tab <- renderTable({
    head(pressure, n = input$obs)
  })
  
  
})

