plot6 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   SCC=readRDS ('Source_Classification_Code.rds'),
                   outFile='plot6.png',
                   FIPS1='24510',
                   FIPS2='06037',
                   substr='motor') {
  png (filename=outFile, width=480, height=480)
  
  # Select and clean relevant data
  data <- merge (NEI[NEI$fips == FIPS1 | NEI$fips == FIPS2, ],
                 SCC[grepl (substr, 
                            SCC$Short.Name, 
                            ignore.case=TRUE), ],
                 by='SCC')
  data$Emissions[data$Emissions == 0] = NA
  
  # Set up the basic plotting framework
  gp <- ggplot (data,
                aes (factor (year), log10 (Emissions)))
  
  print (gp +
           geom_boxplot () +
           facet_grid (. ~ fips))
  
  dev.off ()
}
