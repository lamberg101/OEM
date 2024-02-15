[oracle@bmioem image]$ cd
[oracle@bmioem ~]$ cd /oracle/app/oracle/middleware/bin
[oracle@bmioem bin]$ ./emcli get_agentimage -destination=/oracle/source/image -platform="IBM AIX on POWER Systems (64-bit)"
 === Partition Detail ===
Space free : 125 GB
Space required : 1 GB
Check the logs at /oracle/app/oracle/gc_inst/em/EMGC_OMS1/sysman/emcli/setup/.emcli/get_agentimage_2023-06-14_13-51-51-PM.log
Downloading /oracle/source/image/13.1.0.0.0_AgentCore_212.zip
File saved as /oracle/source/image/13.1.0.0.0_AgentCore_212.zip
Downloading /oracle/source/image/13.1.0.0.0_Plugins_212.zip
File saved as /oracle/source/image/13.1.0.0.0_Plugins_212.zip
Downloading /oracle/source/image/unzip
File saved as /oracle/source/image/unzip
Executing command: /oracle/source/image/unzip /oracle/source/image/13.1.0.0.0_Plugins_212.zip -d /oracle/source/image
ERROR: Command /oracle/source/image/unzip /oracle/source/image/13.1.0.0.0_Plugins_212.zip -d /oracle/source/image execution failed.
Extracting plugins failed.
If your agent image platform and the emcli client setup is on a different platform then you need to set the environment variable UNZIP_LOC to the absolute path of unzip utility location  which is greater than or equal to version 6.0.
Example: setenv UNZIP_LOC /usr/local/bin
[oracle@bmioem bin]$