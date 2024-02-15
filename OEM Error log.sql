Installation and Configuration	
Failed	Execution of command /oracle/app/em13c/ADATMP_2023-03-08_13-48-10-PM/agentDeploy.sh -ignorePrereqs 
ORACLE_HOSTNAME=FUTMCB 
AGENT_BASE_DIR=/oracle/app/em13c 
OMS_HOST=bmioem 
EM_UPLOAD_PORT=4903 
AGENT_INSTANCE_HOME=/oracle/app/em13c/agent_inst b_doDiscovery=false 
START_AGENT=false 
b_forceInstCheck=true -force 
AGENT_PORT=3872 on host FUTMCB Failed	


Error Message: 
The Oracle Management Server (OMS) EM_UPLOAD_PORT is not available. 
Pass in a valid hostname and port number for the OMS to successfully deploy the agent. 





==============================================================================================================================

Installation and Configuration	Failed	Execution of command /app/em13c/ADATMP_2023-04-10_15-27-24-PM/agentDeploy.sh -ignorePrereqs 
ORACLE_HOSTNAME=uat01-mcb-app.bankmuamalat.co.id AGENT_BASE_DIR=/app/em13c 
OMS_HOST=bmioem EM_UPLOAD_PORT=4903 AGENT_INSTANCE_HOME=/app/em13c/agent_inst 
b_doDiscovery=false START_AGENT=false b_forceInstCheck=true -force AGENT_PORT=3872 
on host uat01-mcb-app.bankmuamalat.co.id Failed	Error Message:Not Available

Exit Code :0	Fix the cause of the error and retry the operation


err log uat app:
/oracle/app/oracle/gc_inst/em/EMGC_OMS1/sysman/agentpush/2023-04-10_15-27-24-PM/applogs/uat01-mcb-app.bankmuamalat.co.id_deploy.log

==============================================================================================================================




Latest error log:
/oracle/app/oracle/gc_inst/em/EMGC_OMS1/sysman/agentpush/2023-05-12_17-29-21-PM/applogs/mcbdbconsuat_deploy.log



UAT ERROR
Execution of command /oracle/app/em13c/ADATMP_2023-04-03_15-35-40-PM/agentDeploy.sh -ignorePrereqs ORACLE_HOSTNAME=mcbdbconsuat AGENT_BASE_DIR=/oracle/app/em13c OMS_HOST=bmioem EM_UPLOAD_PORT=4903 AGENT_INSTANCE_HOME=/oracle/app/em13c/agent_inst b_doDiscovery=false START_AGENT=false b_forceInstCheck=true -force AGENT_PORT=3872 on host mcbdbconsuat Failed

Error Message: The Oracle Management Server (OMS) host and port specified via OMS_HOST and EM_UPLOAD_PORT is not available. Pass in a valid hostname and port number for the OMS to successfully deploy the agent. 

Exit Code :1

Fix the cause of the error and retry the operation


---

Execution of command (cd /oracle/app/em13c/agent_13.1.0.0.0/cfgtoollogs && /oracle/app/em13c/agent_13.1.0.0.0/bin/zip -q -r /tmp/remoteArchivesmcbdbconsuat2023-04-03_03-46-32-PM.zip * -x oui/**\* OPatch/**\* oracle_common/**\*) on host mcbdbconsuat Failed

Error Message:/bin/sh: /*****/app/em13c/agent_13.1.0.0.0/bin/zip: not found. 

Exit Code :127

Not Available


