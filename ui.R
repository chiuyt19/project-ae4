library(shiny)
library(dplyr)

shinyUI(
  navbarPage(img(src='myimage.png',width = "30", height = "30"),theme = "bootstrap.css",
             tabPanel("Popularity By Region",
                      titlePanel("Top Ten Track by Region"),
                      
                      
                      sidebarPanel(
                        textInput("text", label = h3("Search Artists"),value = "Beyonce"),
                        helpText("This version does not support characters with space"),
                        radioButtons("radio", label = h3("Select Region"),
                                     choices = list("Asia Pacific" = "1", "Europe" = "2", "Latin America" = "3", "United States and Canada" = "4")),
                        conditionalPanel(condition = "input.radio == '1'",
                                         selectInput("AsiaPacific", "Select Country",choices = c("Australia" = "AU", "Japan" = "JP", "Hong Kong" = "HK", "Indonesia" = "ID","Malaysia" = "MY","New Zealand" = "NZ","Philippines" = "PH","Singapore" = "SG","Taiwan" = "TW"))),
                        conditionalPanel(condition = "input.radio == '2'",
                                         selectInput("Europe", "Select Country",choices = c("Andorra" = "AD", "Austria" = "AT","Belgium" = "BE", "Bulgaria" = "BG","Cyprus" = "CY","Czech Republic" = "CZ","Denmark" = "DK","Estonia" = "EE","Finland" = "FI","France" = "FR","Germany" = "DE","Greece" = "GR","Hungary" = "HU"
                                                                                            ,"Iceland" = "IS","Ireland" = "IE","Italy" = "IT","Latvia" = "LV","Liechtenstein" = "LI","Lithuania" = "LT","Luxembourg" = "LU","Malta" = "MT","Monaco" = "MC","Netherlands" = "NL","Norway" = "NO","Poland" = "PL","Portugal" = "PT"
                                                                                            ,"Slovakia" = "SK","Spain" = "ES","Sweden" = "SE","Switzerland" = "CH","Turkey" = "TR","United Kingdom" = "UK"))),
                        conditionalPanel(condition = "input.radio == '3'",
                                         selectInput("LatinAmerica", "Select Country",choices = c("Argentina" = "AR", "Bolivia" = "BO", "Brazil" = "BR", "Chile" = "CL","Colombia" = "CO","Costa Rica" = "CR","Dominican Republic" = "DO","Ecuador" = "EC", "El Salvador" = "SV","Guatemala" = "GT","Honduras" = "HN","Mexico
                                                                                                  " = "MX","Nicaragua" = "NI","Panama" = "PA","Paraguay" = "PY","Peru" = "PE","Uruguay" = "UY"))),
                        conditionalPanel(condition = "input.radio == '4'",
                                         selectInput("UnitedStateCanada", "Select Country", choices = c("United States" = "US", "Canada" = "CA"))
                        )
                        
                                         ),
                      mainPanel(
                        DT::dataTableOutput('view')
                      )
  ),
  tabPanel("Spotify Graph",
           titlePanel("Final Project"),
           
           
           sidebarPanel(
             textInput("text2", label = h3("Search Artists")),
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
  ),
  tabPanel("Documentation",
           mainPanel(includeMarkdown("./markdown/README.md")
                     
           )
           
  )
  
  
             )
  )




