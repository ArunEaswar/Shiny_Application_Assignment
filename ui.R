#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Mileage of Cars by Cylinder with HP"),

    # Radiobutton options to select the cyliner
    radioButtons("cylinder", "Select the Cylinder",
                 choices = c("4", "6","8"),
                 selected = "4"),
    
    # Dropdown box options to select the gears
    selectInput("gear", "Select the Gears:",
                choices = c("All","3", "4","5"),
                selected = "All"),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("data",height = 250)
        )
    ))

