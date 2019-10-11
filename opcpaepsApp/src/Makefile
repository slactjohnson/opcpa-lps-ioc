TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = opcpaeps
# opcpaeps.dbd will be created and installed
DBD += opcpaeps.dbd

# opcpaeps.dbd will be made up from these files:
opcpaeps_DBD += base.dbd
opcpaeps_DBD += asyn.dbd
opcpaeps_DBD += ads.dbd
opcpaeps_DBD += asSupport.dbd

# Include dbd files from all support applications:
#opcpaeps_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#opcpaeps_LIBS += xxx
opcpaeps_LIBS += asyn
opcpaeps_LIBS += ads
opcpaeps_LIBS += autosave

# opcpaeps_registerRecordDeviceDriver.cpp derives from opcpaeps.dbd
opcpaeps_SRCS += opcpaeps_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
opcpaeps_SRCS_DEFAULT += opcpaepsMain.cpp
opcpaeps_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#opcpaeps_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
opcpaeps_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

