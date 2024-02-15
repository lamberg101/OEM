install OMC
-------------

[oracle@exa82absdpdbadm01 ~]$ more omc_oracle_asm_cluster_sample_creds.json
{"credentials": [
                   {"id":"ASMCredsNormal", "name":"ASMCredsMonitoring", "credType":"ASMCreds",
                    "properties":[{"name":"user_name", "value":"CLEAR[asmsnmp]"},
                                  {"name":"password", "value":"CLEAR[welcome1]"},
                                  {"name":"role", "value":"CLEAR[SYSDBA]"}]

                   }

                ]

}



[oracle@exa82absdpdbadm01 ~]$ cat omc_asm_exa82absdpdb1.json
{
  "entities":
    [
       {
         "name":"exa82absd-asm1",
         "type":"omc_oracle_asm",
         "displayName":"exa82absd-asm1",
         "timezoneRegion":"Asia/Bangkok",
         "credentialRefs":["ASMCredsNormal"],
         "properties":{
            "host_name":{    
  			   "displayName":"host_name",
  			   "value":"exa82absdpdbadm01.telkomsel.co.id"
             },
             "machine_name":{
	  	        "displayName":"machine_name",
                   "value":"exa82absdpdbadm01.telkomsel.co.id"
             },

             "oracle_home":{
	 		  "displayName":"oracle_home",
                  "value":"/u01/app/19.0.0.0/grid"
             },
             "port":{
                   "displayName":"port",
                   "value":"1521"
             },
             "protocol":{
                    "displayName":"protocol",
                    "value":"TCP"
             },
             "sid":{
                 "displayName":"sid",
                 "value":"+ASM1"
             },
             "capability":{
                     "displayName":"capability",
                     "value":"monitoring"
             }
           }
        }
    ]

}



running add entity nya:
-----------------------
cd /apps/omc_agent/agent_inst/bin
./omcli add_entity agent /home/oracle/omc_asm_exa82absdpdb1.json -credential_file /home/oracle/omc_oracle_asm_cluster_sample_creds.json


untuk Check process nya:
---------------------
[oracle@exa82absdpdbadm01 bin]$ ./omcli status_entity agent /home/oracle/omc_asm_exa82absdpdb1.json -verbose
Oracle Management Cloud Agent  
Copyright (c) 1996, 2021 Oracle Corporation.  All rights reserved.
omc_oracle_asm.exa82absd-asm1 : AGENT:entity successfully added - ( Entity count: 3  Validation checks: All checks passed )
        omc_oracle_asm_instance.+ASM2_exa82absdpdbadm02.telkomsel.co.id
        omc_oracle_asm_instance.+ASM1_exa82absdpdbadm01.telkomsel.co.id
Details:
Check 1 : Validate if parameter "Host Name (host_name)" is provided.
Status  : SUCCESS
Check 2 : Validate if parameter "Port (port)" is provided.
Status  : SUCCESS
Check 3 : Validate if parameter "SID (sid), Service Name (service_name)" is provided.
Status  : SUCCESS
Check 4 : Validate if parameter "Protocol (protocol)" is provided.
Status  : SUCCESS
Check 5 : Validate if credential parameter "Username (user_name)" is provided.
Status  : SUCCESS
Check 6 : Validate if credential parameter "Password (password)" is provided.
Status  : SUCCESS
Check 7 : Validate if credential parameter "role" is provided.
Status  : SUCCESS
Check 8 : Validate credential name "ASMCredsMonitoring".
Status  : SUCCESS
Check 9 : Validate credential type "ASMCreds".
Status  : SUCCESS
Check 10: Validate ASM connectivity
Status  : SUCCESS
Check 11: Perform entity discovery
Status  : SUCCESS

    omc_oracle_asm_instance.+ASM2_exa82absdpdbadm02.telkomsel.co.id        

    omc_oracle_asm_instance.+ASM1_exa82absdpdbadm01.telkomsel.co.id   

untuk Check list target nya:
-------------------------
[oracle@exa82absdpdbadm01 bin]$ ./omcli config agent listtargets
Oracle Management Cloud Agent  
Copyright (c) 1996, 2021 Oracle Corporation.  All rights reserved.
[exa82absdpdbadm01.telkomsel.co.id:4459, Lama]
[exa82absdpdbadm01.telkomsel.co.id, omc_host_linux]
[exa82absdpdbadm01.telkomsel.co.id, omc_cluster_node]
[exa82absdpdbadm02.telkomsel.co.id, omc_cluster_node]
[exa82absdp_SCAN_LISTENER-LISTENER_SCAN1, omc_oracle_db_listener]
[exa82absdp_SCAN_LISTENER-LISTENER_SCAN2, omc_oracle_db_listener]
[exa82absdp_SCAN_LISTENER-LISTENER_SCAN3, omc_oracle_db_listener]
[exa82absdpdbadm02.telkomsel.co.id_LISTENER, omc_oracle_db_listener]
[exa82absdpdbadm01.telkomsel.co.id_LISTENER, omc_oracle_db_listener]
[OPPOM_BSD, omc_oracle_db_system]
[OPPOM_BSD/OPPOMNEW2, omc_oracle_db_instance]
[exa82absdp, omc_oracle_clusterware]
[OPPOM_BSD/OPPOMNEW1, omc_oracle_db_instance]
[OPPOM_BSD, omc_oracle_db]
[exa82absdp_SCAN_LISTENER, omc_oracle_db_listener_cluster]
[+ASM1_exa82absdpdbadm01.telkomsel.co.id, omc_oracle_asm_instance]
[+ASM2_exa82absdpdbadm02.telkomsel.co.id, omc_oracle_asm_instance]
[exa82absd-asm1, omc_oracle_asm]
