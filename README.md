# Delta Consumptive Use Project

In determining the consumptive use for the Delta, several research groups have been invited to estimate evapotranspiration estimates.

 - [CUPS] / Cal-SIMETAW / DETAW  uses the traditional crop coefficient and reference ET approach to estimate crop ET spatially over California at various timescales.  Weighted crop coefficients are used to estimate ET for up to 20 crop and 4 land-use categories.

 - [METRIC] (UCDavis, Josué Medellín-Azuara): estimates ET based on energy balance and the partition of sensible and latent heat flux using mostly Landsat satellite data; with the internal calibration of the sensible heat computation using the ground-based reference ET.

 - [ITRC-METRIC] (CalPoly, Dan Howes): modifies METRIC by using a semi-automated internal calibration and replacing the alfafa reference ET with grass reference ET.

 - [NASA-TOPS] ET method (NASA Ames, Forrest Melton): utilizes the NASA Terrestrial Observation and Prediction System (TOPS) to integrate satellite observations and meteorological observations to map basal crop coefficients and evapotranspiration.

 - [UCD-PT] Priestley Taylor ET approach (UCDavis, Yufang Jin): uses the optimized semi-empirical Priestley-Taylor (PT) equations to estimate ET; net radiation, ground heat flux, and the PT coefficients are derived from MODIS and Landsat satellite data.

 - [JPL-PT] ET approach (Jet Propulsion Lab, Josh Fisher, Yufang Jin): a globally-applicable ET algorithm that translates the potential ET into actual ET.  Biophsyical remote sensing parameters are used to quantify multiple stresses on plant function based on the eco-physiological theory.  

 - [DisALEXI] (US Department of Agriculture-ARS, Martha Anderson): uses thermal satellite data based on the two-source Atmosphere-Land Exchange Inverse (ALEXI) model.  Higher resolution ET estimate is obtained through a spatial disaggregation technique using MODIS and Landsat data.

[CUPS]: https://github.com/ssj-delta-cu/ssj-calsimetaw
[METRIC]: https://github.com/ssj-delta-cu/ssj-ucd-metric
[ITRC-METRIC]: https://github.com/ssj-delta-cu/ssj-itrc-metric
[NASA-TOPS]: https://github.com/ssj-delta-cu/ssj-nasa-tops
[UCD-PT]: https://github.com/ssj-delta-cu/ssj-ucd-priestley-taylor
[JPL-PT]: https://github.com/ssj-delta-cu/ssj-jpl-pt
[DisALEXI]: https://github.com/ssj-delta-cu/ssj-disalexi



### Final Products

Product | [CUPS] | [METRIC] | [ITRC-METRIC] | [NASA-TOPS] | [UCD-PT] | [JPL-PT] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
_ET_ | M/D | M | M | M | M | M | M
M=Monthly; D=Daily


### Required Inputs


Product | [CUPS] | [METRIC] | [ITRC-METRIC] | [NASA-TOPS] | [UCD-PT] | [JPL-PT] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
[Weather] | D | I/D | I/D |  |  |  |
[ETo] | D | D | I/D |  |  |  |
_ETr_ | D | I/D | I-D |  |  |  |
[Landcover] | D |  |  |  | |  |
[Landsat8] |  | I | I | I | I  | I | I
_MODIS_ |  |  |  |  | I  |  | I
_GOES_ |  |  |  |  |   |  | I
[DEM] |  | I | I | I | I | I | I
where M=Monthly; D=Daily

[Weather]: https://github.com/ssj-delta-cu/ssj-weather
[ETo]: https://github.com/ssj-delta-cu/ssj-weather
Landcover: https://github.com/ssj-delta-cu/ssj-wea
[Landsat8]: https://github.com/ssj-delta-cu/ssj-landsat
[DEM]: https://github.com/ssj-delta-cu/ssj-overview/dem



### Intermediate Data

Product | [CUPS] | [METRIC] | [ITRC-METRIC] | [NASA-TOPS] | [UCD-PT] | [JPL-PT] | [DisALEXI]
--- | --- | --- | --- | --- | --- | --- | ---
_ET_ | | I | I | I | I | I | I
_ETo_ | D/M | I | I | I | I | I | I
_ETr_ |  | I | I |  | I | I | I
_Kc_ | D/M | I | I | I | I | I | I
_Kcr_ | | I | I | I |  |  |
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
interpolated).  However any resoultion with an integral number of pixels in the region is acceptable.
