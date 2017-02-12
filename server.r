function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    switch(input$Dataset,
           "Swiss" = swiss,
           "Beaver1" = beaver1,
           "Beaver2" = beaver2,
           "Anscombe" = anscombe,
           "MT Cars" = mtcars
           
    )
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
}