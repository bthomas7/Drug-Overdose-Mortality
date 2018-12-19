
# Define UI
shinyUI(
  dashboardPage(title = "Drug Overdose Mortality by State",
    dashboardHeader(title = "Drug Overdose Mortality by State",titleWidth = 350),
    dashboardSidebar(width = 350,tags$blockquote("Explore changes in the rate of drug poisoning deaths (per 100,000 population) at the state level between the selected year to 2016.")),
    dashboardBody(
      fluidRow(
        box(width = 6, height = 90,title='Select Year to Compare:',status = 'warning', solidHeader = TRUE, collapsible = TRUE,
          selectInput("select",label=NULL, choices=year, selected = "Year2013")),
        box(width = 6, height = 90,title="Select States to Highlight:",status = 'warning', solidHeader = TRUE, collapsible = TRUE,
          selectInput("state", NULL, states,multiple=TRUE,selectize=TRUE, selected = "--Click to Select--"))
        ),
      fluidRow(
        box(width =12, height =700, status = 'primary', solidHeader = TRUE,
            title=textOutput('text2'),
            plotOutput('dotplot', width = "100%"))
        ),
      fluidRow(
        box(width = 12
          ,tags$blockquote("Please note: Drug-poisoning deaths were classified using the ICD-10 underlying cause-of-death codes: X40-X44 (unintentional), X60-X64 (suicide), X85 (homicide), or Y10-Y14 (undetermined intent). Thus, death rates for some states and years may be low due to a high number of unresolved pending cases or misclassification of ICD-10 codes."))
      )
      )    
    )
    )

