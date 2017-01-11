#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

ui <- fluidPage(
    theme = "bootstrap.css",
    # Application title
    titlePanel(h1("Titanic - Dead or Alive",align  = "center")),
    headerPanel(h2("Buy Ticket here")),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            helpText(("Your information")),
            
            radioButtons("Title",
                         label = "title",
                        choices = list("Mr","Miss","Other"),
                        selected = "Mr"),
            
            textInput("Name",
                      label = "Your name",
                      value = "Enter name"),
            
            selectInput("Sex",
                        label = "Select your sex",
                        choices = list("male","female"),
                        selected = "male"),
            
            radioButtons("Pclass",
                        label = "Selecet you Passenger class",
                        choices = list("choice 1"=1,"choice 2"=2,
                                       "choice 3"=3,"choice 4"=4)),
            
            numericInput("Age", 
                         label = ("Selet you Age"), 
                         value = 20),
            
            
            radioButtons("Embark",
                         label = "Select the port of embarkation",
                         choices = list("Cherbourg","Queenstown","Southampton"),
                         selected = "Queenstown" ),
            
            actionButton("Confirm",
                            "Confrim ticket")
                         
            
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            div(id = "panel",textOutput("text2"),
            h4(textOutput("pred"))),
            
            img(img(src="img/pic.png"))
            )
        
        
    )
    
)


