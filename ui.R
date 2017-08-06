
library(highcharter)
ui <- fluidPage(
    theme = "bootstrap.css",
    title = "Titanic",
    # Application title
    titlePanel(h1("Titanic - Dead or Alive",align  = "center")),
    headerPanel(h2("Buy Ticket here")),
    # Sidebar with input options
    # Here we'll be asking necessary information to feed into new model
    sidebarLayout(
        sidebarPanel(
            helpText(("Your information")),
            
            radioButtons("Title",
                         label = "title",
                        choices = list("Mr","Miss","Other"),
                        selected = "Mr"),
            
            textInput("Name",
                      label = "Your name"),
            
            selectInput("Sex",
                        label = "Select your gender",
                        choices = list("male","female"),
                        selected = "male"),
            
            radioButtons("Pclass",
                        label = "Select your Passenger class",
                        choices = list("choice 1"=1,"choice 2"=2,
                                       "choice 3"=3,"choice 4"=4)),
            
            numericInput("Age", 
                         label = ("Select your Age"),  
                         value = 20),
            
            
            radioButtons("Embark",
                         label = "Select the port of embarkation",
                         choices = list("Cherbourg"="C","Queenstown"="Q","Southampton"="S"),
                         selected = "C" ),
            
            actionButton("Confirm",
                            "Confrim ticket")
                         
            
        ),
        
        # Here we'll sho the result of prediction
        # Show a output: in this case text with the result of prediction
        
        mainPanel(
            
            div(id = "panel",textOutput("text2"),
            div(uiOutput("pred"))),
            div(id = "placeholder"),
            highchartOutput("dem_pie"),
            img(img(src="img/pic.png",width="600px"))
            )
        
     
    )
    
)