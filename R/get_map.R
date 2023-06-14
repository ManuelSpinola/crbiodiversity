#' Get a gridded map of a species
#'
#' @name get_map
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


get_map <- function(species_name) {
  gbif_data <- occ(query = species_name, from = c("gbif", "inat", "ebird"), geometry = st_bbox(cr_outline), has_coord = TRUE)
  df <- occ2df(gbif_data)
  df_sf_t <- st_as_sf(df, coords = c("longitude", "latitude"), crs = 4326) |>
    st_intersection(cr_outline) |>
    st_transform(5367)
  p <- st_filter(cr_grid_8km, df_sf_t) |> mutate(pa = "Detectada")
  a <- st_filter(cr_grid_8km, st_union(df_sf_t), .predicate = st_disjoint) |> mutate(pa = "No detectada")
  rbind_grid <- rbind(p, a)
  mapa <- ggplot() +
    geom_sf(data = rbind_grid, aes(fill = pa)) +
    scale_fill_viridis_d(name = "Condición") +
    theme_minimal()
  return(mapa)
}
