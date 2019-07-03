# ASMR calculation
# Using daily climate data

asmrCalc=function(climateData,latitude=55,soilsData) {

  # TACA uses the following constants:
  albedo=0.15
  T.kelvin=273.15
  Emissivity=0.96
  SBconstant=0.0000000567

  # Monthly daylength lookup table for three latitudes
  daylength.table=data.frame(N50=c(8.3,9.8,11.6,13.5,15.2,16.1,15.7,14.3,12.4,10.5,8.8,7.9),
                             N55=c(7.5,9.4,11.5,13.8,15.9,17.1,16.6,14.7,12.4,10.2,8.1,6.9),
                             N60=c(6.4,8.8,11.4,14.2,16.8,18.4,17.7,15.4,12.5,9.7,7.1,5.6))

  # Daylength calculation
  daylength=daylength.table[,grep(paste("N",latitude,sep=""),names(daylength.table))]



}
