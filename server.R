library("shiny")
library("httr")
library("ggplot2")
library("dplyr")


# function(input, output) {
#   output$value <- renderPrint({ input$text })
#   output$value <- renderPrint({ input$radio })
#   output$value <- renderPrint({ input$select })
#   
# }

source("./scripts/SpotifyToolUpdated.R")
temp<-GetArtist("Drake")
df<-GetTopTrack(temp$id,'US')
df<-df %>% select(name,popularity)

shinyServer(function(input, output) {

  
  
  # datasetInput <- reactive({
  #   switch(input$dataset,
  #          "rock" = rock,
  #          "pressure" = pressure,
  #          "cars" = cars)
  # })
  # 
  # a large table, reative to input$show_vars
  output$view <- renderTable({
    df
  })
  # output$ex3 <- DT::renderDataTable(
  #   DT::datatable(df, options = list(paging = FALSE,searching = FALSE))
  # )
  # 
  
})