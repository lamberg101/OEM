 
The space available is ....  870370 MB
-e 
 Validating the OMS_HOST & EM_UPLOAD_PORT
Executing command : /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jdk/jre/bin/java -classpath /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jlib/agentInstaller.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller /fcubs/backup/agent/em13c/agent_13.1.0.0.0 /fcubs/backup/agent/em13c /fcubs/backup/agent/em13c AGENT_BASE_DIR=/fcubs/backup/agent/em13c RESPONSE_FILE=/fcubs/backup/agent/em13c/agent.rsp ORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id -prereq
AGENT_ins home is:AGENT_BASE_DIR=/fcubs/backup/agent/em13coraclehome is:/fcubs/backup/agent/em13c/agent_13.1.0.0.0
The oraclehome /fcubs/backup/agent/em13c/agent_13.1.0.0.0

Validating oms host & port with url: https://10.55.60.193:4903/empbs/genwallet
Validating oms host & port with url: http://10.55.60.193:4903/empbs/genwallet
Return status:0-oms http port is passed
Validating the OMS Host and Port completed.
/fcubs/backup/agent/em13c/agentcore.bin -ignoreSysPrereqs -prereqChecker -entryPoint oracle.sysman.top.agent_Complete -silent -ignoreSysPrereqs -detailedExitCodes -responseFile /fcubs/backup/agent/em13c/agentInstall.rsp  -J-DORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id -J-Djava.io.tmpdir=/fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs -J-DAGENT_BASE_DIR=/fcubs/backup/agent/em13c   
Launcher log file is /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_03-24-39PM/launcher2023-06-14_03-24-39PM.log.
Starting Oracle Prerequisite Checker

Checking if CPU speed is above 300 MHz.   Actual 3266.3345336914062 MHz    Passed
Checking swap space: must be greater than 512 MB.   Actual 130816 MB    Passed
Checking if this platform requires a 64-bit JVM.   Actual 64    Passed (64-bit not required)
Checking temp space: must be greater than 300 MB.   Actual 869121 MB    Passed


Preparing to launch the Oracle Universal Installer from /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_03-24-39PM
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
Checking for bos.adt.base(0.0); found bos.adt.base(7.1.5.34).	Passed
Checking for bos.adt.lib(0.0); found bos.adt.lib(7.1.2.15).	Passed
Checking for bos.adt.libm(0.0); found bos.adt.libm(7.1.5.31).	Passed
Checking for bos.perf.libperfstat(0.0); found bos.perf.libperfstat(7.1.5.35).	Passed
Checking for bos.perf.perfstat(0.0); found bos.perf.perfstat(7.1.5.32).	Passed
Checking for bos.perf.proctools(0.0); found bos.perf.proctools(7.1.5.31).	Passed
Checking for rsct.basic.rte(0.0); found rsct.basic.rte(3.2.3.5).	Passed
Checking for rsct.compat.clients.rte(0.0); found rsct.compat.clients.rte(3.2.3.0).	Passed
Checking for xlC.aix61.rte(10.1.0.0); found xlC.aix61.rte(13.1.3.3).	Passed
Checking for xlC.rte(10.1.0.0); found xlC.rte(13.1.3.3).	Passed
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for CompatibilityCheck
Is the software compatible with the current operating system?
sourceLoc is :/fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_03-24-39PM/stage/shiphomeproperties.xml
ARU ID is:212
Platform is :00F9CA414C00
Check complete. The overall result of this check is: Passed


Check complete: Passed
========================================================
Performing check for AvailableInventorySpace
Checking for sufficient disk space in the Inventory Location
Expected result: 100.0MB
Actual Result: 59192MB
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

Logs are located here: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/prereqlogs/OraInstall2023-06-14_03-24-39PM.
-e  
 Agent Prereqs Completed 
-e 
 
 Starting Install Phase .....
/fcubs/backup/agent/em13c/agentcore.bin -ignoreSysPrereqs -silent -responseFile /fcubs/backup/agent/em13c/agentInstall.rsp    
Launcher log file is /tmp/OraInstall2023-06-14_03-27-00PM/launcher2023-06-14_03-27-00PM.log.
Starting Oracle Universal Installer

Checking if CPU speed is above 300 MHz.   Actual 3266.3345336914062 MHz    Passed
Checking swap space: must be greater than 512 MB.   Actual 130816 MB    Passed
Checking if this platform requires a 64-bit JVM.   Actual 64    Passed (64-bit not required)
Checking temp space: must be greater than 300 MB.   Actual 2172 MB    Passed


Preparing to launch the Oracle Universal Installer from /tmp/OraInstall2023-06-14_03-27-00PM
..................................................................................................
Installation Summary


Disk Space : Required 1,588 MB, Available 870,068 MB
Feature Sets to Install:
	Perl 5.10.0.0.5 5.10.0.0.5
	OPatch 13.6.0.0.0
	Oracle HTTP Client 12.1.3.0.0
	Oracle XDK 12.1.3.0.0
	DMS Full 12.1.3.0.0
	Wallet Functionality 12.1.3.0.0
	Remote Diagnostic Assistant 8.09.0.1.0
..................................................................................................
Session log file is /tmp/OraInstall2023-06-14_03-27-00PM/install2023-06-14_03-27-00PM.log

Loading products list. Please wait.
.................. 1%
.................. 40%

Loading products. Please wait.
.................. 41%
.................. 42%
.................. 43%
.................. 44%
.................. 45%
.................. 46%
.................. 47%
.................. 48%
.................. 49%
.................. 50%
.................. 51%
.................. 52%
.................. 53%
.................. 54%
.................. 55%
.................. 56%
.................. 57%
.................. 58%
.................. 59%
.................. 60%
.................. 61%
.................. 62%
.................. 63%
.................. 64%
.................. 65%
.................. 66%
.................. 67%
.................. 68%
.................. 69%
.................. 70%
.................. 71%
.................. 72%
.................. 73%
.................. 74%
.................. 75%
.................. 76%
.................. 77%
.................. 78%
.................. 79%
.................. 80%
.................. 81%
.................. 82%
.................. 83%
.................. 84%
.................. 85%
.................. 86%
.................. 87%
.................. 88%
.................. 88%
.................. 89%
.................. 89%
.................. 90%
.................. 91%
.................. 92%
.................. 93%
.................. 94%
.................. 95%
.................. 96%
.................. 97%
.................. 98%
.................. 99%

Updating Libraries



Starting Installations
.................. 1%
.................. 2%
.................. 3%
.................. 4%
.................. 5%
.................. 6%
.................. 7%
.................. 8%
.................. 9%
.................. 10%
.................. 11%
.................. 12%
.................. 13%
.................. 14%
.................. 15%
.................. 16%
.................. 17%
.................. 18%
.................. 19%
.................. 20%
.................. 21%
.................. 22%
.................. 23%
.................. 24%
.................. 25%
.................. 26%
.................. 27%
.................. 28%
.................. 29%
.................. 30%
.................. 31%
.................. 32%
.................. 33%
.................. 34%
.................. 35%
.................. 36%
.................. 37%
.................. 38%
.................. 39%
.................. 40%
.................. 41%
.................. 42%
.................. 43%
.................. 44%
.................. 45%
.................. 46%
.................. 47%
.................. 48%
.................. 49%
.................. 50%
.................. 51%
.................. 52%
.................. 53%
.................. 54%
.................. 55%
.................. 56%
.................. 57%
.................. 58%
.................. 59%
.................. 60%
.................. 61%
.................. 62%
.................. 63%
.................. 64%
.................. 65%
.................. 66%
.................. 67%

Install pending...

Installation in progress

 Component : oracle.osdt.core 12.1.3.0.0 

Copying files for 'oracle.osdt.core 12.1.3.0.0 '

 Component : oracle.pki 12.1.3.0.0 

Copying files for 'oracle.pki 12.1.3.0.0 '

 Component : oracle.rsa.crypto 12.1.3.0.0 

Copying files for 'oracle.rsa.crypto 12.1.3.0.0 '

 Component : oracle.glcm.logging 1.2.0.0.0 

Copying files for 'oracle.glcm.logging 1.2.0.0.0 '

 Component : oracle.glcm.comdev 7.4.0.0.0 

Copying files for 'oracle.glcm.comdev 7.4.0.0.0 '

 Component : oracle.glcm.dependency 1.4.0.0.0 

Copying files for 'oracle.glcm.dependency 1.4.0.0.0 '

 Component : oracle.glcm.xmldh 3.0.0.0.0 

Copying files for 'oracle.glcm.xmldh 3.0.0.0.0 '

 Component : oracle.glcm.wizard 7.4.0.0.0 

Copying files for 'oracle.glcm.wizard 7.4.0.0.0 '

 Component : oracle.glcm.encryption 2.3.0.0.0 

Copying files for 'oracle.glcm.encryption 2.3.0.0.0 '

 Component : oracle.bali.share 12.1.3.0.0 

Copying files for 'oracle.bali.share 12.1.3.0.0 '

 Component : oracle.bali.jewt 12.1.3.0.0 

Copying files for 'oracle.bali.jewt 12.1.3.0.0 '

 Component : oracle.bali.ice 6.1.3.2.1 

Copying files for 'oracle.bali.ice 6.1.3.2.1 '

 Component : oracle.help.share 12.1.3.0.0 

Copying files for 'oracle.help.share 12.1.3.0.0 '

 Component : oracle.help.ohj 12.1.3.0.0 

Copying files for 'oracle.help.ohj 12.1.3.0.0 '

 Component : oracle.nginst.common 13.6.0.0.0 

Copying files for 'oracle.nginst.common 13.6.0.0.0 '

 Component : oracle.nginst.osp.compstager 13.6.0.0.0 

Copying files for 'oracle.nginst.osp.compstager 13.6.0.0.0 '

 Component : oracle.glcm.opatch.common.api 13.6.0.0.0 

Copying files for 'oracle.glcm.opatch.common.api 13.6.0.0.0 '

 Component : oracle.nginst.core 13.6.0.0.0 

Copying files for 'oracle.nginst.core 13.6.0.0.0 '

 Component : oracle.nginst.thirdparty 13.6.0.0.0 

Copying files for 'oracle.nginst.thirdparty 13.6.0.0.0 '

 Component : oracle.swd.opatch 13.6.0.0.0 

Copying files for 'oracle.swd.opatch 13.6.0.0.0 '

 Component : oracle.apache.commons.cli 1.2.0.0.0 

Copying files for 'oracle.apache.commons.cli 1.2.0.0.0 '

 Component : oracle.apache.commons.compress 1.4.0.0.0 

Copying files for 'oracle.apache.commons.compress 1.4.0.0.0 '

 Component : oracle.glcm.osys.core 13.6.0.0.0 

Copying files for 'oracle.glcm.osys.core 13.6.0.0.0 '

 Component : oracle.glcm.oplan.core 13.6.0.0.0 

Copying files for 'oracle.glcm.oplan.core 13.6.0.0.0 '

 Component : oracle.glcm.opatchauto.core 13.6.0.0.0 

Copying files for 'oracle.glcm.opatchauto.core 13.6.0.0.0 '

 Component : oracle.jse.dms 12.1.3.0.0 

Copying files for 'oracle.jse.dms 12.1.3.0.0 '

 Component : oracle.jrf.dms.common 12.1.3.0.0 

Copying files for 'oracle.jrf.dms.common 12.1.3.0.0 '

 Component : oracle.jrf.dms 12.1.3.0.0 

Copying files for 'oracle.jrf.dms 12.1.3.0.0 '

 Component : oracle.xdk.jrf.jaxp 12.1.3.0.0 

Copying files for 'oracle.xdk.jrf.jaxp 12.1.3.0.0 '

 Component : oracle.xdk.jrf 12.1.3.0.0 

Copying files for 'oracle.xdk.jrf 12.1.3.0.0 '

 Component : oracle.xdk.jrf.fmw 12.1.3.0.0 

Copying files for 'oracle.xdk.jrf.fmw 12.1.3.0.0 '

 Component : oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 

Copying files for 'oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 '

 Component : oracle.sysman.top.agent 13.1.0.0.0 

Copying files for 'oracle.sysman.top.agent 13.1.0.0.0 '

 Component : oracle.sysman.common 13.1.0.0.0 

Copying files for 'oracle.sysman.common 13.1.0.0.0 '

 Component : oracle.sysman.sbin 13.1.0.0.0 

Copying files for 'oracle.sysman.sbin 13.1.0.0.0 '

 Component : oracle.sysman.emagent.installer 13.1.0.0.0 

Copying files for 'oracle.sysman.emagent.installer 13.1.0.0.0 '

 Component : oracle.sysman.darda 8.09.0.1.0 

Copying files for 'oracle.sysman.darda 8.09.0.1.0 '

 Component : oracle.jre 1.7.0.9.85 

Copying files for 'oracle.jre 1.7.0.9.85 '

 Component : oracle.jdk 1.7.0.9.85 

Copying files for 'oracle.jdk 1.7.0.9.85 '

 Component : oracle.ldap.rsf 12.1.3.0.0 

Copying files for 'oracle.ldap.rsf 12.1.3.0.0 '

 Component : oracle.buildtools.rsf 11.2.0.3.0 

Copying files for 'oracle.buildtools.rsf 11.2.0.3.0 '

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/utl/rootmacro.sbs'.

 Component : oracle.wsm.common 12.1.3.0.0 

Copying files for 'oracle.wsm.common 12.1.3.0.0 '

 Component : oracle.jrf.j2ee 12.1.3.0.0 

Copying files for 'oracle.jrf.j2ee 12.1.3.0.0 '

 Component : oracle.opss.core 12.1.3.0.0 

Copying files for 'oracle.opss.core 12.1.3.0.0 '

 Component : oracle.sysman.agent.ic 13.1.0.0.0 

Copying files for 'oracle.sysman.agent.ic 13.1.0.0.0 '

 Component : oracle.ons 12.1.3.0.0 

Copying files for 'oracle.ons 12.1.3.0.0 '

 Component : oracle.http_client 12.1.3.0.0 

Copying files for 'oracle.http_client 12.1.3.0.0 '

 Component : oracle.perlint 5.10.0.0.4 

Copying files for 'oracle.perlint 5.10.0.0.4 '

 Component : oracle.perlint.expat 2.0.1.0.3 

Copying files for 'oracle.perlint.expat 2.0.1.0.3 '

 Component : oracle.perlint.modules 5.10.0.0.4 

Copying files for 'oracle.perlint.modules 5.10.0.0.4 '

Install successful

Post feature install pending...

Post Feature installing

 Feature Set : apache_commons_compress_lib

 Feature Set : apache_commons_cli_lib

 Feature Set : oracle.glcm.opatchauto.core.actions.classpath

 Feature Set : com.oracle.db.xdk-no-jaxp

 Feature Set : oracle.glcm.opatchauto.core.wallet.classpath

Post Feature installing 'apache_commons_cli_lib'

Post Feature installing 'com.oracle.db.xdk-no-jaxp'

Post Feature installing 'oracle.glcm.opatchauto.core.actions.classpath'

Post Feature installing 'oracle.glcm.opatchauto.core.wallet.classpath'

 Feature Set : orapki.lib

 Feature Set : oracle.glcm.opatchauto.core.classpath

Post Feature installing 'orapki.lib'

Post Feature installing 'oracle.glcm.opatchauto.core.classpath'

Post Feature installing 'apache_commons_compress_lib'

 Feature Set : glcm_common_lib

 Feature Set : oracle.glcm.opatch.common.api.classpath

Post Feature installing 'glcm_common_lib'

 Feature Set : oracle.glcm.oplan.core.classpath

Post Feature installing 'oracle.glcm.opatch.common.api.classpath'

Post Feature installing 'oracle.glcm.oplan.core.classpath'

 Feature Set : oracle.glcm.osys.core.classpath

 Feature Set : com.oracle.orapki

Post Feature installing 'oracle.glcm.osys.core.classpath'

Post Feature installing 'com.oracle.orapki'

 Feature Set : glcm_encryption_lib

Post Feature installing 'glcm_encryption_lib'

Post feature install complete

String substitutions pending...

String substituting

 Component : oracle.osdt.core 12.1.3.0.0 

String substituting 'oracle.osdt.core 12.1.3.0.0 '

 Component : oracle.pki 12.1.3.0.0 

String substituting 'oracle.pki 12.1.3.0.0 '

 Component : oracle.rsa.crypto 12.1.3.0.0 

String substituting 'oracle.rsa.crypto 12.1.3.0.0 '

 Component : oracle.glcm.logging 1.2.0.0.0 

String substituting 'oracle.glcm.logging 1.2.0.0.0 '

 Component : oracle.glcm.comdev 7.4.0.0.0 

String substituting 'oracle.glcm.comdev 7.4.0.0.0 '

 Component : oracle.glcm.dependency 1.4.0.0.0 

String substituting 'oracle.glcm.dependency 1.4.0.0.0 '

 Component : oracle.glcm.xmldh 3.0.0.0.0 

String substituting 'oracle.glcm.xmldh 3.0.0.0.0 '

 Component : oracle.glcm.wizard 7.4.0.0.0 

String substituting 'oracle.glcm.wizard 7.4.0.0.0 '

 Component : oracle.glcm.encryption 2.3.0.0.0 

String substituting 'oracle.glcm.encryption 2.3.0.0.0 '

 Component : oracle.bali.share 12.1.3.0.0 

String substituting 'oracle.bali.share 12.1.3.0.0 '

 Component : oracle.bali.jewt 12.1.3.0.0 

String substituting 'oracle.bali.jewt 12.1.3.0.0 '

 Component : oracle.bali.ice 6.1.3.2.1 

String substituting 'oracle.bali.ice 6.1.3.2.1 '

 Component : oracle.help.share 12.1.3.0.0 

String substituting 'oracle.help.share 12.1.3.0.0 '

 Component : oracle.help.ohj 12.1.3.0.0 

String substituting 'oracle.help.ohj 12.1.3.0.0 '

 Component : oracle.nginst.common 13.6.0.0.0 

String substituting 'oracle.nginst.common 13.6.0.0.0 '

 Component : oracle.nginst.osp.compstager 13.6.0.0.0 

String substituting 'oracle.nginst.osp.compstager 13.6.0.0.0 '

 Component : oracle.glcm.opatch.common.api 13.6.0.0.0 

String substituting 'oracle.glcm.opatch.common.api 13.6.0.0.0 '

 Component : oracle.nginst.core 13.6.0.0.0 

String substituting 'oracle.nginst.core 13.6.0.0.0 '

 Component : oracle.nginst.thirdparty 13.6.0.0.0 

String substituting 'oracle.nginst.thirdparty 13.6.0.0.0 '

 Component : oracle.swd.opatch 13.6.0.0.0 

String substituting 'oracle.swd.opatch 13.6.0.0.0 '

 Component : oracle.apache.commons.cli 1.2.0.0.0 

String substituting 'oracle.apache.commons.cli 1.2.0.0.0 '

 Component : oracle.apache.commons.compress 1.4.0.0.0 

String substituting 'oracle.apache.commons.compress 1.4.0.0.0 '

 Component : oracle.glcm.osys.core 13.6.0.0.0 

String substituting 'oracle.glcm.osys.core 13.6.0.0.0 '

 Component : oracle.glcm.oplan.core 13.6.0.0.0 

String substituting 'oracle.glcm.oplan.core 13.6.0.0.0 '

 Component : oracle.glcm.opatchauto.core 13.6.0.0.0 

String substituting 'oracle.glcm.opatchauto.core 13.6.0.0.0 '

 Component : oracle.jse.dms 12.1.3.0.0 

String substituting 'oracle.jse.dms 12.1.3.0.0 '

 Component : oracle.jrf.dms.common 12.1.3.0.0 

String substituting 'oracle.jrf.dms.common 12.1.3.0.0 '

 Component : oracle.jrf.dms 12.1.3.0.0 

String substituting 'oracle.jrf.dms 12.1.3.0.0 '

 Component : oracle.xdk.jrf.jaxp 12.1.3.0.0 

String substituting 'oracle.xdk.jrf.jaxp 12.1.3.0.0 '

 Component : oracle.xdk.jrf 12.1.3.0.0 

String substituting 'oracle.xdk.jrf 12.1.3.0.0 '

 Component : oracle.xdk.jrf.fmw 12.1.3.0.0 

String substituting 'oracle.xdk.jrf.fmw 12.1.3.0.0 '

 Component : oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 

String substituting 'oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 '

 Component : oracle.sysman.top.agent 13.1.0.0.0 

String substituting 'oracle.sysman.top.agent 13.1.0.0.0 '

 Component : oracle.sysman.common 13.1.0.0.0 

String substituting 'oracle.sysman.common 13.1.0.0.0 '

 Component : oracle.sysman.sbin 13.1.0.0.0 

String substituting 'oracle.sysman.sbin 13.1.0.0.0 '

 Component : oracle.sysman.emagent.installer 13.1.0.0.0 

String substituting 'oracle.sysman.emagent.installer 13.1.0.0.0 '

 Component : oracle.sysman.darda 8.09.0.1.0 

String substituting 'oracle.sysman.darda 8.09.0.1.0 '

 Component : oracle.jre 1.7.0.9.85 

String substituting 'oracle.jre 1.7.0.9.85 '

 Component : oracle.jdk 1.7.0.9.85 

String substituting 'oracle.jdk 1.7.0.9.85 '

 Component : oracle.ldap.rsf 12.1.3.0.0 

String substituting 'oracle.ldap.rsf 12.1.3.0.0 '

 Component : oracle.buildtools.rsf 11.2.0.3.0 

String substituting 'oracle.buildtools.rsf 11.2.0.3.0 '

 Component : oracle.wsm.common 12.1.3.0.0 

String substituting 'oracle.wsm.common 12.1.3.0.0 '

 Component : oracle.jrf.j2ee 12.1.3.0.0 

String substituting 'oracle.jrf.j2ee 12.1.3.0.0 '

 Component : oracle.opss.core 12.1.3.0.0 

String substituting 'oracle.opss.core 12.1.3.0.0 '

 Component : oracle.sysman.agent.ic 13.1.0.0.0 

String substituting 'oracle.sysman.agent.ic 13.1.0.0.0 '

 Component : oracle.ons 12.1.3.0.0 

String substituting 'oracle.ons 12.1.3.0.0 '

 Component : oracle.http_client 12.1.3.0.0 

String substituting 'oracle.http_client 12.1.3.0.0 '

 Component : oracle.perlint 5.10.0.0.4 

String substituting 'oracle.perlint 5.10.0.0.4 '

 Component : oracle.perlint.expat 2.0.1.0.3 

String substituting 'oracle.perlint.expat 2.0.1.0.3 '

 Component : oracle.perlint.modules 5.10.0.0.4 

String substituting 'oracle.perlint.modules 5.10.0.0.4 '

String substitutions complete

Link pending...

Linking in progress

 Component : oracle.osdt.core 12.1.3.0.0 

Linking 'oracle.osdt.core 12.1.3.0.0 '

 Component : oracle.pki 12.1.3.0.0 

Linking 'oracle.pki 12.1.3.0.0 '

 Component : oracle.rsa.crypto 12.1.3.0.0 

Linking 'oracle.rsa.crypto 12.1.3.0.0 '

 Component : oracle.glcm.logging 1.2.0.0.0 

Linking 'oracle.glcm.logging 1.2.0.0.0 '

 Component : oracle.glcm.comdev 7.4.0.0.0 

Linking 'oracle.glcm.comdev 7.4.0.0.0 '

 Component : oracle.glcm.dependency 1.4.0.0.0 

Linking 'oracle.glcm.dependency 1.4.0.0.0 '

 Component : oracle.glcm.xmldh 3.0.0.0.0 

Linking 'oracle.glcm.xmldh 3.0.0.0.0 '

 Component : oracle.glcm.wizard 7.4.0.0.0 

Linking 'oracle.glcm.wizard 7.4.0.0.0 '

 Component : oracle.glcm.encryption 2.3.0.0.0 

Linking 'oracle.glcm.encryption 2.3.0.0.0 '

 Component : oracle.bali.share 12.1.3.0.0 

Linking 'oracle.bali.share 12.1.3.0.0 '

 Component : oracle.bali.jewt 12.1.3.0.0 

Linking 'oracle.bali.jewt 12.1.3.0.0 '

 Component : oracle.bali.ice 6.1.3.2.1 

Linking 'oracle.bali.ice 6.1.3.2.1 '

 Component : oracle.help.share 12.1.3.0.0 

Linking 'oracle.help.share 12.1.3.0.0 '

 Component : oracle.help.ohj 12.1.3.0.0 

Linking 'oracle.help.ohj 12.1.3.0.0 '

 Component : oracle.nginst.common 13.6.0.0.0 

Linking 'oracle.nginst.common 13.6.0.0.0 '

 Component : oracle.nginst.osp.compstager 13.6.0.0.0 

Linking 'oracle.nginst.osp.compstager 13.6.0.0.0 '

 Component : oracle.glcm.opatch.common.api 13.6.0.0.0 

Linking 'oracle.glcm.opatch.common.api 13.6.0.0.0 '

 Component : oracle.nginst.core 13.6.0.0.0 

Linking 'oracle.nginst.core 13.6.0.0.0 '

 Component : oracle.nginst.thirdparty 13.6.0.0.0 

Linking 'oracle.nginst.thirdparty 13.6.0.0.0 '

 Component : oracle.swd.opatch 13.6.0.0.0 

Linking 'oracle.swd.opatch 13.6.0.0.0 '

 Component : oracle.apache.commons.cli 1.2.0.0.0 

Linking 'oracle.apache.commons.cli 1.2.0.0.0 '

 Component : oracle.apache.commons.compress 1.4.0.0.0 

Linking 'oracle.apache.commons.compress 1.4.0.0.0 '

 Component : oracle.glcm.osys.core 13.6.0.0.0 

Linking 'oracle.glcm.osys.core 13.6.0.0.0 '

 Component : oracle.glcm.oplan.core 13.6.0.0.0 

Linking 'oracle.glcm.oplan.core 13.6.0.0.0 '

 Component : oracle.glcm.opatchauto.core 13.6.0.0.0 

Linking 'oracle.glcm.opatchauto.core 13.6.0.0.0 '

 Component : oracle.jse.dms 12.1.3.0.0 

Linking 'oracle.jse.dms 12.1.3.0.0 '

 Component : oracle.jrf.dms.common 12.1.3.0.0 

Linking 'oracle.jrf.dms.common 12.1.3.0.0 '

 Component : oracle.jrf.dms 12.1.3.0.0 

Linking 'oracle.jrf.dms 12.1.3.0.0 '

 Component : oracle.xdk.jrf.jaxp 12.1.3.0.0 

Linking 'oracle.xdk.jrf.jaxp 12.1.3.0.0 '

 Component : oracle.xdk.jrf 12.1.3.0.0 

Linking 'oracle.xdk.jrf 12.1.3.0.0 '

 Component : oracle.xdk.jrf.fmw 12.1.3.0.0 

Linking 'oracle.xdk.jrf.fmw 12.1.3.0.0 '

 Component : oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 

Linking 'oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 '

 Component : oracle.sysman.top.agent 13.1.0.0.0 

Linking 'oracle.sysman.top.agent 13.1.0.0.0 '

 Component : oracle.sysman.common 13.1.0.0.0 

Linking 'oracle.sysman.common 13.1.0.0.0 '

 Component : oracle.sysman.sbin 13.1.0.0.0 

Linking 'oracle.sysman.sbin 13.1.0.0.0 '

 Component : oracle.sysman.emagent.installer 13.1.0.0.0 

Linking 'oracle.sysman.emagent.installer 13.1.0.0.0 '

 Component : oracle.sysman.darda 8.09.0.1.0 

Linking 'oracle.sysman.darda 8.09.0.1.0 '

 Component : oracle.jre 1.7.0.9.85 

Linking 'oracle.jre 1.7.0.9.85 '

 Component : oracle.jdk 1.7.0.9.85 

Linking 'oracle.jdk 1.7.0.9.85 '

 Component : oracle.ldap.rsf 12.1.3.0.0 

Linking 'oracle.ldap.rsf 12.1.3.0.0 '

 Component : oracle.buildtools.rsf 11.2.0.3.0 

Linking 'oracle.buildtools.rsf 11.2.0.3.0 '

 Component : oracle.wsm.common 12.1.3.0.0 

Linking 'oracle.wsm.common 12.1.3.0.0 '

 Component : oracle.jrf.j2ee 12.1.3.0.0 

Linking 'oracle.jrf.j2ee 12.1.3.0.0 '

 Component : oracle.opss.core 12.1.3.0.0 

Linking 'oracle.opss.core 12.1.3.0.0 '

 Component : oracle.sysman.agent.ic 13.1.0.0.0 

Linking 'oracle.sysman.agent.ic 13.1.0.0.0 '

 Component : oracle.ons 12.1.3.0.0 

Linking 'oracle.ons 12.1.3.0.0 '

 Component : oracle.http_client 12.1.3.0.0 

Linking 'oracle.http_client 12.1.3.0.0 '

 Component : oracle.perlint 5.10.0.0.4 

Linking 'oracle.perlint 5.10.0.0.4 '

 Component : oracle.perlint.expat 2.0.1.0.3 

Linking 'oracle.perlint.expat 2.0.1.0.3 '

 Component : oracle.perlint.modules 5.10.0.0.4 

Linking 'oracle.perlint.modules 5.10.0.0.4 '

Linking in progress

Link successful

Setup pending...

Setup in progress

 Component : oracle.osdt.core 12.1.3.0.0 

Setting up 'oracle.osdt.core 12.1.3.0.0 '

 Component : oracle.pki 12.1.3.0.0 

Setting up 'oracle.pki 12.1.3.0.0 '

 Component : oracle.rsa.crypto 12.1.3.0.0 

Setting up 'oracle.rsa.crypto 12.1.3.0.0 '

 Component : oracle.glcm.logging 1.2.0.0.0 

Setting up 'oracle.glcm.logging 1.2.0.0.0 '

 Component : oracle.glcm.comdev 7.4.0.0.0 

Setting up 'oracle.glcm.comdev 7.4.0.0.0 '

 Component : oracle.glcm.dependency 1.4.0.0.0 

Setting up 'oracle.glcm.dependency 1.4.0.0.0 '

 Component : oracle.glcm.xmldh 3.0.0.0.0 

Setting up 'oracle.glcm.xmldh 3.0.0.0.0 '

 Component : oracle.glcm.wizard 7.4.0.0.0 

Setting up 'oracle.glcm.wizard 7.4.0.0.0 '

 Component : oracle.glcm.encryption 2.3.0.0.0 

Setting up 'oracle.glcm.encryption 2.3.0.0.0 '

 Component : oracle.bali.share 12.1.3.0.0 

Setting up 'oracle.bali.share 12.1.3.0.0 '

 Component : oracle.bali.jewt 12.1.3.0.0 

Setting up 'oracle.bali.jewt 12.1.3.0.0 '

 Component : oracle.bali.ice 6.1.3.2.1 

Setting up 'oracle.bali.ice 6.1.3.2.1 '

 Component : oracle.help.share 12.1.3.0.0 

Setting up 'oracle.help.share 12.1.3.0.0 '

 Component : oracle.help.ohj 12.1.3.0.0 

Setting up 'oracle.help.ohj 12.1.3.0.0 '

 Component : oracle.nginst.common 13.6.0.0.0 

Setting up 'oracle.nginst.common 13.6.0.0.0 '

 Component : oracle.nginst.osp.compstager 13.6.0.0.0 

Setting up 'oracle.nginst.osp.compstager 13.6.0.0.0 '

 Component : oracle.glcm.opatch.common.api 13.6.0.0.0 

Setting up 'oracle.glcm.opatch.common.api 13.6.0.0.0 '

 Component : oracle.nginst.core 13.6.0.0.0 

Setting up 'oracle.nginst.core 13.6.0.0.0 '

registering file(s) under /oui/.globalEnv.properties in deinstall-info.xml

 Component : oracle.nginst.thirdparty 13.6.0.0.0 

Setting up 'oracle.nginst.thirdparty 13.6.0.0.0 '

 Component : oracle.swd.opatch 13.6.0.0.0 

Setting up 'oracle.swd.opatch 13.6.0.0.0 '

 Component : oracle.apache.commons.cli 1.2.0.0.0 

Setting up 'oracle.apache.commons.cli 1.2.0.0.0 '

 Component : oracle.apache.commons.compress 1.4.0.0.0 

Setting up 'oracle.apache.commons.compress 1.4.0.0.0 '

 Component : oracle.glcm.osys.core 13.6.0.0.0 

Setting up 'oracle.glcm.osys.core 13.6.0.0.0 '

 Component : oracle.glcm.oplan.core 13.6.0.0.0 

Setting up 'oracle.glcm.oplan.core 13.6.0.0.0 '

 Component : oracle.glcm.opatchauto.core 13.6.0.0.0 

Setting up 'oracle.glcm.opatchauto.core 13.6.0.0.0 '

 Component : oracle.jse.dms 12.1.3.0.0 

Setting up 'oracle.jse.dms 12.1.3.0.0 '

 Component : oracle.jrf.dms.common 12.1.3.0.0 

Setting up 'oracle.jrf.dms.common 12.1.3.0.0 '

 Component : oracle.jrf.dms 12.1.3.0.0 

Setting up 'oracle.jrf.dms 12.1.3.0.0 '

 Component : oracle.xdk.jrf.jaxp 12.1.3.0.0 

Setting up 'oracle.xdk.jrf.jaxp 12.1.3.0.0 '

 Component : oracle.xdk.jrf 12.1.3.0.0 

Setting up 'oracle.xdk.jrf 12.1.3.0.0 '

 Component : oracle.xdk.jrf.fmw 12.1.3.0.0 

Setting up 'oracle.xdk.jrf.fmw 12.1.3.0.0 '

 Component : oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 

Setting up 'oracle.xdk.jrf.xmlparserv2 12.1.3.0.0 '

 Component : oracle.sysman.top.agent 13.1.0.0.0 

Setting up 'oracle.sysman.top.agent 13.1.0.0.0 '

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/unix/scripts/agentstup.template'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/unix/scripts/agentstup.template'.

changing permission for '/fcubs/backup/agent/em13c/agent_13.1.0.0.0'

spawning 'chmod -R a+rX /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl'

changing permission for '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/EMStage'

updating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/root.sh.template.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/root.sh.template'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/replacebins.sh.template'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/stage/bin/forwarderProxy.template'.

changing permissions for '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/stage/bin/forwarderProxy.template'

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/bin/emtgtctl'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/stage/sysman/config/emd.properties.template'.

updating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/eminstall.info.

spawning '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin/perl /fcubs/backup/agent/em13c/agent_13.1.0.0.0/sysman/admin/scripts/patchUploadTriggers.pl /fcubs/backup/agent/em13c/agent_13.1.0.0.0'

 Component : oracle.sysman.common 13.1.0.0.0 

Setting up 'oracle.sysman.common 13.1.0.0.0 '

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//bin/emctl.pl.template'.

deleting '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//bin/emctl.pl.template'

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//bin/emctl.template'.

changing permissions for '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/bin/emctl'

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//bin/commonenv.template'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//install/unix/scripts/gcroot.sh.template'.

changing permissions for '/fcubs/backup/agent/em13c/agent_13.1.0.0.0//install/unix/scripts/gcroot.sh'

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/bin/runConfig.sh'.

 Component : oracle.sysman.sbin 13.1.0.0.0 

Setting up 'oracle.sysman.sbin 13.1.0.0.0 '

 Component : oracle.sysman.emagent.installer 13.1.0.0.0 

Setting up 'oracle.sysman.emagent.installer 13.1.0.0.0 '

 Component : oracle.sysman.darda 8.09.0.1.0 

Setting up 'oracle.sysman.darda 8.09.0.1.0 '

 Component : oracle.jre 1.7.0.9.85 

Setting up 'oracle.jre 1.7.0.9.85 '

 Component : oracle.jdk 1.7.0.9.85 

Setting up 'oracle.jdk 1.7.0.9.85 '

 Component : oracle.ldap.rsf 12.1.3.0.0 

Setting up 'oracle.ldap.rsf 12.1.3.0.0 '

 Component : oracle.buildtools.rsf 11.2.0.3.0 

Setting up 'oracle.buildtools.rsf 11.2.0.3.0 '

 Component : oracle.wsm.common 12.1.3.0.0 

Setting up 'oracle.wsm.common 12.1.3.0.0 '

 Component : oracle.jrf.j2ee 12.1.3.0.0 

Setting up 'oracle.jrf.j2ee 12.1.3.0.0 '

 Component : oracle.opss.core 12.1.3.0.0 

Setting up 'oracle.opss.core 12.1.3.0.0 '

 Component : oracle.sysman.agent.ic 13.1.0.0.0 

Setting up 'oracle.sysman.agent.ic 13.1.0.0.0 '

 Component : oracle.ons 12.1.3.0.0 

Setting up 'oracle.ons 12.1.3.0.0 '

 Component : oracle.http_client 12.1.3.0.0 

Setting up 'oracle.http_client 12.1.3.0.0 '

 Component : oracle.perlint 5.10.0.0.4 

Setting up 'oracle.perlint 5.10.0.0.4 '

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/c2ph'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/config_data'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/corelist'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/cpan'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/cpan2dist'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/cpanp'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/cpanp-run-perl'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/dbilogstrip'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/dbiprof'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/dbiproxy'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/dprofpp'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/enc2xs'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/find2perl'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/h2ph'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/h2xs'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/instmodsh'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/libnetcfg'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/ora_explain'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/perlbug'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/perldoc'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/perlivp'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/piconv'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pl2pm'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pod2html'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pod2latex'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pod2man'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pod2text'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pod2usage'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/podchecker'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/podselect'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/prove'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/psed'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/pstruct'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/ptar'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/ptardiff'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/s2p'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/shasum'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/splain'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp/xsubpp'.

deleting '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib/5.10.0/aix-thread-multi-64all/Config.pm'

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib_tmp/Config.pm_inst'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib_tmp/Config_heavy.pl_inst'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib_tmp/config.h_inst'.

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib_tmp/perllocal.pod_inst'.

spawning 'rm -rf  /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin_tmp'

spawning 'rm -rf /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/lib_tmp'

 Component : oracle.perlint.expat 2.0.1.0.3 

Setting up 'oracle.perlint.expat 2.0.1.0.3 '

 Component : oracle.perlint.modules 5.10.0.0.4 

Setting up 'oracle.perlint.modules 5.10.0.0.4 '

instantiating '/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/modules_lib_tmp/mk.pm'.

spawning 'rm -rf /fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/modules_lib_tmp'

Setup successful

Save inventory pending...

Saving inventory
.................. 68%

Saving inventory complete
.................. 69%

Configuration complete
Logs successfully copied to /oracle/app/oraInventory/logs.
-e  Agent Software install completed 

Creating symlink /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk/bin /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jdk/bin
Executing command to check/apply patches if exist in agenthome.....
/fcubs/backup/agent/em13c/agent_13.1.0.0.0/perl/bin/perl /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/oneoffs/apply_NewOneoffs.pl /fcubs/backup/agent/em13c/agent_13.1.0.0.0 true
The ORACLE HOME is /fcubs/backup/agent/em13c/agent_13.1.0.0.0The install isLocal is trueThe command is opatch napply -invPtrLoc /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oraInst.loc -silent   -local  

 Unjarring the oneoff 18421945.zip ...
 /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk/bin/jar xvf /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/oneoffs/agent/18421945.zip 
  created: 18421945/
  inflated: 18421945/README.txt
  created: 18421945/etc/
  created: 18421945/etc/xml/
  inflated: 18421945/etc/xml/GenericActions.xml
  inflated: 18421945/etc/xml/ShiphomeDirectoryStructure.xml
  created: 18421945/etc/config/
  inflated: 18421945/etc/config/inventory.xml
  inflated: 18421945/etc/config/actions.xml
  created: 18421945/files/
  created: 18421945/files/jdbc/
  created: 18421945/files/jdbc/lib/
  created: 18421945/files/jdbc/lib/ojdbc6dms.jar/
  created: 18421945/files/jdbc/lib/ojdbc6dms.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc6dms.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc6dms.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc6dms.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc6dms.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc6.jar/
  created: 18421945/files/jdbc/lib/ojdbc6.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc6.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc6.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc6.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc6.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/
  created: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc6dms_g.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc5_g.jar/
  created: 18421945/files/jdbc/lib/ojdbc5_g.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc5_g.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc5_g.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc5_g.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc5_g.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/
  created: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc5dms_g.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc5dms.jar/
  created: 18421945/files/jdbc/lib/ojdbc5dms.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc5dms.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc5dms.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc5dms.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc5dms.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc5.jar/
  created: 18421945/files/jdbc/lib/ojdbc5.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc5.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc5.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc5.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc5.jar/oracle/jdbc/driver/NTFConnection.class
  created: 18421945/files/jdbc/lib/ojdbc6_g.jar/
  created: 18421945/files/jdbc/lib/ojdbc6_g.jar/oracle/
  created: 18421945/files/jdbc/lib/ojdbc6_g.jar/oracle/jdbc/
  created: 18421945/files/jdbc/lib/ojdbc6_g.jar/oracle/jdbc/driver/
  inflated: 18421945/files/jdbc/lib/ojdbc6_g.jar/oracle/jdbc/driver/NTFListener.class
  inflated: 18421945/files/jdbc/lib/ojdbc6_g.jar/oracle/jdbc/driver/NTFConnection.class
patches exist in /fcubs/backup/agent/em13c/agent_13.1.0.0.0 

 Applying opatch for the oneoffs 18421945 ...
 /fcubs/backup/agent/em13c/agent_13.1.0.0.0/OPatch/opatch napply -invPtrLoc /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oraInst.loc -silent   -local  -oh /fcubs/backup/agent/em13c/agent_13.1.0.0.0 -phBaseFile /fcubs/backup/agent/em13c/agent_13.1.0.0.0/patch.txt 
Oracle Interim Patch Installer version 13.6.0.0.0
Copyright (c) 2023, Oracle Corporation.  All rights reserved.


Oracle Home       : /fcubs/backup/agent/em13c/agent_13.1.0.0.0
Central Inventory : /oracle/app/oraInventory
   from           : /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oraInst.loc
OPatch version    : 13.6.0.0.0
OUI version       : 13.6.0.0.0
Log file location : /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/opatch/opatch2023-06-14_15-28-06PM_1.log


OPatch detects the Middleware Home as "/fcubs/backup/agent/em13c"

Verifying environment and performing prerequisite checks...
OPatch continues with these patches:   18421945  

Do you want to proceed? [y|n]
Y (auto-answered by -silent)
User Responded with: Y
All checks passed.
Backing up files...
Applying interim patch '18421945' to OH '/fcubs/backup/agent/em13c/agent_13.1.0.0.0'

Patching component oracle.sysman.agent.ic, 13.1.0.0.0...
Patch 18421945 successfully applied.
Log file location: /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/opatch/opatch2023-06-14_15-28-06PM_1.log

OPatch succeeded.

 Finished one-offs apply... 

 Deleting the files... 

 Finished deleting the above files... 
Copying Install logs to /fcubs/backup/agent/em13c/agent_13.1.0.0.0/cfgtoollogs/agentDeploy .....
-e Entered Post Install...

Relaxing execute  permission for other users  on /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install for bug#20005612
oracle.sysman.oh|13.1.0.0.0| |agentPlugin
oracle.sysman.oh|13.1.0.0.0| |discoveryPlugin
/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk/jre/bin/java -classpath /fcubs/backup/agent/em13c/agent_13.1.0.0.0/jlib/agentInstaller.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/OraInstaller.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/com.oracle.cie.oui-common_12.4.0.0.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/com.oracle.cie.ora-installer_12.4.0.0.jar oracle.sysman.agent.installer.AgentPluginInstaller /fcubs/backup/agent/em13c/agent_13.1.0.0.0 /fcubs/backup/agent/em13c/plugins 
/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oracle_common/jdk/jre/bin/java -classpath /fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/OraInstaller.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/oui/modules/emCfg.jar:/fcubs/backup/agent/em13c/agent_13.1.0.0.0/jlib/agentInstaller.jar oracle.sysman.agent.installer.AgentFreshInstaller /fcubs/backup/agent/em13c/agent_13.1.0.0.0 /fcubs/backup/agent/em13c/agent_inst /fcubs/backup/agent/em13c RESPONSE_FILE=/fcubs/backup/agent/em13c/agentInstall.rsp  AGENT_BASE_DIR=/fcubs/backup/agent/em13c RESPONSE_FILE=/fcubs/backup/agent/em13c/agent.rsp ORACLE_HOSTNAME=mcbdbdrc03.bankmuamalat.co.id 
The AgentFreshInstaller is starting now
Oraclehome : ../fcubs/backup/agent/em13c/agent_13.1.0.0.0
InstanceHome : /fcubs/backup/agent/em13c/agent_inst
Agent Base Directory : /fcubs/backup/agent/em13c
The oraclehome /fcubs/backup/agent/em13c/agent_13.1.0.0.0
Writing the following contents into /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/oragchomelist
/fcubs/backup/agent/em13c/agent_13.1.0.0.0:/fcubs/backup/agent/em13c/agent_inst
Creating directory /fcubs/backup/agent/em13c/agent_13.1.0.0.0/install/tmp completed successfully.
File /etc/oragchomelist exists.
File /etc/oragchomelist is writable.
Index :-1 for line : /opt/emagent/core/12.1.0.5.0:/opt/emagent/agent_inst
Appending the following contents : /fcubs/backup/agent/em13c/agent_13.1.0.0.0:/fcubs/backup/agent/em13c/agent_inst to file:/etc/oragchomelist
The value of chainInstall : false forceConfigure : true skipValidation : false
Validated the oms host and port :- 10.55.60.193----4903
Getting Inet Addresses for host mcbdbdrc03
SEVERE: 
Executing agent install prerequisites...
Validated the agent port :- ----3872
shared agent value is :false
Agent Mode is None
Agent Configuration completed successfully
The following configuration scripts need to be executed as the "root" user. Root script to run : /fcubs/backup/agent/em13c/agent_13.1.0.0.0/root.sh
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Waiting for agent targets to get promoted...
Promoting agent and its related targets to Management Agent failed
Fix the cause of the error and retry the operation (or) manually run the following commands on the remote host
/fcubs/backup/agent/em13c/agent_inst/bin/emctl start agent
/fcubs/backup/agent/em13c/agent_inst/bin/emctl config agent addinternaltargets

