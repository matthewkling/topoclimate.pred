

library(devtools)
# load_all()
check()
document()
install()






library(topoclimate.pred)

# native moonshine example #
tc <- topoclimate(moonshine)
plot(tc)

# pepperwood example #
lat = 38.575644
lon = -122.701189
dem <- microclima::get_dem(lat = lat, long = lon, resolution = 30)
pw <- topoclimate(dem)
plot(pw)

