
library(shiny)

shinyUI(fluidPage(

  titlePanel("Indometh Effect Analysis"),

  sidebarLayout(
    sidebarPanel(

      numericInput("subject","Enter subject number",min=1,max=6,value = 1,step = 1),

      sliderInput("time","Select the time window:",min = 0.25,max = 8,value = c(0.25,8), step = 0.25),

      checkboxInput("se","Show confidence interval around the model"),

      h3("Slope"),

      textOutput("slope"),

      h3("Intercept"),

      textOutput("intercept")


    ),

    mainPanel(

      h4("Enter subject number and slide the timer window to generate the linear model"),

       plotOutput("my_plot")
    )
  )
))
