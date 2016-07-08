# Monthly Water Year 2015

This directory should hold rasters for the monthly datasets

# Rasters

You must supply ```ET.tif``` showing the average daily _ET_ for the Delta Service area for the entire year.  This should have 12 bands, and the first band should correspond to the first month of the water year, 2014-10.  The data should show the average daily ET for each month, not the total.  The image dimensions are described in the ssj-overview project.  The units of the ET.tif file should be either in integer mm, or 1/10s of mm, and the pixels should be in either byte or 16bit integer format. 

Supplying any of the additional parameters, _Kc_, _H_, _G_, would be very helpful.  Again supply these as 12 band files.

