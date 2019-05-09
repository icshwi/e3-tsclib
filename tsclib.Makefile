
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS

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

#build and install TscMon executalbe
BINS += $(TSCMON)

TEMP_PATH      := $(where_am_I)O.$(EPICSVERSION)_$(T_A)
TSCMON         := $(TEMP_PATH)/bin/TscMon
TSCMON_SRC_DIR := src/TscMon

TSCMON_SRC += $(TSCMON_SRC_DIR)/acq1430.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/adc3110.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/adc3112.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/adc3117.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/alias.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/buf.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/conf.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/ddr.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/dma.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/fifo.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/i2c.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/lmk.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/map.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/mbox.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/rdwr.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/rsp1461.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/rtm.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/script.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/semaphore.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/sflash.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/tdma.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/timer.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/tst.c
TSCMON_SRC += $(TSCMON_SRC_DIR)/TscMon.c

# driver.makefile changes folder to $(T_A) and default rules assume SRC is ../ and all .o are complied to PWD
# therefore source paths are stripped off of folder name and converted to .o extension
TSCMON_OBJ := $(notdir $(TSCMON_SRC:.c=.o))

# and following rules are prepared to build .o and make final linking
%.o: $(TSCMON_SRC_DIR)/%.c
	$(COMPILE.c) -o $@ -c $<

$(TSCMON): $(TSCMON_OBJ)
	mkdir -p $(dir $@)
	$(LINK.c) -Wall -L$(TEMP_PATH) -o $(TSCMON) $(TSCMON_OBJ) -l$(APP) -lrt -lm

# db rule is the default in RULES_E3, so add the empty one
db:

#
.PHONY: vlibs
vlibs:
#
