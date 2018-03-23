
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=tsclib
APPDB:=$(APP)/Db
APPSRC:=lib
APPINC:=include


USR_INCLUDES += -I$(where_am_I)/$(APPSRC)
USR_INCLUDES += -I$(where_am_I)/$(APPINC)

USR_CFLAGS   += -Wno-unused-variable
USR_CFLAGS   += -Wno-unused-function
USR_CFLAGS   += -Wno-unused-but-set-variable

HEADERS  = $(wildcard $(where_am_I)/include/*.h)

SOURCES += $(APPSRC)/tsculib.c
SOURCES += $(APPSRC)/clilib.c
SOURCES += $(APPSRC)/mtca4rtmlib.c
SOURCES += $(APPSRC)/ponmboxlib.c
SOURCES += $(APPSRC)/tscextlib.c
SOURCES += $(APPSRC)/tstlib.c


