library(shiny)

shinyUI(fluidPage(
                  
                            
                
                            sidebarPanel(
                            
                            h3('Enter the results from your survey:'),
                    
                            numericInput('respondents','Number of respondents',0,min=1,max=100000,step=1),
                            numericInput('detractors','Number of detractors',0,min=0,max=100000,step=1),
                            numericInput('passives','Number of passives',0,min=0,max=100000,step=1),
                            numericInput('promoters','Number of promoters',0,min=0,max=100000,step=1),
                                        
                            submitButton('Submit')
                    
                            ),
            
                            mainPanel(
                            
                            h3("Net Promoter Score Calculator"),
                                
                            p('In the market research industry the Net Promoter Score (NPS) is a popular measure of customer satisfaction. Customers are asked How likely is it that you would recommend this company to a friend or colleague? Respondents answer on a scale of 0 to 10 and are classified into one of three groups. Those answering 0-6 are detractors, those answering 7-8 are passives and those answering 9-10 are promoters. The NPS score is then calculated by subracting the percentage of Detractors from the percentage of Promoters. This app takes as an input the number of detractors, passives and promoters from a survey and calculates the NPS score. It also displays the distribution of those answering the question across the three customer types.'),
                                                            
                            h4('Instructions'),
                            
                            p('Enter 4 values into the boxes on the left hand side and click on submit. The number of detractors, passives and promoters must sum to the total number of respondents.'),
                            
                            h4('The NPS for your survey is :'),textOutput("NPS"),
                    
                            plotOutput('newBarChart')
                    
                            )
                    
))