#' Get distribution of a species
#'
#' @name get_distribution
#'
#'
#'
#'
#'
#' @export

library(spocc)
library(sf)
library(crgeo)
library(crgrids)

get_distribution <- function(species_name) {
  gbif_data <- occ(query = species_name, from = c("gbif", "inat", "ebird"), geometry = st_bbox(cr_outline), has_coord = TRUE)
  df <- occ2df(gbif_data)
  df_sf <- st_as_sf(df, coords = c("longitude", "latitude"), crs = 4326) |> st_intersection(cr_outline)
  return(df_sf)
}
