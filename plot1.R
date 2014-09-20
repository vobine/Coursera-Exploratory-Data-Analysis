plot1 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   outFile='plot1.png') {
  png (filename=outFile, width=480, height=480)
  
  # Show two plots...
  par (mfrow=c (2, 1),
       oma=c (0, 0, 0, 0),
       mar=c(2, 2, 0, 0))

  # Treat the year as a factor for our purposes
  yearOf <- factor (NEI$year)

  ## First plot: distribution of pollutants per year, log scale

  # Clean zero-valued points from emissions (can't show them in a log plot)
  emissions <- NEI$Emissions
  emissions[emissions == 0] <- NA

  # Show the distribution of emissions in each year
  boxplot (log10 (emissions) ~ yearOf, 
           ylab='Total PM2.5 (log)')

  ## Second plot: yearly average values, linear scale

  # Use zero values in computing mean, as there are no log issues.
  plot (tapply (NEI$Emissions, yearOf, mean) ~ levels (yearOf),
        ylab='Mean PM2.5 (linear)',
        type='b')

  dev.off ()
}
