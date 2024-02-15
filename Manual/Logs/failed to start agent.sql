
oracle@mcbdbdrc03> # ./emctl status agent
Oracle Enterprise Manager Cloud Control 13c Release 1
Copyright (c) 1996, 2015 Oracle Corporation.  All rights reserved.
---------------------------------------------------------------
Agent is Not Running
oracle@mcbdbdrc03> # ./emctl start agent
Oracle Enterprise Manager Cloud Control 13c Release 1
Copyright (c) 1996, 2015 Oracle Corporation.  All rights reserved.
Starting agent ............ failed.
HTTP Listener failed at Startup
Possible port conflict on port(3872): Retrying the operation.......
Failed to start the agent after 5 attempts.  Please check that the port(3872) is available.
Consult emctl.log and emagent.nohup in: /fcubs/backup/agent/em13c/agent_inst/sysman/log
oracle@mcbdbdrc03> # cd /fcubs/backup/agent/em13c/agent_inst/sysman/log
