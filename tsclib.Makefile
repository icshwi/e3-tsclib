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
# Date    : Friday, October 25 14:37:47 CEST 2019
# version : 0.0.2
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


APP:=
APPSRC:=lib
APPINC:=include
TSCMON:=src/TscMon

USR_INCLUDES += -I$(where_am_I)/$(APPINC)

HEADERS     += $(wildcard $(where_am_I)/include/*.h)

# libadc
ADCLIB_SRCS += $(APPSRC)/adc3112lib.c
ADCLIB_SRCS += $(APPSRC)/fscope3112lib.c
ADCLIB_SRCS += $(APPSRC)/adc3110lib.c
ADCLIB_SRCS += $(APPSRC)/gscope3110lib.c 
# libtsc
TSCLIB_SRCS += $(APPSRC)/tsculib.c
TSCLIB_SRCS += $(APPSRC)/clilib.c
TSCLIB_SRCS += $(APPSRC)/tscextlib.c
TSCLIB_SRCS += $(APPSRC)/tstlib.c
TSCLIB_SRCS += $(APPSRC)/ponmboxlib.c
TSCLIB_SRCS += $(APPSRC)/mtca4amclib.c
TSCLIB_SRCS += $(APPSRC)/mtca4rtmlib.c
TSCLIB_SRCS += $(APPSRC)/pca9539lib.c
TSCLIB_SRCS += $(APPSRC)/rsp1461lib.c 
TSCLIB_SRCS += $(APPSRC)/rdt1465lib.c
TSCLIB_SRCS += $(APPSRC)/rcc1466lib.c


SOURCES += $(ADCLIB_SRCS)
SOURCES += $(TSCLIB_SRCS)


.PHONY: vlibs db

db:

vlibs:

