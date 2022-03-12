library(shiny)
library(shinythemes)
library("rsconnect")
require(EpiModel)
#require(dcm)
library(tidyverse)
library(plotly)
source("meep.R")

# Page One
page_one <- tabPanel(
  "Introduction",
  mainPanel(   
    h1("Deterministic v Schoastic Models of Covid"),
    p("Kavya Iyer, A3"),
    h4("Analysis"), 
    p("After doing research, I saw how effective at reducing the transmission rate options such as indoor masking and social distancing were. It was interesting to see that as these filters are applied to both models, the amount
      of time for the pandemic to level out was really reduced."),
    h5("Sources Used"),
    p("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7976050/#:~:text=The%20maximum%20probability%20of%2063.2,in%20order%20to%20avoid%20infection."),
    p("https://www.science.org/doi/10.1126/science.abg6296")
  ))
# Widgets 

# Page 2
page_two <- tabPanel(
  "Deterministic Model",
  h1("COVID 19 Deterministic Model"),
  sidebarLayout(             
    sidebarPanel(selectInput(
      inputId = "dcm_choice",
      label = "Choose Value",
      
      choices = c("None", "Mask Indoors", "Social Distancing"),
      selected = "None"
    )),           
    mainPanel(   
      plotOutput("det"),
    )))

# Page Three
page_three <- tabPanel(
  "Stochastic Model",
  h1("COVID 19 Stochastic Model"),
  sidebarLayout(             
    sidebarPanel(selectInput(
      inputId = "stc_choice",
      label = "Choose Value",
      
      choices = c("None", "Mask Indoors", "Social Distancing"),
      selected = "None"
    )),           
    mainPanel(   
      plotOutput("stc"),
    )))




# Define the UI and what pages/tabs go into it
ui <- navbarPage(theme = shinytheme("journal"),
                 "INFO 478 A3",
                 page_one,
                 page_two, 
                 page_three
)