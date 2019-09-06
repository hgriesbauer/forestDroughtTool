# Script to concatenate BGC units with climate stations in BC

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

