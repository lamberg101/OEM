./agentDeploy.sh AGENT_BASE_DIR=/fcubs/backup/agent/em13c RESPONSE_FILE=/fcubs/backup/agent/em13c/agent.rsp ORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id

cp: 0653-435  /fcubs/backup/agent/em13c/agentimage.properties and /fcubs/backup/agent/em13c/agentimage.properties are identical (not copied).
The space available is ....  874083 MB
 Validating the OMS_HOST & EM_UPLOAD_PORT
Executing command : /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jdk/jre/bin/java -classpath /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jlib/agentInstaller.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller /fcubs/backup/agent/em13c/agent_13.1.0.0.0 /fcubs/backup/agent/em13c /fcubs/backup/agent/em13c AGENT_BASE_DIR=/fcubs/backup/agent/em13c RESPONSE_FILE=/fcubs/backup/agent/em13c/agent.rsp ORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id -prereq
AGENT_ins home is:AGENT_BASE_DIR=/fcubs/backup/agent/em13coraclehome is:/fcubs/backup/agent/em13c/agent_13.1.0.0.0
The oraclehome /fcubs/backup/agent/em13c/agent_13.1.0.0.0

Validating oms host & port with url: https://10.55.60.193:4903/empbs/genwallet
Validating oms host & port with url: http://10.55.60.193:4903/empbs/genwallet
Return status:0-oms http port is passed
Validating the OMS Host and Port completed.
/usr/bin/sed: Not a recognized flag: i
Usage:  sed [-n] [-u] Script [File ...]
        sed [-n] [-u] [-e Script] ... [-f Script_file] ... [File ...]
/usr/bin/sed: Not a recognized flag: i
Usage:  sed [-n] [-u] Script [File ...]
        sed [-n] [-u] [-e Script] ... [-f Script_file] ... [File ...]
The file access permissions do not allow the specified action.
./agentDeploy.sh[897]: /fcubs/backup/agent/em13c/agentInstall.rsp: 0403-005 Cannot create the specified file.
/usr/bin/sed: Not a recognized flag: i
Usage:  sed [-n] [-u] Script [File ...]
        sed [-n] [-u] [-e Script] ... [-f Script_file] ... [File ...]

--cp: /fcubs/backup/agent/em13c/agent.rsp: The file access permissions do not allow the specified action.

/fcubs/backup/agent/em13c/agentcore.bin -ignoreSysPrereqs -prereqChecker -entryPoint oracle.sysman.top.agent_Complete -silent -ignoreSysPrereqs -detailedExitCodes -responseFile /fcubs/backup/agent/em13c/agentInstall.rsp  -J-DORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id -J-Djava.io.tmpdir=/fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs -J-DAGENT_BASE_DIR=/fcubs/backup/agent/em13c
0%...................................................................................................100%
Launcher log file is /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_02-25-58PM/launcher2023-06-14_02-25-58PM.log.
Starting Oracle Prerequisite Checker

Checking if CPU speed is above 300 MHz.   Actual 3266.3345336914062 MHz    Passed
Checking swap space: must be greater than 512 MB.   Actual 130816 MB    Passed
Checking if this platform requires a 64-bit JVM.   Actual 64    Passed (64-bit not required)
Checking temp space: must be greater than 300 MB.   Actual 872837 MB    Passed


Preparing to launch the Oracle Universal Installer from /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_02-25-58PM
Oracle Prerequisite Checker Version 13.6.0.0.0 Production
Copyright (C) 1999, 2015, Oracle. All rights reserved.

Starting execution of prerequisite checks...
Total No of checks: 10

Performing check for CertifiedVersions_agent
Is the software certified on the current operating system?
Expected result: One of 7100,6100
Actual Result: 7100
Check complete. The overall result of this check is: Passed


Check complete: Passed

========================================================
Performing check for Packages_agent
Are the required packages installed on the current operating system?
Checking for bos.adt.base(0.0); found bos.adt.base(7.1.5.34).   Passed
Checking for bos.adt.lib(0.0); found bos.adt.lib(7.1.2.15).     Passed
Checking for bos.adt.libm(0.0); found bos.adt.libm(7.1.5.31).   Passed
Checking for bos.perf.libperfstat(0.0); found bos.perf.libperfstat(7.1.5.35).   Passed
Checking for bos.perf.perfstat(0.0); found bos.perf.perfstat(7.1.5.32). Passed
Checking for bos.perf.proctools(0.0); found bos.perf.proctools(7.1.5.31).       Passed
Checking for rsct.basic.rte(0.0); found rsct.basic.rte(3.2.3.5).        Passed
Checking for rsct.compat.clients.rte(0.0); found rsct.compat.clients.rte(3.2.3.0).      Passed
Checking for xlC.aix61.rte(10.1.0.0); found xlC.aix61.rte(13.1.3.3).    Passed
Checking for xlC.rte(10.1.0.0); found xlC.rte(13.1.3.3).        Passed
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for CompatibilityCheck
Is the software compatible with the current operating system?
sourceLoc is :/fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_02-25-58PM/stage/shiphomeproperties.xml
ARU ID is:212
Platform is :00F9CA414C00
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for AvailableInventorySpace
Checking for sufficient disk space in the Inventory Location
Expected result: 100.0MB
Actual Result: 59229MB
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for InventoryWritableCheck
Checking for write permissions on the inventory.
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for TZRegionCheck
Checking TimeZone settings...
Check complete. The overall result of this check is: Passed

Check complete: Passed
========================================================
Performing check for AgentBaseDirCheck
Is the ownership of the agent base directory valid?
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for PortCheck
Checking for port availability and hostname validity...
Host name to check mcbdbdrc03.bankmuamalat.co.id
PORT 3872
Getting Inet Addresses for host mcbdbdrc03.bankmuamalat.co.id
Trying for host : mcbdbdrc03.bankmuamalat.co.id/10.81.7.29 and port : 3872
Trying for host : /127.0.0.1 and port : 3872
Port= 3872 is busy.
Getting Inet Addresses for host mcbdbdrc03.bankmuamalat.co.id
Trying for host : mcbdbdrc03.bankmuamalat.co.id/10.81.7.29 and port : 1830
Trying for host : /127.0.0.1 and port : 1830
** Agent Port Check completed successfully.**
Agent port to use 1830
===Expected Result final Either port 3872 must be available or a port in the range of 1830 to 1849 must be available on host mcbdbdrc03.bankmuamalat.co.id.
Expected result: Either port 3872 must be available or a port in the range of 1830 to 1849 must be available on host mcbdbdrc03.bankmuamalat.co.id.
Actual Result: 1830
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for OracleHomeCheck
Checking whether the old oracle home entry is present in the central inventory ...
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for CheckHostName
Is the host name valid?
value of oracle_hostname:mcbdbdrc03.bankmuamalat.co.id
value of hostname is:mcbdbdrc03
Expected result: Fully qualified domain name, for example foo.mydomain.com
Actual Result: mcbdbdrc03.bankmuamalat.co.id. Ensure that you provide a fully qualified domain name.
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
PrereqChecks complete

Logs are located here: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_02-25-58PM.
-e
 Agent Prereqs Completed

The file access permissions do not allow the specified action.
./agentDeploy.sh[1130]: /fcubs/backup/agent/em13c/agentInstall.rsp: 0403-005 Cannot create the specified file.
-e

 Starting Install Phase .....
/fcubs/backup/agent/em13c/agentcore.bin -ignoreSysPrereqs -silent -responseFile /fcubs/backup/agent/em13c/agentInstall.rsp
0%...................................................................................................100%
Launcher log file is /tmp/OraInstall2023-06-14_02-28-40PM/launcher2023-06-14_02-28-40PM.log.
Starting Oracle Universal Installer

Checking if CPU speed is above 300 MHz.   Actual 3266.3345336914062 MHz    Passed
Checking swap space: must be greater than 512 MB.   Actual 130816 MB    Passed
Checking if this platform requires a 64-bit JVM.   Actual 64    Passed (64-bit not required)
Checking temp space: must be greater than 300 MB.   Actual 2226 MB    Passed


Preparing to launch the Oracle Universal Installer from /tmp/OraInstall2023-06-14_02-28-40PM
Jun 14, 2023 2:28:47 PM oracle.sysman.oii.oiio.oiioz.OiiozResponseFile getValue
INFO: This installation is being performed using response file /fcubs/backup/agent/em13c/agentInstall.rsp.
NGINST-64003: Oracle home location is not specified.
Logs are located here: /tmp/OraInstall2023-06-14_02-28-40PM.
-e  Agent Software install completed

Creating symlink /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk/bin /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jdk/bin
Executing command to check/apply patches if exist in agenthome.....
/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin/perl /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/oneoffs/apply_NewOneoffs.pl /fcubs/backup/agent/em13c/agent_13.1.0.0.0 true
./agentDeploy.sh[1155]: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin/perl:  not found.
-e Oneoff patch application failed

Copying Install logs to /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/agentDeploy .....
cat: 0652-050 Cannot open /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oraInst.loc.
ls: 0653-341 The file /logs does not exist.
-e Entered Post Install...

Relaxing execute  permission for other users  on /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install for bug#20005612
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/sysman: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/unix: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/unix/scripts: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/lib: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/lib/lib*.s*: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/sysman/admin: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/plugins: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jdbc: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/instantclient: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/bin: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/bin/emtgtctl: A file or directory in the path name does not exist.
chmod: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/bin/emtgtctl2: A file or directory in the path name does not exist.
/fcubs/backup/agent/em13c/plugins.txt not found. The Management Agent installation failed. The plug-in oracle.sysman.oh may not be present in the Management Agent software. Ensure that the Management Agent software has the oracle.sysman.oh monitoring and discovery plug-in.
