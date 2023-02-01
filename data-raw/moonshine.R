
moonshine <- raster::raster(system.file("extdata", "moonshine_dem.tif",
                                package = "topoclimate.pred")) + 0
usethis::use_data(moonshine, overwrite = TRUE)
