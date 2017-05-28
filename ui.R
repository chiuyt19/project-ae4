fluidPage(
  
  # Copy the line below to make a text input box
  textInput("text", label = h3("Search Artists"), value = "Enter text..."),
  fluidRow(column(3, verbatimTextOutput("value"))),
  
  
  
  
  radioButtons("radio", label = h3("Continents"),
               choices = list("Asia" = 1, "Europe" = 2, "Latin America" = 3, "United States and Canada" = 4), 
               selected = 1),
    
  fluidRow(column(3, verbatimTextOutput("value"))),
  
    

  selectInput("select", label = h3("Countries"), 
              choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
              selected = 1),
  fluidRow(column(3, verbatimTextOutput("value")))
    
  
  
)