library(shiny)
data(mtcars)
shinyServer( function(input, output) 
        {
        # Reactive Function
        clm <- reactive({as.numeric(input$sel)})
        hed <- reactive({paste("Histogram of mtcars Dataset","-",names(mtcars[clm()]))})
        
        # Summary tab handler
        output$summ <- renderPrint({
                summary(mtcars)
        })
        
        # Structure tab handler
        output$str <- renderPrint({
                str(mtcars)
        })
        
        # Data tab handler
        output$data <- renderTable({
                #clm <- as.numeric(input$sel)
                mtcars[clm()]
        },bordered = TRUE,rownames = TRUE)
        
        # Plot tab handler
        output$myhist <- renderPlot({
                #clm <- as.numeric(input$sel)
                #hed <- paste("Histogram of mtcars Dataset","-",names(mtcars[clm()]))
                hist(mtcars[,clm()], breaks = seq(0,max(mtcars[,clm()]),l=input$bins+1), col = input$color, main = hed(),xlab = names(mtcars[clm()]) )
        })
        
        # Download handler
        output$load <- downloadHandler(
                # Specify File name
                filename = function(){paste(hed(),input$save,sep = ".")},
                content = function(file){
                        if(input$save == "png")
                        png(file)
                        else
                        pdf(file)
                        hist(mtcars[,clm()], breaks = seq(0,max(mtcars[,clm()]),l=input$bins+1), col = input$color, main = hed(),xlab = names(mtcars[clm()]) )
                        dev.off()
                })
        
        
        
        
        
        
        
        
        
        
        
         } 
)
