
library(raster)

ext <- extent(-155, -52.5, 25, 70)

wind <- crop(rotate(stack("data/wind.tif")), ext)
writeRaster(wind, "data/wind.tif", overwrite = T)


f <- list.files("~/climate_data/CHELSA/v2/raw/", full.names=T,
           pattern = "_bio1_|_bio5_|_bio6_|_bio12_")
clim <- stack(f)
names(clim) <- paste0("bio", c(1, 12, 5, 6))
clim <- crop(clim, ext)
clim[[2]] <- clim[[2]] * .1 # ppt to mm
for(i in c(1, 3, 4)) clim[[i]] <- clim[[i]] * .1 - 273.15 # temp to degC

# ocean  mask -- to limit file size
m <- crop(raster("~/climate_data/CHELSA/v2/raw/CHELSA_cmi_01_1980_V.2.1.tif"), clim)
clim <- mask(clim, m)

# export
for(i in 1:4){
      writeRaster(clim[[i]],
                  paste0("inst/extdata/", basename(f[i])),
                  overwrite = T)
}
