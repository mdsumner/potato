## this code would have worked in 2014, but no longer does
## https://gis.stackexchange.com/questions/90635/what-programs-would-allow-for-the-mapping-of-a-geoid-in-3d/92355#92355

baseurl <- "http://earth-info.nga.mil/GandG/wgs84/gravitymod/egm2008/GIS/world_geoid"
localroot <- "data-raw/world_geoid"
fs <- file.path(baseurl, c("n45w180.zip", "n45w135.zip", "n45w90.zip", "n45w45.zip",    "n45e00.zip", "n45e45.zip",
                           "n45e90.zip", "n45e135.zip", "n00w180.zip", "n00w135.zip", "n00w90.zip",
                           "n00w45.zip", "n00e00.zip", "n00e45.zip", "n00e90.zip", "n00e135.zip",
                           "s45w180.zip", "s45w135.zip", "s45w90.zip", "s45w45.zip", "s45e00.zip",
                           "s45e45.zip", "s45e90.zip", "s45e135.zip", "s90w180.zip", "s90w135.zip",
                           "s90w90.zip", "s90w45.zip", "s90e00.zip", "s90e45.zip", "s90e90.zip",
                           "s90e135.zip"))

#for (i in seq_along(fs)) download.file(fs[i], file.path(localroot, basename(fs)[i]), mode = "wb")

## unzip
for (i in seq_along(fs)) utils::unzip(file.path(localroot, basename(fs)[i]))

## build the next string with R too
#txt <- gsub(".zip", "", basename(fs))
gdalbuildvrt geoid.vrt n45w180/n45w180/w001001.adf n45w135/n45w135/w001001.adf      n45w90/n45w90/w001001.adf n45w45/n45w45/w001001.adf n45e00/n45e00/w001001.adf n45e45/n45e45/w001001.adf n45e90/n45e90/w001001.adf n45e135/n45e135/w001001.adf n00w180/n00w180/w001001.adf n00w135/n00w135/w001001.adf n00w90/n00w90/w001001.adf n00w45/n00w45/w001001.adf n00e00/n00e00/w001001.adf n00e45/n00e45/w001001.adf n00e90/n00e90/w001001.adf n00e135/n00e135/w001001.adf s45w180/s45w180/w001001.adf s45w135/s45w135/w001001.adf s45w90/s45w90/w001001.adf s45w45/s45w45/w001001.adf s45e00/s45e00/w001001.adf s45e45/s45e45/w001001.adf s45e90/s45e90/w001001.adf s45e135/s45e135/w001001.adf s90w180/s90w180/w001001.adf s90w135/s90w135/w001001.adf s90w90/s90w90/w001001.adf s90w45/s90w45/w001001.adf s90e00/s90e00/w001001.adf s90e45/s90e45/w001001.adf s90e90/s90e90/w001001.adf s90e135/s90e135/w001001.adf


##gdal_translate geoid.vrt geoid15.tif -outsize 15% 15% -co COMPRESS=LZW -co TILED=YES

xfile <- system.file("extdata", "geoid15.tif", package = "potato")
potato_raster <- readAll(raster::raster(xfile))
extent(potato_raster) <- extent(-180, 180, -90, 90)
usethis::use_data(potato_raster, overwrite = TRUE)
