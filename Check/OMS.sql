
--Check OMS Details
[oracle@bmioem bin]$ ./emctl status oms -details
Enter Enterprise Manager Root (SYSMAN) Password :


sop restart oms 13c:
---------------------
steps restart oms oem:
cd /data/OEM12C/middleware_new/bin/
./emctl status oms
./emctl stop oms -all
nb: makesure db dan listener up
./emctl start oms 
./emctl status oms


./emctl status oms -details


NB! untuk BI di skip status down nya, pastikan status semua nya down 
$ ps -ef | grep /data/OEM12C/middleware_new
$ ps -ef | grep agent

then kill -9 pid
apabila masih ada session yang jalan di kill aja 
$kill -9 `ps -ef |grep /data/OEM12C/middleware | grep -v grep | awk '{print $2}'`


Enterprise Manager Cloud Control is not currently available. The EMGC_OMS server where Cloud Control runs, or some other component, might be down.
1. Check status OMS --Check mountpointnya
2. restart OMS (stop oms all)
3. kill proses WebTier dan agent yang masih gantung (kill -9)
4. start oms
5. restart database EMREP --konfirm di group kalau masih tidak bisa/reboot server.


-----------------------------------------------------------------------------------------------------------------------------------


Shows the version of the OMS instance
./emctl getversion oms


Starts/stops only the BI Publisher server.
./emctl start oms -bip_only
./emctl status oms -bip_only
./emctl stop oms -bip_only [-force]



The parameter -force forcefully stops the process instead of a graceful shutdown. Using this parameter is not recommended.

---------------------------------------------------------------------------------------------------------------------

--generated file
$<OMS_HOME>/bin>./emctl dump oms -destdir </location>

Example:
$ cd /data/OEM12C/middleware_new
$ ./emctl dump oms -destdir /home/oracle

this will generate a zip file named oms_dump_YY.MM.DD.HH24:MI:SS.zip





Oracle Management Server Could Not Be Started
Check EM Server log file for details: 
/oracle/app/oracle/gc_inst/user_projects/domains/GCDomain/servers/EMGC_OMS1/logs/EMGC_OMS1.out
AdminServer Could Not Be Started
Check Admin Server log file for details: 
/oracle/app/oracle/gc_inst/user_projects/domains/GCDomain/servers/EMGC_ADMINSERVER/logs/EMGC_ADMINSERVER.out
Oracle Management Server is Down
JVMD Engine is Down
