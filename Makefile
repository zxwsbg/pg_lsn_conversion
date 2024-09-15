# sequeantial_uuids/Makefile
#
# Copyright (c) 2018-2022 Tomas Vondra <tomas@pgaddict.com>
#

EXTENSION = pg_lsn_conversion
DATA = pg_lsn_conversion--1.0.sql 

REGRESS      = conversion

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pg_lsn_conversion
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
