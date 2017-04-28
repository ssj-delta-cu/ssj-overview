# Delta Consumptive Use Project

In determining the consumptive use for the Delta, several research groups have been invited to estimate evapotranspiration estimates.

 - [CalSIMETAW] - Department of Water Resources [DWR], Morteza Orang): Estimates daily soil water balance to determine ETc and ETaw for use in California Water Plan Update.

 - [DETAW] - DWR, Tariq Kadir: Computerized ground surface water balance model for 168 subareas within the California Delta.

 - [UCD-METRIC] - UCDavis, Josué Medellín-Azuara: estimates ET based on energy balance and the partition of sensible and latent heat flux using mostly Landsat satellite data; with the internal calibration of the sensible heat computation using the ground-based reference ET.

 - [ITRC] - CalPoly, Dan Howes: modifies METRIC by using a semi-automated internal calibration and replacing the alfafa reference ET with grass reference ET.

 - [SIMS] - NASA Ames, Forrest Melton: utilizes the NASA Terrestrial Observation and Prediction System (TOPS) to integrate satellite observations and meteorological observations to map basal crop coefficients and evapotranspiration.

 - [UCD-PT]  - UCDavis, Yufang Jin: the Priestley Taylor ET approach uses the optimized semi-empirical Priestley-Taylor (PT) equations to estimate ET; net radiation, ground heat flux, and the PT coefficients are derived from MODIS and Landsat satellite data.

 - [DisALEXI]  - US Department of Agriculture-ARS, Martha Anderson: uses thermal satellite data based on the two-source Atmosphere-Land Exchange Inverse (ALEXI) model.  Higher resolution ET estimate is obtained through a spatial disaggregation technique using MODIS and Landsat data.

[CalSIMETAW]: https://github.com/ssj-delta-cu/ssj-calsimetaw
[UCD-METRIC]: https://github.com/ssj-delta-cu/ssj-ucd-metric
[ITRC]: https://github.com/ssj-delta-cu/ssj-itrc-metric
[SIMS]: https://github.com/ssj-delta-cu/ssj-nasa-tops
[UCD-PT]: https://github.com/ssj-delta-cu/ssj-ucd-priestley-taylor
[DisALEXI]: https://github.com/ssj-delta-cu/ssj-disalexi
[DETAW]: https://github.com/ssj-delta-cu/ssj-detaw



### Final Products

Product | [CalSIMETAW] | [UCD-METRIC] | [ITRC] | [SIMS] | [UCD-PT] | [DETAW] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
_ET_ | M/D | M | M | M | M | M/D | M
M=Monthly; D=Daily


### Required Inputs


Product | [CalSIMETAW] | [UCD-METRIC] | [ITRC] | [SIMS] | [UCD-PT] | [DETAW] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
[Weather] | D | I/D | I/D |  | | D | 
[ETo] | D | D | I/D |  |  |  | 
_ETr_ | D | I/D | I/D |  |  |  | 
[Landcover] | D |  |  |  |  | M | 
[Landsat8] |  | I | I | I | I  |  | I
_MODIS_ |  |  |  |  | I  |  | I
_GOES_ |  |  |  |  |   | | I
[DEM] |  | I | I | I | I | | I
where M=Monthly; D=Daily

[Weather]: https://github.com/ssj-delta-cu/ssj-weather
[ETo]: https://github.com/ssj-delta-cu/ssj-weather
[Landcover]: https://github.com/ssj-delta-cu/ssj-landuse
[Landsat8]: https://github.com/ssj-delta-cu/ssj-landsat



### Intermediate Data

Product | [CalSIMETAW] | [UCD-METRIC] | [ITRC] | [SIMS] | [UCD-PT] | [DETAW] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
_ET_ | | I | I | I | I | I | I
_ETo_ | D/M | I | I | I | I | D/M | I
_ETr_ |  | I | I |  | I |  | I
_Kc_ | D/M | I | I | I | I | D | I
_Kcr_ | | I | I | I |  | |
_Rn_ | | I | I | I |  |  |
_G_ | | I | I | I |  |  |
_H_ | | I | I | I |  |  |
_masks_ | | I | I | I |  |  |
where I=Instanteous; M=Monthly; D=Daily

_masks_ are any masks that limit the calculation of instantaneous ET.


## Delta Service Area Boundaries and Associated data (boundaries)

This project contains the suggested boundaries used for the ssj-delta-cu
project summary.  This includes the delta service area boundary, as well as
suggested rasters boundaries for input and output project data.

[Overview Map](https://www.google.com/maps/d/edit?mid=zDpfBkZvP6Yk.kvF3ZvPShMdE&usp=sharing)


<iframe src="https://www.google.com/maps/d/u/0/embed?mid=zDpfBkZvP6Yk.kvF3ZvPShMdE" width="640" height="480"></iframe>



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
interpolated).  However any resolution with an integral number of pixels in the region is acceptable.


# Uploading Final Monthly Data Products

## Format

 - 12 band geotiff raster
 - Each band representing month of the water year (Oct -> Sep)
 - Average daily ET units in tenths of a mm per day (mm/day * 10) in order to use integer rasters. 

## Git + LFS (Preferred Option)

Note: Git lfs must be used when any file in the repo is > 100 mb. If everything is less than ~50 mb you can just use git to commit the files and push the changes to the appropriate repository. Git LFS is a command line extension for efficiently dealing with large files.

1. [Set up Git LFS](https://git-lfs.github.com/)
2. Configure git lfs to track files
3. Commit and push changes to appropriate repo

## Alternative option - Upload to box.com

A second option if you are unable to set up git with lfs enabled is to upload the files to the project's private folder on box. Access to the upload folder is limited (@andybell, @josue-medellin, @jrmerz, @jessejanko). We will add the files to the appropriate repository.

[ssj-delta-cu private folder upload](http:/ssj-delta-cu.github.io/ssj-overview/upload.html)

## Semantic Versioning for EE assets and tagged releases

version | milestone
 --- | ---
v1-0-0 | inital assets from inital report (ie September 2016). Only 2015 water year.
v1-0-1 | any changes with uploading/converting rasters
v1-1-0 | any modifications recieved from groups
v2-0-0 | Data received from groups near end of April 2017
v3-0-0 | Data revisions after review



# 2016 - Field Campaign Equipment Deployment

[Field Campaign Equipment Deployment Spreadsheet](https://docs.google.com/spreadsheets/d/1roW6oTpE9N3zqmq51T5zbeRfcYPjryezxLqWY_L2SXc/edit#gid=314330290)
