library(shiny)

shinyUI(fluidPage(
                
                            sidebarPanel(
                            
								h3('Enter the results from your survey:'),
                                br(),
								numericInput('respondents','Number of respondents',0,min=1,max=100000,step=1),
								numericInput('detractors','Number of detractors',0,min=0,max=100000,step=1),
								numericInput('passives','Number of passives',0,min=0,max=100000,step=1),
								numericInput('promoters','Number of promoters',0,min=0,max=100000,step=1),
                                br(),        
								submitButton('Submit')
                    
                            ),
            
                            mainPanel(
                                br(),
								h3("Net Promoter Score Calculator"),
                                
								p('In market research the Net Promoter Score (NPS) is a popular measure of customer satisfaction.'),
                                p('Respondents are asked \'How likely is it that you would recommend this company to a friend or colleague?\' and answer on a scale of 0 to 10. They are then classified into one of three groups. Those answering 0-6 are classified as detractors, those answering 7-8 as passives and those answering 9-10 as promoters.'),
                                p('The NPS score is calculated by subracting the percentage of detractors from the percentage of promoters. This app takes as an input the number of detractors, passives and promoters from a survey and calculates the NPS score. It also displays the distribution of those answering the question across the three customer types.'),
                                br(),
                               	h3('Instructions'),
                            
								p('Enter 4 values into the boxes on the left hand side and click on submit. The number of detractors, passives and promoters must sum to the total number of respondents.'),
								p('For example, 20 detractors + 20 passives + 60 promoters = 100 respondents'),
                                br(),
								h3('The NPS for your survey is:'),
                                
                                h3(textOutput("NPS")),
                    
								plotOutput('newBarChart')
                    
                            )
                    
))