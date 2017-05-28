# fluidPage(
#   
#   # Copy the line below to make a text input box
#   textInput("text", label = h3("Search Artists"), value = "Enter text..."),
#   fluidRow(column(3, verbatimTextOutput("value"))),
#   
#   
#   
#   
#   radioButtons("radio", label = h3("Continents"),
#                choices = list("Asia" = 1, "Europe" = 2, "Latin America" = 3, "United States and Canada" = 4), 
#                selected = 1),
#     
#   fluidRow(column(3, verbatimTextOutput("value"))),
#   
#     
# 
#   selectInput("select", label = h3("Countries"), 
#               choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
#               selected = 1),
#   fluidRow(column(3, verbatimTextOutput("value")))
#     
#   
#   
# )
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Global Temperature"),
  
  sidebarPanel(
    checkboxGroupInput("scen1", label = h3("Select 1 Map #1 Scenario"), 
                       choices = list("pre-2000" = "past", "post-2000: 850 ppm by 2100 (a2)"="a2","post-2000: 550 ppm by 2100 (b1)"="b1"), selected = "past"),
    conditionalPanel(condition = "input.scen1 == 'past'",
                     selectInput("yearspred1", "Select Map #1 Years Hindcasted",choices = c("1920-1939", "1940-1959", "1960-1979", "1980-1999"), selected="1920-1939", multiple=FALSE)),
    conditionalPanel(condition = "input.scen1 == 'a2'",
                     selectInput("yearspred2", "Select Map #1 Years Predicted",choices = c("2020-2039", "2040-2059","2060-2079", "2080-2099")), selected="2020-2039", multiple=FALSE),
    conditionalPanel(condition = "input.scen1 == 'b1'", 
                     selectInput("yearspred3", "Select Map #1 Years Predicted",choices = c("2020-2039", "2040-2059", "2060-2079", "2080-2099"), selected="2020-2039", multiple=FALSE))
  ),
  mainPanel(
    h3(textOutput("add1")),
    imageOutput("plot1")
  )  
)
)