plot2 <- function (NEI=plotreadRDS ('summarySCC_PM25.rds'),
                   outFile='plot2.png',
                   FIPS='24510') {
  # Select a subset of the data conditioned by FIPS
  plot1 (NEI[NEI$fips == FIPS, ], outFile=outFile)
}
