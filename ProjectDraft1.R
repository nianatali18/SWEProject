library(shiny)
library(shinydashboard)
library(shinyjs)

ui <- fluidPage(
  titlePanel(HTML('<i class="fas fa-lightbulb"> <span style="font-family: Arial, sans-serif;"><span style="color: blue;"></i> EnerGSavings')),
  
  tags$style(HTML("body {background-color: wheat;}")),
  
  div(class = "container", style = "text-align: center;",
      HTML('<a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-linkedin"></a>'),
      tags$head(tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"))
  ),
  
  tabsetPanel(
    id = "mainTabs",
    type = "tabs",
    
    tabPanel("Home",
             div(style = "border: 2px solid black; border-radius: 10px; padding: 10px; margin: 10px;",
                 h2("Here at EnerGSaving we have a mission to help the GLOBE by saving energy!"),
                 br(),
                 br(),
                 p("This app provides valuable information and tools for saving energy and reducing your carbon footprint."),
                 p("Explore the tabs at the top to find energy-saving options, learn about our business, access FAQs, and get in touch with us."),
                 p("Let's start saving energy!")
             )
    ),
    
    tabPanel("Data Analysis",
             div(style = "border: 2px solid black; border-radius: 10px; padding: 10px; margin: 10px;",
                 h2("Ways to Save Energy: (Begin by pressing the lighting button followed by the blue button that reads Get Sugguestions )"),
                 fluidRow(
                   column(width = 4,
                          actionButton("lightingBtn", "Lighting"),
                          conditionalPanel(condition = "input.lightingBtn > 0",
                                           checkboxGroupInput("lightingOptions", "Select lighting options:",
                                                              choices = c("LED Bulbs", "Smart Lighting"),
                                                              selected = character(0)),
                                           conditionalPanel(condition = "input.lightingOptions.length > 0",
                                                            checkboxGroupInput("lightingSubOptions", "Select sub-options:",
                                                                               choices = c("Living Room", "Kitchen", "Bedroom"),
                                                                               selected = character(0))
                                           )
                          )
                   ),
                   column(width = 4,
                          actionButton("appliancesBtn", "Home Appliances"),
                          conditionalPanel(condition = "input.appliancesBtn > 0",
                                           checkboxGroupInput("appliancesOptions", "Select appliances options:",
                                                              choices = c("Energy-Efficient Appliances", "Smart Appliances"),
                                                              selected = character(0)),
                                           conditionalPanel(condition = "input.appliancesOptions.length > 0",
                                                            checkboxGroupInput("appliancesSubOptions", "Select sub-options:",
                                                                               choices = c("Refrigerator", "Washer/Dryer", "Dishwasher"),
                                                                               selected = character(0))
                                           )
                          )
                   ),
                   column(width = 4,
                          actionButton("heatingCoolingBtn", "Heating and Cooling"),
                          conditionalPanel(condition = "input.heatingCoolingBtn > 0",
                                           checkboxGroupInput("heatingCoolingOptions", "Select heating and cooling options:",
                                                              choices = c("Programmable Thermostat", "Regular Maintenance"),
                                                              selected = character(0))
                          )
                   )
                 ),
                 submitButton("Get Suggestions")
             )
    ),
    
    tabPanel("About Us",
             div(style = "border: 2px solid black; border-radius: 10px; padding: 10px; margin: 10px;",
                 h2("About Our Business and Mission"),
                 p("We are a company dedicated to helping you save energy and reduce your carbon footprint."),
                 p("Our mission is to provide innovative solutions that make a positive impact on the environment."),
                 p("By using our app we can help provide tips that will allow you to start saving more energy."),
                 p("You may even find that you are already doing great when it comes to saving energy!"),
                 p("Our team is a mix of professionals that contribute to this application in many different ways."),
                 p("From engineers, to energy forecasters, we are constantly staying up to date with our information by consulting many professionals."),
                 p("")
             )
    ),
    
    tabPanel("FAQ",
             div(style = "border: 2px solid black; border-radius: 10px; padding: 10px; margin: 10px;",
                 h2("Frequently Asked Questions"),
                 p("Question: How do I use this app?"),
                 p("Answer: Begin by pressing the get sugguestions button, from there you can move forward and select some elements to get advice"),
                 p("Each time you press the button it moves on to the next category."),
                 br(),
                 br(),
                 p("Question: What is the benefit of using this application?"),
                 p("Answer: The benefit of the application is to learn more about what you can do better to save energy in your home, which not only helps the earth, but helps your wallet. ")
             )
    ),
    
    tabPanel("Contact/Mailing",
             div(style = "border: 2px solid black; border-radius: 10px; padding: 10px; margin: 10px;",
                 h2("Contact Us"),
                 p("Please use the form below to get in touch with us:"),
                 textInput("name", "Name", ""),
                 textInput("email", "Email", ""),
                 textAreaInput("message", "Message", ""),
                 actionButton("submit", "Submit")
             )
    ),
    
    verbatimTextOutput("suggestions")
  )
)

server <- function(input, output, session) {
  output$selectedOptions <- renderPrint({
    input$energyOptions
  })
  
  output$suggestions <- renderPrint({
    req(input$lightingBtn, input$appliancesBtn, input$heatingCoolingBtn)
    
    suggestions <- character(0)
    
    if (input$lightingBtn > 0) {
      lighting_options <- paste(input$lightingOptions, collapse = ", ")
      suggestions <- c(suggestions, paste("Lighting options selected:", lighting_options))
      if (length(input$lightingSubOptions) > 0) {
        sub_options <- paste(input$lightingSubOptions, collapse = ", ")
        suggestions <- c(suggestions, paste("Sub-options selected:", sub_options))
      }
    }
    
    if (input$appliancesBtn > 0) {
      appliances_options <- paste(input$appliancesOptions, collapse = ", ")
      suggestions <- c(suggestions, paste("Home Appliances options selected:", appliances_options))
      if (length(input$appliancesSubOptions) > 0) {
        sub_options <- paste(input$appliancesSubOptions, collapse = ", ")
        suggestions <- c(suggestions, paste("Sub-options selected:", sub_options))
      }
    }
    
    if (input$heatingCoolingBtn > 0) {
      heating_cooling_options <- paste(input$heatingCoolingOptions, collapse = ", ")
      suggestions <- c(suggestions, paste("Heating and Cooling options selected:", heating_cooling_options))
    }
    
    suggestions
  })
}

shinyApp(ui, server)
