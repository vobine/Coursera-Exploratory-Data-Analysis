plot1 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   outFile='plot1.png') {
  png (filename=outFile, width=480, height=480)
  
  # Clean zero-valued points from emissions (can't show them in a log plot)
  emissions <- NEI$Emissions
  emissions[emissions == 0] <- NA

  # Show the distribution of emissions in each year
  yearOf <- factor (NEI$year)
  boxplot (log10 (emissions) ~ yearOf, 
           ylab='Total PM2.5 (log)')
  
  dev.off ()
}
