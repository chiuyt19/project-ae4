library("shiny")
library("httr")
library("ggplot2")
library("dplyr")

source("./scripts/SpotifyToolUpdated.R")


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
    
    #retreive the list inside whole toptack data
    imgs<-df$album$images
    #make it into a dataframe
    my.matrix<-do.call("rbind",imgs)
    imgs.df<-as.data.frame(my.matrix, stringsAsFactors=FALSE)
    #make sure they are numeric and character so we can use it 
    imgs.df$width<-as.numeric(imgs.df$width)
    imgs.df$height<-as.numeric(imgs.df$height)
    imgs.df$url<-as.character(imgs.df$url)
    
    
    
    #filter to the smallest size picture
    imgs.df<-imgs.df %>% filter(width==64)
    #make it back to the dataframe we want to use
    df$pic<- paste0('<img src="', imgs.df$url,'" height="64"></img>')
    #retreive the name of album
    name<-df$album$name
    #paste it back to the dataframe we want to use
    df$albumname<- name
    
    #only select the stuff we want 
    df<-df %>% select(pic,albumname,name,popularity)
  })
  
  
  
  
  
  # interactive data table
  output$view <- DT::renderDataTable({
    DT::datatable(value(),escape = FALSE, options = list(paging = FALSE, order = list(4, 'desc')),
                  colnames = c("Album Pic","Album Name","Song Name","Song Popularity"),class = 'cell-border stripe')
  })
  
  
  
  
})
