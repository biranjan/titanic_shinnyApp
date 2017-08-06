#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(highcharter)

mydata <- read.csv("Data/Titanic_data.csv")
log_mod <- glm(Survived~Pclass+Sex+Age+Embarked+Title,
               data=mydata,family = "binomial")

# Define server logic here
shinyServer(function(input, output) {
    
    
  observeEvent(input$Confirm, {
   
   Pclass <- as.numeric(input$Pclass)
   Age <- input$Age
   Sex <- input$Sex
   Title <- input$Title
   Embarked <- input$Embark
   newdat1 <- data.frame(Pclass,Sex,Age,Embarked,Title)
   pred1 <- predict(log_mod,newdata = newdat1,type = "response")
   pie_frame <- data.frame(pie = c(round(pred1,2),round(1-pred1,2)))
   
   output$dem_pie <- renderHighchart({
     
       hchart(type="pie",pie_frame, hcaes(y=pie,x=c("Alive","Dead")),name="Total",colors=list("lightgreen","tomato")) 
       
   })
   
   output$pred <-  renderText({
        if(pred1 > 0.5) {
        paste("Hello ",input$Name, "! Yout might just survive the journey")
        } else {
          paste("Hello ",input$Name,"! You might not survive the jounrney")
        }
          })
      
    })
    
    
})



