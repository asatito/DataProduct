#server.R
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
fit_chd = glm(chd ~ age+typea+famhist+alcohol+obesity+tobacco+ldl,
            data=trainSA, family=binomial() )

shinyServer(function(input, output) {

        
        
        dataInput = reactive ({
                if (input$typea) {
                        ta = 75
                } else {
                        ta = 40
                }
                if (input$famhist) {
                        fh ="Present"
                } else {
                        fh = "Absent"
                }
                user_data=list(
                                        age=c(input$age), 
                                        typea=c(ta), 
                                        famhist=c(fh), 
                                        alcohol=c(input$alcohol),
                                        obesity=c(input$obesity), 
                                        tobacco=c(input$tobacco), 
                                        ldl = c(input$ldl)
                                        )

                user_predict = predict(fit_chd,user_data, type="response")
                paste(round(user_predict*100,2) , "%")
                })

        output$chd <- renderText({ 
                paste("You have a", dataInput(), 
                      "chance of having a coronary heart disease.")
        })
        
})