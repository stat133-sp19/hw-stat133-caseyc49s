#
# Savings Simulation
# 
# title: workout02-casey-chadwell
# author: Casey Chadwell
# version: 1.2
# date: "April 16, 2019"
# source: https://caseyc49.shinyapps.io/workout02-casey-chadwell/
#
##################################################################################


library(shiny)
library(ggplot2)
library(dplyr)
library(reshape2)

# Functions

#' @title Future Value
#' @description Calculates the future value of an investment
#' @param amount initial amount invested (numeric)
#' @param rate annual rate of return, should be a numeric between 0 and 1
#' @param years number of years maturing (numeric)
#' @return Computed future balance 
future_value = function(amount, rate, years) {
  if( !is.numeric(amount) | !is.numeric(rate) | !is.numeric(years) ) {
    stop("All inputs must be numeric")
  }
  return(amount * ( 1 + rate ) ^ years)
}

#' @title Future Value of Annuity
#' @description Calculates the future value of an investment
#' @param contrib contribution in dollars/year (numeric)
#' @param rate annual rate of return, should be a numeric between 0 and 1
#' @param years time in years (numeric)
#' @return Computed future balance
annuity = function(contrib, rate, years) {
  if( !is.numeric(contrib) | !is.numeric(rate) | !is.numeric(years) ) {
    stop(paste("All inputs must be numeric", as.character(contrib), as.character(rate)))
  }
  return( contrib * ( ( 1 + rate )^years - 1) / rate )
}

#' @title Future Value of Growing Annuity
#' @description Calculates the future value of growing annuity
#' @param contrib contribution in dollars/year (numeric)
#' @param rate annual rate of return, should be between 0 and 1 (numeric)
#' @param growth annual growth rate between 0 and 1 (numeric)
#' @param years time in years (numeric)
#' @return Computed future balance
growing_annuity = function(contrib, rate, growth, years) {
  if( !is.numeric(contrib) | !is.numeric(rate) | !is.numeric(growth) | !is.numeric(years) ) {
    stop(paste("All inputs must be numeric", as.character(contrib), as.character(rate)))
  }
  return( contrib * ( ( 1 + rate )^years - ( 1 + growth )^years ) / ( rate - growth ) )
}


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel(strong("Savings Simulations")),
   fluidRow(
     column(4,
            sliderInput(
              inputId = 'initial_amount',
              label = 'Initial Amount',
              value = 1000,
              min = 1,
              max = 100000,
              step = 500,
              pre = '$'
            ),
            sliderInput(
              'contribution',
              'Annual Contribution',
              value = 2000,
              min = 0,
              max = 50000,
              step = 500,
              pre = '$'
            )
            ),
     column(4,
            sliderInput(
              'return_rate',
              'Return Rate (in %)',
              value = 5,
              min = 0,
              max = 20,
              step = 0.1
            ),
            sliderInput(
              'growth_rate',
              'Growth Rate (in %)',
              value = 2,
              min = 0,
              max = 20,
              step = 0.1
            )
            ),
     column(4,
            sliderInput(
              'years',
              'Years',
              value = 20,
              min = 0,
              max = 50,
              step = 1
            ),
            selectInput(
              'facet_bool',
              'Facet?',
              choices = list(
                'No' = FALSE,
                'Yes' = TRUE
              ),
              selected = 'No'
            ),
            br(),
            br()
            )
   ),
   hr(),
   h4(strong("Timelines")),
   plotOutput("distPlot"),
   
   h4(strong("Balances")),
   verbatimTextOutput('balance', placeholder = TRUE)
)
   


# Define server logic required to draw a histogram
server <- function(input, output) {
  modalities <- reactive({
    years <-  input$years
    amt <- input$initial_amount
    rt <- input$return_rate / 100
    ctb <- input$contribution
    gr <- input$growth_rate / 100
   
    no_contrib <- rep(0, years)
    fixed_contrib <- rep(0, years)
    growing_contrib <- rep(0, years)
    years <- 0:years
    
    for ( idx in years ) {
      no_contrib[idx+1] <- future_value(amount = amt, rate = rt, years = idx)
      fixed_contrib[idx+1] <- no_contrib[idx + 1] + annuity(contrib = ctb, rate = rt, years = idx)
      growing_contrib[idx + 1] <- no_contrib[idx + 1] + growing_annuity(contrib = ctb, rate = rt, growth = gr, years = idx)
    }
    
    modalities <- data.frame(cbind(years, no_contrib, fixed_contrib, growing_contrib))
    return(modalities)
  })
   output$distPlot <- renderPlot({
     
     balances <- modalities()
     colnames(balances) <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")
     
     melted_modes <- melt(balances, id.vars="year")
     
     x_lines <- seq(
       0,
       max(input$years),
       input$years%/%4
     )
     
     y_lines <- seq(
       input$initial_amount, 
       max(balances['growing_contrib']), 
       (max(balances['growing_contrib'])-input$initial_amount)%/%3
       )
     
     the_plot <- ggplot(melted_modes, aes(x = year, y = value, col = variable)) + 
       geom_point() + 
       geom_line() +
       scale_x_continuous(
         name = 'Time Since Initial Investment (yrs)', 
         breaks = x_lines) +
       scale_y_continuous(
         name = 'Account Balance (in thousands)', 
         breaks = y_lines, 
         labels = y_lines%/%1000) +
       ggtitle( "Growth Rates by Investment Mode" ) +
       theme_grey() 
     if (input$facet_bool) {
       the_plot <- the_plot + 
         facet_grid(. ~ variable) + 
         geom_ribbon(alpha = 0.2, 
                     aes(ymin = 0, 
                         ymax = value, 
                         fill = variable, 
                         col = variable)) + 
         theme_bw()
     }
     the_plot <- the_plot
     the_plot
     }) 
   output$balance <- renderPrint({modalities()})
   
   
}
# Run the application 
shinyApp(ui = ui, server = server)

