# Script to concatenate BGC units with climate stations in BC
# Then select for a subset of BGC units that you are interested in.

load(here::here("data","BC_clim_stn_metadata.RData"))

library(sf)
library(bcmaps)
library(tidyverse)
library(ggplot2)

# Convert BC climate station metadata to geospatial data
stn<-st_as_sf(BC_clim_stn_metadata,coords=c("lon","lat"))

# Set Coordinate Reference System to WGS1984
stn <- st_set_crs(stn, 4326)

# Transform to BC albers
stn<-transform_bc_albers(stn)

# import BGC units
bgc<-bec()

# Join with climate station data
stn<-st_join(stn,bgc[,"MAP_LABEL"])

# Analyze climate data coverage for each BGC unit
# stn %>%
#   st_drop_geometry() %>%
#   group_by(MAP_LABEL) %>%
#   summarise(Num.Stn=n()) %>%
#   write.csv(file="Climate stations by BGC unit.csv")

# Shortlist stn list for BGC units of interest
bgcList<-c("BWBSdk","SBSmk1","SBSmk2","SBSwk2","ESSFmv2","ESSFmvp")
stnList<-stn[which(stn$MAP_LABEL%in%bgcList==TRUE),]

# Shortlist only for EnvCan, BC Hydro, or Env-ASP stations
stnList %>%
  dplyr::filter(network_name=="EC" | network_name=="EC_raw" | network_name=="BCH") %>%
  write.csv(file="Mackenzie_drought_Climate stations by BGC unit.csv")


