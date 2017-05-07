function(input, output) {
  datasetInput <- reactive({
    switch(input$dataset,
           "Skaters" = NHL_Skaters,
           "Goalies" = NHL_Goalies)
  })
  
  output$table <- renderTable({
    datasetInput()
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste(input$dataset, '.csv', sep='')
    },
    content = function(file) {
      write.csv(datasetInput(), file)
    }
  )
}
