plot4 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   SCC=readRDS ('Source_Classification_Code.rds'),
                   outFile='plot4.png',
                   substr='coal') {
  png (filename=outFile, width=480, height=480)
  
  # Select and clean relevant data
  data <- merge (NEI, SCC, by='SCC')
  data <- data[grepl (substr, data$Short.Name, ignore.case=TRUE), ]
  data$Emissions[data$Emissions == 0] = NA
  
  # Set up the basic plotting framework
  gp <- ggplot (data,
                aes (factor (year), log10 (Emissions)))
  
  print (gp +
           geom_boxplot ())
  
  dev.off ()
}
