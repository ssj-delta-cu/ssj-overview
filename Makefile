#! /usr/bin/make -f

# Alther w/ service=ssj
include configure.mk

service:=ssj-delta-cu
schema:=public
src:=src/DeltaServiceArea_WGS84.shp

ogrdsn:=PG:"service=${service}"
OGR:=ogr2ogr -f "PostgreSQL" ${ogrdsn}

DEFAULT: delta_service_area.geojson shp

# Converting to WGS84 is a more accepted GEOJSON format.
delta_service_area.geojson: src/delta_service_area.vrt ${src}
	ogr2ogr -f GEOJSON  -t_srs WGS84 $@ $<

# Converting to WGS84 is a more accepted GEOJSON format.
detaw_subareas.geojson: src/detaw_subareas.vrt src/DETAW_Subareas_n83u10.shp
	ogr2ogr -f GEOJSON  -t_srs WGS84 $@ $<

# Here's an Example of materializing that VRT file, for example to
# upload to Google Maps.
shp: src/delta_service_area.vrt
	ogr2ogr $@ $<

# Additionally, we may want to show alternative import strateigies.
# This rule will create a PostGIS version in ${schema}
.PHONY: postgis
postgis: src/delta_service_area.vrt src/detaw_subareas.vrt
#	${OGR} src/delta_service_area.vrt
	${OGR} -nln detaw_subareas -nlt MULTIPOLYGON src/detaw_subareas.vrt

bbox.csv:
	${PG} -c "copy (with m as (select st_xmin(boundary) as llx,st_ymin(boundary) as lly,st_xmax(boundary) as urx,st_ymax(boundary) as ury from delta_service_area) select 'bounding box' as name,st_asKML(st_setsrid(st_makebox2d(st_makepoint(floor(llx/4000)*4000,floor(lly/4000)*4000),st_makePoint(ceil(urx/4000)*4000,ceil(ury/4000)*4000)),3310)) as boundary from m) to stdout with csv header;" > $@

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

# ogr2ogr -overwrite -a_srs EPSG:3310 -f "Postgresql" PG:"service=delta" large_fields.geojson -nln large_fields
