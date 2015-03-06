# OP-Source User Interfance

library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
	
	# Application title
	headerPanel(""),  
	#span("Outcomes", style = "color:grey")
	# Sidebar with controls to select a dataset and specify the number
	# of observations to view
	sidebarPanel(
		
		selectInput("DataSet", "Choose a Data Set:", 
								choices = c("Behavioral Risk Factor Surveillance Survey (BRFSS)")),
		#"Junta de Licenciamietno y Disciplina Médica",
		#"Mortalidad-Registro Demográfico")),
		
		selectInput("Disease", "Choose a Disease:", 
								choices = c("Asthma", "Coronary Heart Disease", "Heart Attack",
														"Diabetes", "Tobacco Use", "Stroke")),
		
		selectInput("Year", "Choose a Year:", 
								choices = c("2013", "2012", "2011", "2010", "2009", "2008" )),
		
		selectInput("Category", "Choose a Category:", 
								choices = c("Overall", "Demographics", "Quality of Life")),
		
		br(),
		h4(span("Developed by", style = "color:grey")),
		img(src = "Outcome_Project_Logo.png", height = 72, width = 200),
		width = 4,
		br(),
		br(),
		h6(span("Powered by RStudio™ Shiny", style = "color:grey"))
	),
	
	
	# Show a summary of the dataset and an HTML table with the requested
	# number of observations
	mainPanel(
		tabsetPanel(type = "tabs", 
								tabPanel("Interactive Platform", tableOutput("view")) 
								#tabPanel("Message",
								#				 fluidRow(column(width = 12,
								#				 								includeHTML("/media/truecrypt2/Shiny/BRFSS_ShinyApp/www/Outcomes.html")
								#)))
								)
	)
	
))
