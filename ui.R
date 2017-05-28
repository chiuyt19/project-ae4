fluidPage(
  
  # Copy the line below to make a text input box
  textInput("text", label = h3("Search Artists"), value = "Enter text..."),
  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value"))),
  
  
  radioButtons("radio", label = h3("Continents"),
               choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
               selected = 1),
  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value"))),
  
    # Copy the line below to make a select box 
    selectInput("select", label = h3("Countries"), 
                choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                selected = 1),
    
    hr(),
    fluidRow(column(3, verbatimTextOutput("value")))
    
  
  
)