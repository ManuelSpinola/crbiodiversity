

library(spocc)
library(sf)
library(crgeo)
library(crgrids)


get_locations <- function(species_name) {
  gbif_data <- occ(query = species_name, from = c("gbif", "inat", "ebird"), geometry = st_bbox(cr_outline), has_coord = TRUE)
  df <- occ2df(gbif_data)
  return(df)
}


