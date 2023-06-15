#'
#' @name get_locations
#'
#' @title Download species occurrence data for Costa Rica
#'
#' @description
#' Search and retrieve species occurrences in Costa Rica from gbif (\href{https://www.gbif.org}{GBIF}) and iNaturalist (\href{https://www.inaturalist.org/}{iNaturalist}).
#'
#' This function is a wrapper of the occ function from the \href{https://cran.r-project.org/web/packages/spocc/index.html}{spocc} package.
#'
#' @usage get_locations(species_name, sf = FALSE)
#'
#' @param species_name Genus and species (for example, "Desmodus rotundus")
#'
#' @param sf Logical. Return a spatial (sf) or a data frame
#'
#' @return A data frame if sf = FALSE (default), or an sf object if sf = TRUE.
#'
#' @examples
#'
#' loc <- get_locations("Agalychnis callidryas")
#' head(loc)
#'
#' @export

library(spocc)
library(sf)
library(ggplot2)
library(dplyr)
library(crgeo)
library(crgrids)


get_distribution <- function(species_name, sf = TRUE) {
  occurrences <- occ(query = species_name, from = c("gbif", "inat"), geometry = st_bbox(cr_outline), has_coord = TRUE)
  occurrences <- occ2df(occurrences)

  ## Convert to sf
  if (isTRUE(sf)) {
    occurrences <- st_as_sf(occurrences, coords = c("longitude", "latitude"), crs = 4326) |> st_intersection(cr_outline)}

  return(occurrences)
}
