
Are the required packages installed on the current operating system?	

Warning	Some required packages are missing.	

Checking for make-3.82-21; found make-1:3.82-24.el7-x86_64. Passed Checking for binutils-2.23; found binutils-2.27-44.base.0.1.el7-x86_64. Passed Checking for gcc-4.8.2-16; Not found. Failed	The Management Agent installation or upgrade failed because some required packages were missing or were of a lower version. Install the required version or a higher version of these packages, and then retry the operation.



You can either set the "oracle.sysman.prov.agentpush.enablePty" property to true 
in the "/oracle/app/oracle/middleware/sysman/prov/agentpush/agentpush.properties" file, which is present on the OMS host, 
pass -S argument to the sudo command, or enable the "visiblepw" flag in the sudoers file.

You can also ignore this warning and continue in which case the root.sh, 
any preinstallation or postinstallation scripts specified with run as root enabled will not be run and you have to run them manually after installation.



---------

Installation and Configuration	Failed	Execution of command 
/app/em13c/ADATMP_2023-03-06_13-38-40-PM/agentDeploy.sh -ignorePrereqs 
ORACLE_HOSTNAME=uat01-mcb-app 
AGENT_BASE_DIR=/app/em13c 
OMS_HOST=bmioem 
EM_UPLOAD_PORT=4903 
AGENT_INSTANCE_HOME=/app/em13c/agent_inst 
b_doDiscovery=false 
START_AGENT=false 
b_forceInstCheck=true -force 
AGENT_PORT=3872 
on host uat01-mcb-app Failed	Error Message:Not Available

Exit Code :0	Fix the cause of the error and retry the operation


Execution of command 
/oracle/app/em13c/ADATMP_2023-03-06_15-52-15-PM/agentDeploy.sh -ignorePrereqs 
ORACLE_HOSTNAME=FUTMCB 
AGENT_BASE_DIR=/oracle/app/em13c 
OMS_HOST=bmioem 
EM_UPLOAD_PORT=4903 
AGENT_INSTANCE_HOME=/oracle/app/em13c/agent_inst 
b_doDiscovery=false 
START_AGENT=false 
b_forceInstCheck=true -force 
AGENT_PORT=3872

 on host FUTMCB Failed

 Error Message: 
 The Oracle Management Server (OMS) host and port specified via OMS_HOST and EM_UPLOAD_PORT is not available. 
 Pass in a valid hostname and port number for the OMS to successfully deploy the agent.
