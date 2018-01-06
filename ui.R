library(shiny)
# UI for the Application
shinyUI(fluidPage(
        # header or title Panel                
        titlePanel(title = h4("mtcars Dataset",align = "center")),
        sidebarLayout(
                # Sidebar Panel
                sidebarPanel(
                        selectInput("sel","1. Select the variable from the mtcars dataset",choices = c("mpg"=1,"cyl"=2,"disp"=3,"hp"=4,"drat"=5,"wt"=6,"qsec"=7,"vs"=8,"am"=9,"gear"=10,"carb"=11),selected="mpg"),
                        br(),
                        sliderInput("bins", "2. Select the number of bins for Histogram",min = 3,max = 15,value = 10),
                        br(),
                        radioButtons("color","3. Select the color of the histogram",choices = c("Green","Red","Yellow","Blue"),selected = "Green")
                        ),
                # Main Panel
                mainPanel(
                        tabsetPanel(type="tab",
                                    tabPanel("Summary",verbatimTextOutput("summ")),
                                    tabPanel("Structure",verbatimTextOutput("str")),
                                    tabPanel("Data",tableOutput("data")),
                                    tabPanel("Plot",plotOutput("myhist"),radioButtons("save","Save as",choices = c("png","pdf"),selected = "png"),downloadButton("load","Download Plot"))
                                    
                                    )
                        
                        )
                )        
        )
)