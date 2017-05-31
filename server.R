library("shiny")
library("httr")
library("ggplot2")
library("dplyr")

source("./scripts/SpotifyToolUpdated.R")

# temp<-GetArtist("Beyonce")
# us<-GetTopTrack(temp$id,'US')
# au<-GetTopTrack(temp$id, 'AU')
# df<-df %>% select(name,popularity)



shinyServer(function(input, output) {
  # React as the input changes 
  country <- reactive({switch(
    input$radio,
    "1" = input$AsiaPacific,
    "2" = input$Europe,
    "3" = input$LatinAmerica,
    "4" = input$UnitedStateCanada
  )})
  
  # React and pass the input value to the function and get the data frame 
  value <- reactive({
    temp<-GetArtist(input$text)
    df<-GetTopTrack(temp$id, country())
    df<-df %>% select(name,popularity,id)
    df$audio<-paste0('<iframe src="https://open.spotify.com/embed?uri=spotify:user:spotify:playlist:', df$id,'"',
                     ' width="250" height="80" frameborder="0" allowtransparency="true"></iframe>')
    # df$audio<-tags$iframe(src = paste0("https://open.spotify.com/embed?uri=spotify:user:spotify:playlist:", df$id), width = 300, height =80)
    df<-df %>% select(name,popularity)
  })
  
  
  
  
  
  # interactive data table
  output$view <- renderDataTable({
    value()
  })
  
})
