plot3 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   outFile='plot3.png',
                   FIPS='24510') {
  png (filename=outFile, width=480, height=480)

  # Select and clean relevant data
  BAL <- NEI[NEI$fips == FIPS, ]
  BAL$Emissions[BAL$Emissions == 0] = NA
  BAL$year = factor (BAL$year)

  # Set up the basic plotting framework
  gp <- ggplot (BAL,
                aes (year, log10 (Emissions), fill=type))

  print (gp +
           geom_boxplot () +
           facet_grid (. ~ type))

  dev.off ()
}
