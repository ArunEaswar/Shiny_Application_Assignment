#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # reactive code based on input
    # If the gear is "All" - perform the plot on all gears
    # If specific gears selected then plot only on filtered dataset
    reactive_data = reactive({
        if(input$gear!='All') {
            selected_cyl = as.numeric(input$cylinder)
            selected_gear = as.numeric(input$gear)
            return(mtcars[mtcars$cyl==selected_cyl & 
                              mtcars$gear==selected_gear,])
        }
        else {
            selected_cyl = as.numeric(input$cylinder)
            return(mtcars[mtcars$cyl==selected_cyl,])
        }
    })
    
    #Plot the data based on reactive dataset and convert miles to kms
    output$data <- renderPlot({

        color <- c("blue", "red")
        
        my_data <- reactive_data()
        
        plot(my_data$hp, my_data$mpg*1.60,
                main="Plot showing Kilometers per Gallon for selected Cylinder and Gear",
                type="p",
                ylab="Kms/Gallon",
                pch=19,
                xlim=c(50,350),
                ylim=c(15,60),
                xlab="HP",
                col = color)

})
})


