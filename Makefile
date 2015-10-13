#! /usr/bin/make -f

include configure.mk

schema:=public
service=ssj-delta-cu
src:=src/DeltaServiceArea_WGS84.shp

DEFAULT: delta_service_area.geojson shp

# Converting to WGS84 is a more accepted GEOJSON format.
delta_service_area.geojson: src/delta_service_area.vrt ${src}
	ogr2ogr -f GEOJSON  -t_srs WGS84 $@ $<

# Here's an Example of materializing that VRT file, for example to
# upload to Google Maps.
shp: src/delta_service_area.vrt
	ogr2ogr $@ $<

# Additionally, we may want to show alternative import strateigies.
# This rule will create a PostGIS version in ${schema}
.PHONY: postgis
postgis: src/delta_service_area.vrt ${src}
	${OGR} src/delta_service_area.vrt

# In order to use our PostGIS import, we include some standard
# configuration file.  This is pulled from a specific version, as a
# github GIST.  This, we probably don't save in our repo.  Want users
# to see where it came from.  Update to newer version if required.
configure.mk:gist:=https://gist.githubusercontent.com/qjhart/052c63d3b1a8b48e4d4f
configure.mk:
	wget ${gist}/raw/e30543c3b8d8ff18a950750a0f340788cc8c1931/configure.mk

# Some convience functions for testing and repreoducing
clean:
	rm -rf configure.mk shp geojson
