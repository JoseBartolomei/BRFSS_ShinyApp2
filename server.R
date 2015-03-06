# BRFSS_OP-Source Server

library(shiny)

# Load_Table_Objects ----------------------------------------------------------------
RData_files <-list.files(path = "./htmlShinyTables",
												 pattern = '.RData', full.names = TRUE)

for(i in 1:length(RData_files)){
	load(RData_files[[i]])
}

# Remove Unneceary Objects ----------------------------------------------------------

rm("DependentVar" ,"Dvar", "DvarC", "Dyear", "DyearVar", "FilePut", "i", "set_DiseaseF",
	 "set_Years", "RData_files")


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
	require(xtable)
	# Return the requested table
	
	datasetInput <- reactive({
		D <- "NA"
		if(input$Disease == "Asthma"){
			D <- "Asthma.Current"
		} else if (input$Disease == "Coronary Heart Disease"){
			D <- "Coronary_Heart_Disease.Prevalence"
		} else if (input$Disease == "Heart Attack"){
			D <- "Heart_Attack.Prevalence"
		} else if (input$Disease == "Diabetes") {
			D <- "Diabetes.Prevalence"
		} else if (input$Disease == "Tobacco Use"){
			D <- "Smoke.Prevalence"
		} else if (input$Disease == "Stroke"){
			D <- "Stroke.Prevalence"
		}
		
		Cat <- "NA"
		if(input$Category == "Overall"){
			Cat <- "Overall"
		} else if(input$Category == "Demographics"){
			Cat <- "SocioD"
		} else if(input$Category == "Quality of Life"){
			Cat <- "Hrqol"
		}
		FilePut <- get(paste(D, input$Year, Cat, sep = "."))
	})
	
	# Show the tables 
	
	output$view <- renderPrint({
		FilePut <- datasetInput()
		cat(FilePut)
		
	})
})


