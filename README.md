# Delta Service Area Boundaries and Associated data (boundaries)

This project contains the suggested boundaries used for the ssj-delta-cu
project summary.  This includes the delta service area boundary, as well as
suggested rasters bounderies for input and output projectdata.

## Gridded data

The suggested region for gridded data uses the California Equal Area projection
[EPSG:3310](http://spatialreference.org/ref/epsg/3310/) with the lower left
corner ```ll=-164000 -44000``` and the upper right corner ```ur=-108000 68000```

These boundaries are coincident with [DWR's Cal-SIMETAW planning
grid](https://github.com/CSTARS/dwr-grid), which has pixel size of 4km, as well
as the [Spatial CIMIS program](http://wwwcimis.water.ca.gov/SpatialData.aspx),
with a pixel size of 2km.

For higher resolution imagery, we suggest the following potential resolutions, all of which share boundaries at the pixel level:

 pixel (m) | x | y | total
 --- | --- | --- | ---
 4000 |       14 |       28 |      392
2000 |       28 |       56 |     1568
1000 |       56 |      112 |     6272
 500 |      112 |      224 |    25088
 250 |      224 |      448 |   100352
 125 |      448 |      896 |   401408
  25 |     2240 |     4480 | 10035200

For example, our landsat imagery will be delivered at 25m (cubic spline
interpolated).  However any resoultion with an integral number of pixels in the region is acceptable.

# Weather

gdal_translate -projwin -400000 450000 600000 -650000 ETo.asc eto.tif
