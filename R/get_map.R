#'
#' @name get_map
#'
#' @title Download species occurrence data for Costa Rica and get a gridded map
#'
#' @description
#' Search, retrieve and obtain a gridded map species occurrences in Costa Rica from gbif (\href{https://www.gbif.org}{GBIF}) and iNaturalist (\href{https://www.inaturalist.org/}{iNaturalist}).
#'
#' This function is a wrapper of the occ function from the \href{https://cran.r-project.org/web/packages/spocc/index.html}{spocc} package.
#'
#' #' @usage get_map(species_name)
#'
#' @param species_name Genus and species (for example, "Desmodus rotundus")
#'
#' @return A ggplot2 plot.
#'
#'@examples
#'
#' get_map("Agalychnis callidryas")
#'
#' @export

library(spocc)
library(sf)
library(ggplot2)
library(dplyr)
library(crgeo)
library(crgrids)


get_map <- function(species_name) {
  occurrences <- occ(query = species_name, from = c("gbif", "inat"), geometry = st_bbox(cr_outline), has_coord = TRUE)
  occurrences <- occ2df(occurrences)
  occurrences_t <- st_as_sf(occurrences, coords = c("longitude", "latitude"), crs = 4326) |>
    st_intersection(cr_outline) |>
    st_transform(5367)
  p <- st_filter(cr_grid_8km, occurrences_t) |> mutate(pa = "Detectada")
  a <- st_filter(cr_grid_8km, st_union(occurrences_t), .predicate = st_disjoint) |> mutate(pa = "No detectada")
  grid_pa <- rbind(p, a)
  mapa <- ggplot() +
    geom_sf(data = grid_pa, aes(fill = pa)) +
    scale_fill_viridis_d(name = "Condición") +
    theme_minimal()
  return(mapa)
}
