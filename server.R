
#library(shiny)
#library(rCharts)
#library(ggplot2)


options(RCHART_WIDTH = 650)

shinyServer(function(input, output) {
        
        
        output$sum <-renderPrint({
                summary(dat2)
        })
        
        output$str<-renderPrint({
                str(dat2)
        })
        # Generate a chart for the selected city
        output$plot <- renderChart2({
                selected <- input$City
                City <- subset(dat2,City == selected & Year %in% seq(input$range[1], input$range[2], 1))
                h1 <- hPlot(
                         x = "Year", 
                       y = "Share %", 
                       data = City, 
                       type = "line"


                        
                   )
              
        })
        
        # Generate an HTML table view of the data
        output$table <- renderDataTable({
                dat2[,-1]
        })
})