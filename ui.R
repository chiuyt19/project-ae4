library(shiny)
library(dplyr)
shinyUI(
  navbarPage(img(src='myimage.png',width = "30", height = "30"),
             tabPanel("Popularity By Region",
                      titlePanel("Final Project"),
                      
                      
                      sidebarPanel(
                        textInput("text", label = h3("Search Artists")),
                        radioButtons("radio", label = h3("Select Region"),
                                     choices = list("Asia Pacific" = "1", "Europe" = "2", "Latin America" = "3", "United States and Canada" = "4")),
                        conditionalPanel(condition = "input.radio == '1'",
                                         selectInput("Asia Pacific", "Select Country",choices = c("Australia", "Japan", "Hong Kong", "Indonesia","Malaysia","New Zealand","Philippines","Singapore","Taiwan"))),
                        conditionalPanel(condition = "input.radio == '2'",
                                         selectInput("Europe", "Select Country",choices = c("Andorra", "Austria","Belgium", "Bulgaria","Cyprus","Czech Republic","Denmark","Estonia","Finland","France","Germany","Greece","Hungary"
                                                                                            ,"Iceland","Ireland","Italy","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Monaco","Netherlands","Norway","Poland","Portugal"
                                                                                            ,"Slovakia","Spain","Sweden","Switzerland","Turkey","United Kingdom"))),
                        conditionalPanel(condition = "input.radio == '3'",
                                         selectInput("Latin America", "Select Country",choices = c("Argentina", "Bolivia", "Brazil", "Chile","Colombia","Costa Rica","Dominican Republic","Ecuador", "El Salvador","Guatemala","Honduras","Mexico
                                                                                                   ","Nicaragua","Panama","Paraguay","Peru","Uruguay"))),
                        conditionalPanel(condition = "input.radio == '4'",
                                         selectInput("United States and Canada", "Select Country", choices = c("United States", "Canada"))
                        )
                                         ),
                      mainPanel(
                        dataTableOutput('ex3')
                      )
  ),
  tabPanel("Popularity By Region",
           titlePanel("Final Project"),
           
           
           sidebarPanel(
             textInput("text", label = h3("Search Artists")),
             radioButtons("radio", label = h3("Select Region"),
                          choices = list("Asia Pacific" = "1", "Europe" = "2", "Latin America" = "3", "United States and Canada" = "4")),
             conditionalPanel(condition = "input.radio == '1'",
                              selectInput("Asia Pacific", "Select Country",choices = c("Australia", "Japan", "Hong Kong", "Indonesia","Malaysia","New Zealand","Philippines","Singapore","Taiwan"))),
             conditionalPanel(condition = "input.radio == '2'",
                              selectInput("Europe", "Select Country",choices = c("Andorra", "Austria","Belgium", "Bulgaria","Cyprus","Czech Republic","Denmark","Estonia","Finland","France","Germany","Greece","Hungary"
                                                                                 ,"Iceland","Ireland","Italy","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Monaco","Netherlands","Norway","Poland","Portugal"
                                                                                 ,"Slovakia","Spain","Sweden","Switzerland","Turkey","United Kingdom"))),
             conditionalPanel(condition = "input.radio == '3'",
                              selectInput("Latin America", "Select Country",choices = c("Argentina", "Bolivia", "Brazil", "Chile","Colombia","Costa Rica","Dominican Republic","Ecuador", "El Salvador","Guatemala","Honduras","Mexico
                                                                                        ","Nicaragua","Panama","Paraguay","Peru","Uruguay"))),
             conditionalPanel(condition = "input.radio == '4'",
                              selectInput("United States and Canada", "Select Country", choices = c("United States", "Canada"))
             )
                              ),
           mainPanel(
             dataTableOutput('ex2')
           )
  )
  
  )
)


