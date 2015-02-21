#library(shiny)
# shinyUI(pageWithSidebar(
#   headerPanel("Data science FTW!"),
#   sidebarPanel(
#     h3('Sidebar text')
#   ),
#   mainPanel(
#     h3('Main Panel text')
#   )
# ))

# shinyUI(pageWithSidebar(
#   headerPanel("Example plot"),
#   sidebarPanel(
#     sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
#   ),
#   mainPanel(
#     plotOutput('newHist')
#   )
# ))
# shinyUI(pageWithSidebar(
#   headerPanel("Hello Shiny!"),
#   sidebarPanel(
#     textInput(inputId="text1", label = "Input Text1"),
#     textInput(inputId="text2", label = "Input Text2"),
#     actionButton("goButton", "Go!")
#   ),
#   mainPanel(
#     p('Output text1'),
#     textOutput('text1'),
#     p('Output text2'),
#     textOutput('text2'),
#     p('Output text3'),
#     textOutput('text3')
#   )
# ))
# 
# ## Example 1 Facetted Scatterplot
# library(rCharts)
# names(iris) = gsub("\\.", "", names(iris))
# n1=rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')
# n1$save('n1.html',cdn=TRUE)
# cat('<iframe src="n1.html" width=100%,height=600></iframe>')


## ui.R
# require(rCharts)
# shinyUI(pageWithSidebar(
#   headerPanel("rCharts: Interactive Charts from R using polychart.js"),
#   
#   sidebarPanel(
#     selectInput(inputId = "x",
#                 label = "Choose X",
#                 choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
#                 selected = "SepalLength"),
#     selectInput(inputId = "y",
#                 label = "Choose Y",
#                 choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
#                 selected = "SepalWidth")
#   ),
#   mainPanel(
#     showOutput("myChart", "polycharts")
#   )
# ))
# 
# 
# library(shiny)
# library(ggplot2)
# 
# shinyServer(function(input, output) {
#   
#   dataset <- reactive(function() {
#     diamonds[sample(nrow(diamonds), input$sampleSize),]
#   })
#   
#   output$plot <- reactivePlot(function() {
#     
#     p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
#     
#     if (input$color != 'None')
#       p <- p + aes_string(color=input$color)
#     
#     facets <- paste(input$facet_row, '~', input$facet_col)
#     if (facets != '. ~ .')
#       p <- p + facet_grid(facets)
#     
#     if (input$jitter)
#       p <- p + geom_jitter()
#     if (input$smooth)
#       p <- p + geom_smooth()
#     
#     print(p)
#     
#   }, height=700)
#   
# })
# library(shiny)
# library(ggplot2)
# suppressPackageStartupMessages(library(googleVis))
# dataset <- diamonds
# 
# shinyUI(pageWithSidebar(
#   
#   headerPanel("Diamonds Explorer with googleviz"),
#   
#   sidebarPanel(
#     
# #     sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
# #                 value=min(1000, nrow(dataset)), step=500, round=0),
#     
#     selectInput('x', 'X', names(dataset)),
#     selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
#     #selectInput('color', 'Color', c('None', names(dataset))),
#     
#     #checkboxInput('jitter', 'Jitter'),
#     #checkboxInput('smooth', 'Smooth'),
#     
#     #selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
#     #selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
#   ),
#   
#   mainPanel(
#     plotOutput('plot')
#   )
# ))

# ui.R
shinyUI(pageWithSidebar(
  headerPanel("Pressure data set line chart"),
  sidebarPanel(
#     selectInput("dataset", "Choose a dataset:", 
#                 choices = c("rock", "pressure", "cars")),
    selectInput('x', 'X axis', names(pressure)),
    selectInput('y', 'Y axis', names(pressure),names(pressure)[2]),
    numericInput("obs", "Number of observations to preview:", 10)
  ),
  mainPanel(
    tableOutput("tab"),
    htmlOutput("view")
  )
))


