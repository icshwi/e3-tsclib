#
#  Copyright (c) 2019     European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : jeonghan.lee@gmail.com
# Date    : Monday, October 21 22:09:54 CEST 2019
# version : 0.0.1
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


APP:=
APPSRC:=lib
APPINC:=include

USR_INCLUDES += -I$(where_am_I)/$(APPINC)

HEADERS  = $(wildcard $(where_am_I)/include/*.h)

# libadc
SOURCES += $(APPSRC)/adc3112lib.c
SOURCES += $(APPSRC)/fscope3112lib.c
SOURCES += $(APPSRC)/adc3110lib.c
SOURCES += $(APPSRC)/gscope3110lib.c 
# libtsc
SOURCES += $(APPSRC)/tsculib.c
SOURCES += $(APPSRC)/clilib.c
SOURCES += $(APPSRC)/tscextlib.c
SOURCES += $(APPSRC)/tstlib.c
SOURCES += $(APPSRC)/ponmboxlib.c
SOURCES += $(APPSRC)/mtca4amclib.c
SOURCES += $(APPSRC)/mtca4rtmlib.c
SOURCES += $(APPSRC)/pca9539lib.c
SOURCES += $(APPSRC)/rsp1461lib.c 
SOURCES += $(APPSRC)/rdt1465lib.c
SOURCES += $(APPSRC)/rcc1466lib.c




.PHONY: vlibs db

db:

vlibs:
