## This data set was developed for the following paper:
# Desjardins, Elise, et al. "Correlates of bicycling trip flows in Hamilton, Ontario: fastest, quietest, or balanced routes?." Transportation 49.3 (2022): 867-895. https://rdcu.be/cZaAj

# Load libraries
library(dplyr)
library(ggplot2)
library(ggthemes)
library(sf)
library(units)

# Load data 
load("Correlates-Cycling-Flows-Hamilton.RData")

# The data file includes several simple features objects for plotting. The main data object is OD_table.sf which includes variables measured at the origin, at the destination, and several cost variables as described in the paper.

# Prepare data OD table
# Scale variables
OD_table.sf <- OD_table.sf %>%
  mutate(Population.o = Population.o/1000,
         Population.d = Population.d/1000,
         Points_of_Interest.o = Points_of_Interest.o/1000,
         Points_of_Interest.d = Points_of_Interest.d/1000,
         BusStops.o = BusStops.o/100,
         BusStops.d = BusStops.d/100,
         Institutions.o = Institutions.o/1000,
         Institutions.d = Institutions.d/1000,
         Commercial.o = Commercial.o/1000,
         Commercial.d = Commercial.d/1000,
         Residential.o = Residential.o/1000,
         Residential.d = Residential.d/1000,
         Population.o = Population.o/1000,
         Population.d = Population.d/1000,
         Full_time_jobs.d = Full_time_jobs.d/1000,
         Part_time_jobs.d = Part_time_jobs.d/1000,
         Industry.o = Industry.o/1000,
         Industry.d = Industry.d/1000,
         Office.o = Office.o/1000,
         Office.d = Office.d/1000,
         quietest_distance = units::set_units(quietest_distance, "km"), # convert to km
         balanced_distance = units::set_units(balanced_distance, "km"), # convert to km
         fastest_distance = units::set_units(fastest_distance, "km")) # convert to km

# Plot study area
ggplot(wards.sf) + 
  geom_sf(data = hamilton_boundary) +
  geom_sf(data = hamilton, color = "black", fill = NA) + 
  geom_sf(data = escarpment.sf, 
          size = 1,
          color = "dark green") +
  theme_map()
