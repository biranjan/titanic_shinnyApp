#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
mydata <- read.csv("Data/Titanic_data.csv")
log_mod <- glm(Survived~Pclass+Sex+Age+Embarked+Title,
               data=mydata,family = "binomial")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
  
    
    Name <- eventReactive(input$Confirm,{
            a <- input$Name
    })
    
    Title <- eventReactive(input$Confirm,{
        a <- input$Title
    })
    
    Pclass <-  eventReactive(input$Confirm,{
        as.numeric(input$Pclass)
    })
    
    Age <-  eventReactive(input$Confirm,{
        (input$Age)
    })
    
    Sex <-  eventReactive(input$Confirm,{
        (input$Sex)
    })
    
    Embarked <-  eventReactive(input$Confirm,{
        (switch(input$Embark,
                 "Cherbourg"= "C",
                 "Queenstown" = "Q",
                 "Southampton" = "S"
                ))
    })
    
    output$text2 <- renderText({
        
        
        paste("Helo ",Name(), "! You are travelling from ",input$Embark, "to New York")
    })
    
    output$pred <- renderText({
       
        
        #Age <- (input$Age)
        #Embarked <- (switch(input$Embark,
        #                                 "Cherbourg"= "C",
        #                                 "Queenstown" = "Q",
        #                                 "Southampton" = "S"
        #))
        #Title <- (input$Title)
        
        
        Pclass <- Pclass()[1]
        Age <- Pclass()[1]
        Sex <- Sex()[1]
        Title <- Title()[1]
        Embarked <- Embarked()[1]
        newdat1 <- data.frame(Pclass,Sex,Age,Embarked,Title)
        pred1 <- (predict(log_mod,newdata = newdat1,type = "response"))
        paste(" ANd your chances of survival is   ",round(pred1, digits = 2)
              
              )
    })
})



