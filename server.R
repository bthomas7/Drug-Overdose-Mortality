#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 # output$text1 <- renderText({"Drug Overdose Mortality by State"})
  output$text2 <- renderText({paste("Rate Change from",substr(input$select,5,8),"to 2016")})
  
  output$dotplot <- renderPlot({
    ggplot() +
    geom_point(data=overdose_data, aes(x=`Year2016`, y=reorder(State,`Year2016`)), color="tomato",alpha=0 ) +
    geom_segment(data=overdose_data, aes_string(x=input$select, xend="Year2016", y="State", yend="State"), color="gray60",size=1) +
    geom_segment(data=overdose_data %>% subset(State%in%c(input$state)), aes_string(x=input$select, xend="Year2016", y="State", yend="State"), color="deepskyblue3",size=1.5) +
    geom_point(data=overdose_data, aes(x=`Year2016`, y=reorder(State,`Year2016`)), color="tomato", size=4.5,alpha=0.7 ) +
    geom_point(data=overdose_data, aes_string(x=input$select, y="State"), color="mediumseagreen", size=4.5,alpha=0.7 ) +
    geom_point(data=overdose_data %>% subset(State%in%c(input$state)), aes(x=`Year2016`, y=reorder(State,`Year2016`)), color="deepskyblue3", size=4.5,alpha=0.7 ) +
    theme_light() +
  #  scale_y_discrete(labels=c(toString(input$state)=expression(bold(toString(input$state))), parse=TRUE)) +
    ylab("State") +
    xlab("Death Rate (per 100,000 population)") +
    theme(axis.text=element_text(size=12), axis.title=element_text(size=16))
    
  }, height =625)
  
  
})

