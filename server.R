##This code gets run once
library(shiny)
##library(ggplot2)
##library(devtools)

dataSet <- read.csv("NPS_Data.csv")

scoreNPS <- function(respondents,detractors,passives,promoters){
    
    if ((respondents - detractors - passives - promoters != 0)|(respondents<1|detractors<1|promoters<1))  {
        
       ## Do nothing  
        
    }
    
    else {
        
        ((promoters/respondents)-(detractors/respondents))*100
    }
    
}

##This gets run every time 
shinyServer(
    function(input, output) {
        ##output$oid1 <- "Yes"
        ##output$oid2 <- "No"
        ##output$Error
        
        
        output$NPS <- renderText({
            
            validate(
                need((input$respondents - input$detractors - input$passives - input$promoters == 0)&&(input$respondents>0), "The sum of detractors, passives and promoters must be equal to the number of respondents. Please provide a valid input." )
            )
            
            scoreNPS(input$respondents,input$detractors,input$passives,input$promoters)
            })
                    
            output$newBarChart <- renderPlot({
                validate(
                    need((input$respondents - input$detractors - input$passives - input$promoters == 0)&&(input$respondents>0), "" )
                )    
            
            BarChartData <- c(input$detractors*100/input$respondents,input$passives*100/input$respondents,input$promoters*100/input$respondents)
                
            barplot(BarChartData,main="Distribution of Customer Types",col="lightblue",names.arg=c("Detractors","Passives","Promoters"))
            
            })
            
        ##}
        
        output$oid1 <- renderPrint({input$id1})
        output$oid2 <- renderPrint({input$id2})
        
        output$newBarChart2 <- renderPlot({
            
            
            
            
        })
        
        
        }
    
)