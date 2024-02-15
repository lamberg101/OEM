Oracle Management Agent 13c Release 1 (13.1.0.0.0)
Patch for Bug# 23638365
Platform: Generic
Released: Dec 06, 2016

This document describes the following:
-	Bugs Fixed by This Patch
-	Applying Agent Patches
-	Appendix A: Manually Applying Agent Patches


1 Bugs Fixed by This Patch
--------------------------------
The following are the bugs fixed by this patch:

23638365 - Using SSH keys in named credential will show error "Algorithm negotiation fail" 


2 Applying Agent Patches
------------------------------

Note: Please apply a patch for 24308442 on the AGENT side before you apply this patch.

To apply agent patches, follow these steps:

1.	In Cloud Control, from the Enterprise menu, select Patching and Provisioning, and then click Patches and Updates.

2.	On the Patches and Updates page, in the Patch Search Region, enter the 23638365, and click Search.

3.	Select the patch, and from the context menu click Add to a Plan, and select Add to New.

4.	In the Add Patch to Plan dialog box, enter a unique name for the plan, and click the search icon to view the list of targets reporting to the OMS running on your host. From the list, select the agent targets (or group of targets) that need to be patched. Ensure that you add atleast one target of type agent, and then click Create Plan. 

5.	On the Patches and Updates page, in the Plans region, click the Patch Plan you created in the previous step. Alternatively, select the Patch Plan, and from the context menu, click View.

6.	In the Create Plan wizard, on the Plan Information page, in the Overview section, validate the Patch Plan name. You can choose to edit it if you want.
(Optional) Select a date and time when you want to deploy the Patch Plan, and enter a short description to describe the Patch Plan.

7.	Click Next.

8.	On the Patches page, review the patches added to the Patch Plan.

9.	Click Next.

10.	In the Deployment Options page, do the following:

In the Where to Stage section, retain the default location (%emd_emstagedir%)  available on the target machine, or edit the Stage Location to provide a new location for staging the Agent patches.
In the Oracle Home Credentials section, select Oracle Home Preferred Credentials if you have already set them earlier. You can otherwise click Override Oracle Home Preferred Credentials to set the Normal Oracle Home Credentials and Privileged Oracle Home Credentials, to access the Oracle home of the target.

11.	Click Next.

12.	On the Validation page, click Analyze to check for conflicts. If there are conflicts, then review the issues, and resolve it according to the correspnding solutions available on the page. After resolving the issue, click Re-Analyze.

13.	Click Next.

14.	On the Review & Deploy page, review the details you have provided for the patch plan, then click Deploy.


3 Appendix A: Manually Applying Agent Patches
---------------------------------------------------------------------------
This appendix covers the following: 
-	Prerequisites for Manually Applying or Deinstalling Agent Patches
-	Manually Applying Agent Patches

3.1 Prerequisites for Manually Applying Agent Patches
----------------------------------------------------------------------------------
Before you apply agent patches, ensure that you meet the following requirements:

1.	Ensure that the Oracle Management Agent (Management Agent) on which you are installing the patch or from which you are rolling back the patch is Oracle Management Agent 13c Release 1 (13.1.0.0.0).

2.	Ensure that you have the latest version of OPatch. 
If you do not have the latest version, then follow the instructions outlined in the My Oracle Support note 224346.1 available at:
https://support.oracle.com/CSP/main/article?cmd=show&type=NOT&id=224346.1 

3.	Ensure that you set the ORACLE_HOME environment variable to agent core home as follows:
-	For standalone agent: <%installation_base_directory%>/agent_13.1.0.0.0
-	For an agent that ships with the OMS: <%middleware_home%>/agent/agent_13.1.0.0.0

4.	Ensure that you set the PATH environment variable to include the location of the unzip executable, and the <ORACLE_HOME>/bin and the <ORACLE_HOME>/OPatch	 directories present in the Oracle home of the Management Agent.

5.	Shut down the Management Agent by running the following command:
	$ emctl stop agent

Note: If the Management Agent is installed on a cluster, then ensure that you shut down the Management Agents on the nodes on which you want to apply the patch.

3.2 Manually Applying Agent Patches
-------------------------------------------
To manually apply agent patches, follow these steps:

1.	Run the following command to stop the Management Agent:
$   	$ORACLE_HOME/bin/emctl stop agent
/oracle/app/oracle/agent/agent_13.1.0.0.0/bin/emctl status agent

2.	Maintain a location for storing the contents of the patch ZIP file. In the rest of the document, this location (absolute path) is referred to as <PATCH_TOP_DIR>.

3.	Extract the contents of the patch ZIP file to the location you created in Step (1). To do so, run the following command:
$   	unzip -d <PATCH_TOP_DIR> p23638365_13100160816_Generic.zip

4.	Navigate to the <PATCH_TOP_DIR>/23638365 directory:
$   	cd <PATCH_TOP_DIR>/23638365

5.	Run the following commands to install the patch.
$	$ORACLE_HOME/OPatch/opatch apply
/oracle/app/oracle/agent/agent_13.1.0.0.0/OPatch/opatch apply
6.	Start the Management Agent by running the following command:
$   	$ORACLE_HOME/bin/emctl start agent

Note: If the Management Agent is installed on a cluster, then ensure that you start the Management Agent on all the nodes of the cluster.


4.3 Manually Deinstalling Agent Patches
-----------------------------------------------
To manually deinstall agent patches, follow these steps:

1.      Navigate to the following location within the Oracle home of the
Management Agent, and run the command to stop the Management Agent:
$       $ORACLE_HOME/bin/emctl stop agent

Note: If the Management Agent is installed on a cluster, then ensure that you
stop the Management Agent on all the nodes of the cluster.

2.      Deinstall the patch by running the following command:
$       $ORACLE_HOME/OPatch/opatch rollback -id 23638365 

3.      Navigate to the following location within the instance home of the
Management Agent, and run the command to start the Management Agent:
$       $ORACLE_HOME/bin/emctl start agent

Note: If the Management Agent is installed on a cluster, then ensure that you
start the Management Agent on all the nodes of the cluster.

---------------------------------------------------------------------
Copyright 2016, Oracle and/or its affiliates. All rights reserved. 
---------------------------------------------------------------------
