
library(shiny)
library(ggplot2)


shinyServer(function(input, output) {

  update_data <- reactive({

    sub <- input$subject

    new_data <- Indometh[which(Indometh$Subject==sub),]

    time1 <- input$time[1]

    time2 <- input$time[2]

    new_data[which(new_data$time >= time1 & new_data$time <= time2 ),]


  })

  output$slope <- renderText({

    up2 <- update_data()

    mod <- lm(up2$conc ~ up2$time)

    mod$coefficients[2]

  })

  output$intercept <- renderText({

    up2 <- update_data()

    mod <- lm(up2$conc ~ up2$time)

    mod$coefficients[1]

  })



  output$my_plot <- renderPlot({

    up <- update_data()

    ggplot(up, aes(time,conc)) + geom_point(col="Red") + geom_smooth(method = "lm",se=input$se) +
      xlab("Time at which blood was drawn (hrs)") + ylab("Concentration (mcg/ml)")

  })

})
