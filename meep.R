#install.packages("dcm")
#install.packages("EpiModel", dependencies = TRUE)

require(EpiModel)
#require(dcm)
library(tidyverse)
library("rsconnect")
#################################################################################
#### Deterministic compartmental models
#################################################################################

######## Basic SI model 




#################################################################################
#### Individual contact models (and comparison to DCM)
#################################################################################


# Deterministic

server <- function(input, output) {
        dcm <- read.csv("data/dcm.csv")
        output$det <- renderPlotly({
                
                selected_data <- dcm %>% 
                        filter(type == input$dcm_choice)
                
                param.dcm <- param.dcm(inf.prob = c(selected_data$inf), act.rate = selected_data$act, rec.rate = 0.07)
                init.dcm <- init.dcm(s.num = 500, i.num = 1,r.num = 0)
                control.dcm <- control.dcm(type = "SIR", nsims = 10, nsteps = 300)
                mod.dcm <- dcm(param.dcm, init.dcm, control.dcm)
                
                return(plot(mod.dcm))
                
        })
        
        output$stc <- renderPlotly({
                selected_data <- dcm %>% 
                        filter(type == input$stc_choice)
                
                #Stochastic 
                param.icm <- param.icm(inf.prob = c(selected_data$inf), act.rate = selected_data$act, rec.rate = 0.07)
                init.icm <- init.icm(s.num = 500, i.num = 1,r.num = 0)
                control.icm <- control.icm(type = "SIR", nsims = 100, nsteps = 300)
                mod.icm <- icm(param.icm, init.icm, control.icm)
                stc_model<- plot(mod.icm)
                return(stc_model)
                
        })
        
        
        }






