# ui.R

shinyUI(fluidPage(
        titlePanel("Predict your Probability for a Coronary Heart Disease"),
        
        span("Please specify the below parameters and the app will predict the
             likelyhood of your having a Coronary Heard Disease. Do not take this
             too seriously :), it is just an app to demonstrate shiny usage", 
             style = "color:blue"),
        
        fluidRow(
                
                column(3, 
                       numericInput("age", label = h3("Specify your Age"), 
                                    value = "30")),
                
                column(3,
                       h3("Do you have a family history of heart disease"),
                       checkboxInput("famhist", label = "Family History", value = FALSE)),
                
                column(3,
                       h3("Do you have type A personality"),
                       checkboxInput("typea", label = "Type A", value = FALSE),
                       helpText("Note: Type A behavior: competitive, ambitious, impatient, aggressive, fast talking.")
                       ),
                
                
                column(3, 
                       sliderInput("obesity", label=h3("Please specify your BMI"),
                                   min = 14, max = 50, value = 26)
                )
        )  ,
        
        fluidRow(
                
                column(3, 
                       sliderInput("tobacco", label = h3("Your Tobacco consumption"),
                                   min = 0, max = 35, value = 3.6)),
                
                column(3, 
                       sliderInput("ldl", label = h3("Your LDL Level"),
                                   min = 0.8, max = 16, value = 2)),
                
                column(3, 
                       sliderInput("alcohol", label=h3("Your daily alcohol consumption"),
                                   min = 0, max = 150, value = 17)
                )
        )   ,
        
        span( textOutput("chd"), 
             style = "font-family: 'times'; font-size:20pt;
             color:red")
        

))