pageWithSidebar(
  headerPanel('K-means clustering visualization for some common R Datasets'),
   
  
  sidebarPanel(
    selectInput ('Dataset', 'Choose Dataset', c("Beaver1", "Beaver2", "Swiss", "Anscombe", "MT Cars")),
    numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
    
  ),
    
  mainPanel(
    plotOutput('plot1')
  )
)
