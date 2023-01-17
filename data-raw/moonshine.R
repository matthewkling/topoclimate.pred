
moonshine <- raster::raster(system.file("extdata", "moonshine_dem.tif",
                                package = "topoclimate.pred"))
usethis::use_data(moonshine, overwrite = TRUE)
