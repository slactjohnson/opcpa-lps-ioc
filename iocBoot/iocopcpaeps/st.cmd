#!../../bin/linux-x86_64/opcpaeps

#- You may have to change opcpaeps to something else
#- everywhere it appears in this file

#< envPaths


## Register all support components
dbLoadDatabase("../../dbd/opcpaeps.dbd",0,0)
opcpaeps_registerRecordDeviceDriver(pdbbase) 

## Load record instances
epicsEnvSet("ASYN_PORT",     "EPS_ADS")

## Production
epicsEnvSet("IPADDR",        "10.5.5.5")
epicsEnvSet("AMSID",         "5.66.246.12.1.1")
epicsEnvSet("IPPORT",        851)

#adsAsynPortDriverConfigure("$(ASYN_PORT)","$(IPADDR)","$(AMSID)",$(IPPORT), 1000, 0, 0, 500, 100, 500, 0)

#asynSetTraceIOMask("$(ASYN_PORT)", -1, 2)
#asynSetTraceInfoMask("$(ASYN_PORT)", -1, 5)
asynOctetSetOutputEos("$(ASYN_PORT)", -1, "\n")
asynOctetSetInputEos("$(ASYN_PORT)", -1, "\n")
#asynSetTraceMask("$(ASYN_PORT)", -1, 0x41)


dbLoadRecords("../../db/eps_tmc.db")
dbLoadRecords("../../db/eps_tmc_helpers.db")
dbLoadRecords("../../db/eps_leak_monitor.db")
dbLoadRecords("../../db/eps_chiller_loop.db")
dbLoadRecords("../../db/eps_temp_monitor.db")

set_requestfile_path("./", "")
set_savefile_path("/home/nathan/Desktop/as")

create_monitor_set("settings.req", 1)
create_monitor_set("setpoints.req", 1)

set_pass0_restoreFile("settings.sav")
set_pass1_restoreFile("settings.sav")
set_pass0_restoreFile("setpoints.sav")
set_pass1_restoreFile("setpoints.sav")

iocInit()

## Start any sequence programs
#seq sncopcpaeps,"user=nathan"
