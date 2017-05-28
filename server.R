library("shiny")
library("httr")

response <- GET("https://api.spotify.com/v1/users/(user_id)/playlists")


function(input, output) {
  output$value <- renderPrint({ input$text })
  output$value <- renderPrint({ input$radio })
  output$value <- renderPrint({ input$select })
  
}