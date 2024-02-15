#!/bin/sh
#
# $Header: emagent/install/unix/agentDeploy.sh /main/108 2015/12/07 09:06:25 dgpatil Exp $
#
# agentDeploy.sh
#
# Copyright (c) 2010, 2015, Oracle and/or its affiliates. All rights reserved.
#
#    NAME
#      agentDeploy.sh - <one-line expansion of the name>
#
#    DESCRIPTION
#      This script is instrumental in all kinds of agent deployment be it install/upgrade
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
#    MODIFIED   (MM/DD/YY)
#    vbhaagav    06/30/15 - XbranchMerge vbhaagav_bug-20703480 from
#                           st_emgc_pt-13.1mstr
#    vbhaagav    05/18/15 - XbranchMerge vbhaagav_bug-20913150 from
#    vbhaagav    05/20/15 - XbranchMerge vbhaagav_dplchgs from
#                           st_emgc_pt-13.1mstr
#    ssanklec    11/11/14 - quoting the strings when comparing
#    sallam      09/11/13 - 13C changes
#    absuresh    04/26/10 - Creation
#    vbhaagav    02/23/15 - Bug 20428980 agent clone failing "cannot find agentcore.bin"
#    vbhaagav    02/23/15 - Bug 20442645 AgentDeploy.sh needs to provide a way for user defined scarchpath
#    vbhaagav    02/23/15 - Bug 20551066 Push agent from HP OM1 machine to OMS2 machine failed in 150210.1900 label
#    vbhaagav    02/23/15 - Bug 20575130 - Flag to ignore base dir prereq is missing for agent install
#    vbhaagav    02/20/15 -  Bug#20569508
#    vbhaagav    02/12/15 -  bug#20445253
#    vbhaagav    04/8/15  -  Bug#20703480 - there are no prereqs to prevent agent deployment without plugins
#    vbhaagav    08/3/15  -  Bug 21544297 - 13c Cross Platform Push Agent fails on solarisX64
#    vbhaagav    08/12/15 -  Bug 19514872 - PID: 12707943, Permission constraint of 750 in EMDROOT/sysman dir
#    vbhaagav	 10/12/15 -  Bug 21963403 - agent_13.1.0.0.0/bin 750 permission caused nmocat to fail with non-agent user
UNAME=/bin/uname
GETCONF=/usr/bin/getconf
LN=/bin/ln
AWK=/usr/bin/awk
CAT=/usr/bin/cat
CHOWN="/usr/bin/chown"
CHMOD="/usr/bin/chmod"
CHMODR="/usr/bin/chmod -R"
CP=/usr/bin/cp
ECHO=/usr/bin/echo
MKDIR=/usr/bin/mkdir
TEE=/usr/bin/tee
RM=/bin/rm
MV=/bin/mv
GREP=/usr/bin/grep
CUT=/bin/cut
SED=/usr/bin/sed
DF=/bin/df
TR=/usr/bin/tr

PLATFORM=`uname`

if [ "${PLATFORM}" = "Linux" ] ; then
  CAT=/bin/cat
  CHOWN=/bin/chown
  CHMOD=/bin/chmod
  CHMODR="/bin/chmod -R"
  CP=/bin/cp
  ECHO=/bin/echo
  MKDIR=/bin/mkdir
  GREP=/bin/grep
  if [ ! -f $CUT ] ; then
     CUT=/usr/bin/cut
  fi
  SED=/bin/sed
fi

if [ "${PLATFORM}" = "SunOS" ] ; then
   GREP=/usr/xpg4/bin/grep
fi

if [ "${PLATFORM}" = "Darwin" ] ; then
  CAT=/bin/cat
  CHOWN="/usr/sbin/chown"
  CHMOD="/bin/chmod"
  CHMODR="/bin/chmod -R"
  CP=/bin/cp
  ECHO=/bin/echo
  MKDIR=/bin/mkdir
  CUT=/usr/bin/cut
fi

agentBaseDir=""
instHome=""
hostname=""
hostnameswitch=""
oracle_home_name=""
invswitch=""
logDir=""
args=$*
checkBaseFlag=FALSE
checkArchiveFlag=FALSE
agentMode=NONE
timestamp=`date +%F`_`date +%H_%M_%S`
idx=0
idx1=0
idx2=0
rspLoc=""
umask 022
upgradeUsage()
{
        $ECHO "Usage : agentDeploy.sh AGENT_BASE_DIR AGENT_INSTANCE_HOME OLD_AGENT_VERSION OLDHOME [RESPONSE_FILE -prereqOnly -softwareOnly -invPtrLoc -help -debug -configOnly -ignorePrereqs -noRollBack PLUGIN_RSPFILE PROPERTIES_FILE]"
        $ECHO ""
        $ECHO -e "\tAGENT_BASE_DIR              - Agent base directory location which is same as the old agent install"
        $ECHO -e "\tRESPONSE_FILE               - Response file location"
        $ECHO -e "\tAGENT_INSTANCE_HOME - Agent instance home is the location of agent state directory"
        $ECHO -e "\tOLD_AGENT_VERSION           - Version from which the agent is getting upgraded"
        $ECHO -e "\tOLDHOME                     - Old Agent home location "
        $ECHO -e "\tPLUGIN_RSPFILE       - Response file location used for plugin configuration"
        $ECHO -e "\tPROPERTIES_FILE     - Agent properties file location that contains the property name and property value which will be set during the deployment"
        $ECHO -e "\t-prereqOnly         - Agent installer will be invoked in prereq mode"
        $ECHO -e "\t-softwareOnly               - Installs only the files"
        $ECHO -e "\t-invPtrLoc          - Inventory pointer location file"
        $ECHO -e "\t-help                       - Usage"
        $ECHO -e "\t-debug                      - More debug messages will be logged\n"
        $ECHO -e "\t-configOnly         - Performs agent configuration only"
        $ECHO -e "\t-forceConfigure             - Performs agent configuration even if oms is unavailable"
        $ECHO -e "\t-ignorePrereqs              - Skips the agent prereqs"
        $ECHO -e "Example1:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent AGENT_INSTANCE_HOME=/scratch/agent/agent_inst PLUGIN_RSPFILE=/scratch/plugin.txt\n\tThis command is expected to do the complete agent and plugin upgrade install and configuration with the provided inputs.\n"
        $ECHO -e "Example2:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent AGENT_INSTANCE_HOME=/scratch/agent/agent_inst PLUGIN_RSPFILE=/scratch/plugin.txt\n\tThis command is expected to do the complete agent and plugin upgrade configuration with the provided inputs.\n"
        $ECHO -e "Example3:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent PLUGIN_RSPFILE=/scratch/plugin.txt PROPERTIES_FILE=/scratch/agent.properties\n\t Let's say the content of the /scratch/agent.properties file is enableAutoTuning=false, then this command with deploy and configure the agent with the enableAutoTuning property set."
}
freshUsage()
{
        $ECHO "Usage : agentDeploy.sh AGENT_BASE_DIR OMS_HOST EM_UPLOAD_PORT [AGENT_REGISTRATION_PASSWORD RESPONSE_FILE AGENT_INSTANCE_HOME -prereqOnly -softwareOnly -invPtrLoc -help -debug -configOnly -ignorePrereqs -noRollBack -executeRootsh PROPERTIES_FILE]"
        $ECHO ""
        $ECHO -e "\tAGENT_BASE_DIR              - Agent base directory location"
        $ECHO -e "\tOMS_HOST            - OMS Hostname"
        $ECHO -e "\tEM_UPLOAD_PORT              - OMS Upload Port"
        $ECHO -e "\tAGENT_REGISTRATION_PASSWORD  - Agent registration password to secure the agent"

        $ECHO -e "\tRESPONSE_FILE               - Response file location"
        $ECHO -e "\tAGENT_INSTANCE_HOME - Agent instance home is the location of agent state directory"
        $ECHO -e "\tPLUGIN_RSPFILE       - Response file location used for plugin configuration"
        $ECHO -e "\tPROPERTIES_FILE     - Agent properties file location that contains the property name and property value which will be set during the deployment"
        $ECHO -e "\ts_agentHomeName     - Customized agent home name, if not passed default home name will be assigned"
        $ECHO -e "\t-prereqOnly         - Agent installer will be invoked in prereq mode"
        $ECHO -e "\t-softwareOnly               - Installs only the files"
        $ECHO -e "\t-invPtrLoc          - Inventory pointer location file"
        $ECHO -e "\t-help                       - Usage"
        $ECHO -e "\t-debug                      - More debug messages will be logged\n"
        $ECHO -e "\t-configOnly         - Performs agent configuration only"
        $ECHO -e "\t-forceConfigure             - Performs agent configuration even if oms is unavailable"
        $ECHO -e "\t-ignorePrereqs              - Skips the agent prereqs"
	$ECHO -e "\t-LOG_DIR                    - Customize log location by passing LOG_DIR=/scratch/log"
        $ECHO -e "Example1:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent OMS_HOST=hostname.domain.com EM_UPLOAD_PORT=1000 AGENT_REGISTRATION_PASSWORD=2Bor02B4\n\tThis command is expected to do the complete agent install and configuration with the provided inputs.\n"
        $ECHO -e "Example2:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agt RESPONSE_FILE=/scratch/agent.rsp -softwareOnly -invPtrLoc /scratch/agent/oraInst.loc -debug\n\tThis command is expected to copy the agent bits to the agent base directory.\n"
        $ECHO -e "Example3:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent OMS_HOST=hostname.domain.com EM_UPLOAD_PORT=1000 -forceConfigure\n\tThis command is expected to do the agent install and also force the agent configuration even though the oms host and port are not available.\n"
        $ECHO -e "Example4:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent AGENT_INSTANCE_HOME=/scratch/agent/agent_inst -configOnly\n\tThis command is expected to do the agent configuration only with the provided inputs.\n"
        $ECHO -e "Example5:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent s_agentHomeName=myAgent -ignorePrereqs\n\tThis command is expected to skip the prereqs and then continue with the agent deployment also notice in the inventory that instead of the default home name, myAgent home name will be assigned for the agent home.\n"
        $ECHO -e "Example6:\n\t agentDeploy.sh AGENT_BASE_DIR=/scratch/agent PLUGIN_RSPFILE=/scratch/plugin.txt PROPERTIES_FILE=/scratch/agent.properties\n\t Let's say the content of the /scratch/agent.properties file is enableAutoTuning=false, then this command with deploy and configure the agent with the enableAutoTuning property set."
}
usage()
{
        $ECHO -e "\n\tagentDeploy.sh -help\n\tThis option will provide you the help for fresh agent install."
}
 if [ "{`dirname $0`}" = "{.}" ] ; then
        archiveLoc=$PWD
else
        archiveLoc=`dirname $0`
fi

$GREP null "$archiveLoc/agentDeploy.sh" > /dev/null
status=$?
if [ $status -ne 0 ] ; then
$ECHO "Grep utility does not exist in this box. Install the grep utility package and then rerun the agentDeploy.sh" | $TEE -a $filename
exit 1
fi


countArgs=$#

while [ $# -gt 0 ]
do
idx1=`$ECHO $1|$GREP "="|wc -l`
if [ $idx1 -gt 0 ] ; then
key=`$ECHO $1| $CUT -d '=' -f 1`
value=`$ECHO $1| $CUT -d '=' -f 2`
else
key=`$ECHO $1| $CUT -d '=' -f 1`
idx2=`$ECHO $1|$GREP "^-"|wc -l`
if [ $idx2 -eq 0 ] ; then
        $ECHO -e "\n ERROR: $1 is an unsupported argument passed to agentDeploy.sh.\n" | $TEE -a $filename
        usage
        exit 1
fi

fi
        case "$key" in
        -help)  if [ $upgradeFlag ] ; then
                upgradeUsage
                else
                freshUsage
                fi
                exit 0;;
        AGENT_BASE_DIR)
                         agentBaseDir=`$ECHO $value | $SED 's/\/$//'`
                         checkBaseFlag=TRUE;;
        OMS_HOST)       omsHost=$value
                        checkOMSHost=TRUE;;
        AGENT_PORT)     agentPort=$value;;
        EM_UPLOAD_PORT)  omsPort=$value
                         checkOMSPort=TRUE;;
        ORACLE_HOME)      oracleHomeCmdFlag=TRUE;;
        AGENT_INSTANCE_HOME)    instHome=`$ECHO $value | $SED 's/\/$//'`;;
        AGENT_REGISTRATION_PASSWORD) pwd=$value;;                                      s_encrSecurePwd) pwd=$value;;
	AGENT_MODE) agentMode=$value;;
	ORACLE_HOSTNAME) hostname=$value
                         hostnameswitch=-J-DORACLE_HOSTNAME=$hostname;;
        RESPONSE_FILE)   rspFlag=TRUE
                         rspLoc=$value;;
	RETRY)           retryFlag=TRUE
                         retryVal=$value;;
        COMMAND)         cmdvalue=$value;;
	LOG_DIR)         logDir=$value;;
	AGENT_START_TIMEOUT) timeFlag=TRUE
			     timevalue=$value;;
        OLD_AGENT_VERSION)  oldAgentVersion=$value;;
        OLDHOME)         oldHome=$value;;
	ALLOW_IPADDRESS)         allowIP=$value;;
		JAVA_OPTIONS)     javaOpt=$value;;
		RUNINSTALLER_OPTIONS) runInstallerOpt=$value;;
	b_sharedAgents)  sharedAgent=$value;;
	b_doDiscovery)    doDiscovery=$value;;
	START_AGENT)     startAgent=$value;;
	b_secureAgent)    secureAgent=$value;;
	b_forceInstCheck) forceInstCheck=$value;;
        -debug)          debugSwitch=TRUE;;
        -forceConfigure) forceconFlag=TRUE;;
        -configOnly)     configFlag=TRUE
                         validationFlag=TRUE;;
        -agentImageLocation) archiveLoc=$value
                         checkArchiveFlag=TRUE;;
        -invPtrLoc)     shift
                        ptrLoc=$1;;
        b_forceInstCheck)  forcefullFlag=TRUE;;
        -prereqOnly)            validationFlag=TRUE
                                prereqFlag=TRUE;;
        -softwareOnly)          validationFlag=TRUE
                                softwareFlag=TRUE;;
        -ignorePrereqs)         ignorePrereqFlag=TRUE;;
        -ignoreCompatibility)   ignoreCompatabilityFlag=TRUE;;
        -upgrade)               upgradeFlag=TRUE;;
	-update)               upgradeFlag=TRUE;;
	-clone)			cloneFlag=TRUE;;
	-force)                 forceFlag=TRUE;;
        SCRATCHPATH)           scratchFlag=TRUE
                                scratchpath=$value;;
        -rscratchPath)          rscratchFlag=TRUE
				rscratch=$value;;
        -ignoreDirPrereq)       ignoreDirPrereqFlag=TRUE;;
	PLUGIN_RSPFILE)         pluginTxt=$value;;
        #-validateParams)       validateFlag=TRUE;;
        #                       validFlag=TRUE;;
        #                       validFlag=TRUE;;
        #                       validFlag=TRUE;;
        #                       validFlag=TRUE;;
        #-noRollBack)           validFlag=TRUE;;
        #-executeRootsh)                validFlag=TRUE;;
        #-sbinUpgrade)   sbinUpgradeFlag=TRUE;;
        #               validFlag=TRUE;;
        INVENTORY_LOCATION)  validFlag=TRUE
			     invparam=$value
		             invFlag=TRUE;;	
        *)      idx=`$ECHO $1|$GREP "^-"|wc -l`
                if [ $idx -eq 0 ] ; then
                        validFlag=TRUE
                else
                        $ECHO -e "\n ERROR: Invalid argument $key passed." | $TEE -a $filename1
                        usage
                        exit 1
                fi
        esac
        shift
done
if [ "$sharedAgent" = "true" ] ; then
	sharedFlag=TRUE
fi


#######################################################
#Subroutines
#######################################################
#validateParams method is used to validate the parameters

validateParams()
{
agentBaseDir=`$ECHO $agentBaseDir | $TR -s " "`
if [ $countArgs -lt 1 ]
then
  usage
  exit 2
fi

#changed ptrloc condition accordingly to work on solaris and other ports.
if   [ "$ptrLoc" = "" ] ;then
$ECHO " "
elif [ ! -f $ptrLoc ] ; then
        $ECHO -e "\n ERROR: Inventory pointer file $ptrLoc does not exist." | $TEE -a $filename1
        exit 1
fi

#validating agentimage if it's  a cloned image ,bug#20428980

if [ ! "$configFlag" ] ; then
if [ ! "$cloneFlag" ]; then
        if [ ! -f "$archiveLoc/agentcore.bin" ] ; then
           if [ -f "$archiveLoc/agentcoreimage.zip" ] ; then
              $ECHO -e "\n It's a cloned image,setting clone flag to true." >>$filename
              cloneFlag=TRUE
           fi
        fi
fi
fi

#Validating scratchpath location

if [ "$scratchFlag" ] ; then
    if [ ! -d "$scratchpath" ] ;then
            $MKDIR -p "$scratchpath"
            if [ $? -ne 0 ] ; then
             $ECHO -e "\n ERROR: Pass writable scratchpath" | $TEE -a $filename1
             exit 1
             fi
       tmpswitch=-J-Djava.io.tmpdir=$scratchpath
    else
     touch $scratchpath/a
             if [ $? -ne 0 ] ;then
             $ECHO -e "\n ERROR: Pass writable scratchpath" | $TEE -a $filename1
             else
             $RM $scratchpath/a
             tmpswitch=-J-Djava.io.tmpdir=$scratchpath
             fi
    fi
fi


#validating ignoreDirPrereqFlag

if [ ! "$ignoreDirPrereqFlag" ] ; then
  dirswitch=-J-DAGENT_BASE_DIR=$agentBaseDir
else
  dirswitch=""
fi

#validating allowIP

if [ -z "$allowIP" ] ; then
	allowIPswitch=""
else
	allowIPswitch=-J-DALLOW_IPADDRESS=$allowIP
        $ECHO "ALLOW_IPADDRESS passed value is $allowIP" >> $filename
fi


#validating java options

if [ -z "$javaOpt" ] ; then
        javaOpt=""
else
        $ECHO $javaOpt | tr "," "\n"  > $archiveLoc/a.txt
        javaOpt=""
        for x in `cat $archiveLoc/a.txt`
        do
        javaOpt=$javaOpt" -J"$x
        done
        $RM $archiveLoc/a.txt
fi

$ECHO "value of javaopt is $javaOpt" >> $filename

#validating RunInstaller options
if [ -z "$runInstallerOpt" ] ; then
        runInstallerOpt=""
else
        $ECHO $runInstallerOpt | tr "," "\n" > $archiveLoc/a.txt
        runInstallerOpt=""
        for x in  `cat $archiveLoc/a.txt`
        do
        runInstallerOpt=$runInstallerOpt"  "$x
        done
        $RM $archiveLoc/a.txt
fi

$ECHO "value of runInstallerOpt is $runInstallerOpt" >> $filename

#changed rspLoc condition to make it work on ports as part of bug12586548
if [ "$rspFlag" ] ; then
        if [ "$rspLoc" = "" ] ; then
                 $ECHO -e "\n ERROR: Invalid arguments passed. Pass RESPONSE_FILE value to agentDeploy.sh" | $TEE -a $filename1
                usage
                exit 1
        else
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_BASE_DIR|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_BASE_DIR|$CUT -d "=" -f2|tail -1`
                agentBaseDir=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP OMS_HOST|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP OMS_HOST|$CUT -d "=" -f2|tail -1`
                omsHost=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP EM_UPLOAD_PORT|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP EM_UPLOAD_PORT|$CUT -d "=" -f2|tail -1`
                omsPort=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_REGISTRATION_PASSWORD|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_REGISTRATION_PASSWORD|$CUT -d "=" -f2|tail -1`
                pwd=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_INSTANCE_HOME|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_INSTANCE_HOME|$CUT -d "=" -f2|tail -1`
                instHome=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP OLD_AGENT_VERSION|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP OLD_AGENT_VERSION|$CUT -d "=" -f2|tail -1`
                oldAgentVersion=`$ECHO $value|$TR -d "\""`
                fi		
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP START_AGENT|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP START_AGENT|$CUT -d "=" -f2|tail -1`
                startAgent=`$ECHO $value|$TR -d "\""`
                fi
                idx=`cat $rspLoc|$GREP -v "^#"|$GREP b_forceInstCheck|wc -l`
                if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP b_forceInstCheck|$CUT -d "=" -f2|tail -1`
                forceInstCheck=`$ECHO $value|$TR -d "\""`
                fi
		idx=`cat $rspLoc|$GREP -v "^#"|$GREP ORACLE_HOSTNAME|wc -l`
		if [ $idx -gt 0 ] ; then
                value=`cat $rspLoc|$GREP -v "^#"|$GREP ORACLE_HOSTNAME|$CUT -d "=" -f2|tail -1`
                hostname=`$ECHO $value|$TR -d "\""`
                fi
        fi
fi

if [  "$oracleHomeCmdFlag" ] ; then
$ECHO -e "\n ERROR:ORACLE_HOME is not a supported argument ." | $TEE -a $filename1
exit 1
fi
if [ "$agentBaseDir" = "" ] ; then
        $ECHO -e "\n ERROR: Invalid invocation. AGENT_BASE_DIR is mandatory." | $TEE -a $filename1
        usage
        exit 1
else
        if [ "$agentBaseDir" = "<Value Unspecified>" ] ; then
                $ECHO -e "\nAGENT_BASE_DIR cannot be $agentBaseDir." | $TEE -a $filename1
                exit 1
        fi
fi

if  [ "$upgradeFlag" -a ! "$configFlag" ] ; then
  if [ -d  "$agentBaseDir/agent_13.1.0.0.0" ] ; then
    rm -rf "$agentBaseDir/agent_13.1.0.0.0"
  fi
fi

if [ ! "$upgradeFlag" ] ; then
if   [ ' ! -e "${agentBaseDir}" ' ] ; then
        $MKDIR -p $agentBaseDir
fi

if [ $? -ne 0 ] ; then
        $ECHO -e "\nERROR: Not able to create the agent base directory. Check the write permissions on the base directory and then retry."| $TEE -a $filename1
        exit 1
fi

$CHMOD 755 $agentBaseDir
if [ ! -w "$agentBaseDir" ] ; then
        $ECHO -e "\n ERROR: The agent base directory $agentBaseDir is not writable." | $TEE -a $filename1
        exit 1
fi

#Retry Flag should not be tried with softwareOnly

if [ "$softwareFlag" -a "$retryFlag" ] ; then
   echo "RETRY OPTION should not be tried with softwareOnly option" | $TEE -a $filename1
   exit 1
fi
   
#To remove agentbasedir forcefully if -force is passed
if [ ! "$prereqFlag" ] ; then
   if [ ! "$retryFlag" ] ; then
	if [ ! "$configFlag" ] ; then
	if [ -d  "$agentBaseDir/agent_13.1.0.0.0" ] ; then
	if [  "$forceFlag" ] ; then

	rm -rf "$agentBaseDir/agent_13.1.0.0.0"

	else
	 $ECHO -e "\n Directory $agentBaseDir/agent_13.1.0.0.0 already exist, pass -force option to overwrite"  | $TEE -a $filename1
	 exit 1
	fi
	fi
	fi
      fi
fi
fi


}

#readPropFile method is used to read the values from the agentimage.properties

readPropFile()
{
FILE="$archiveLoc/agentimage.properties"
if [ "$configFlag" ] ; then
FILE=$agentBaseDir/agentimage.properties
if [ -f "$FILE" ] ; then
echo ""
else 
cp $archiveLoc/agentimage.properties $agentBaseDir/agentimage.properties
fi
else
cp $archiveLoc/agentimage.properties $agentBaseDir/agentimage.properties
fi

if [ -f "$FILE" ] ; then
#while read line ;do
#set `$ECHO $line|$CUT -d "=" -f1`
#        if [ $1 = "VERSION" ] ; then
set `cat $FILE|$GREP -i VERSION|$CUT -d "=" -f2`
version=$1
set `cat $FILE|$GREP -i TYPE|$CUT -d "=" -f2`
type=$1
set `cat $FILE|grep -i ARUID|cut -d "=" -f2`
id=$1
$ECHO -e "\n The value of $type and $version and $id" >> $filename
 if [ "$id" = "226" ] ; then
  if [ `$UNAME` = "Linux" ]; then
   if  [  -e $GETCONF ]; then
   value=`$GETCONF LONG_BIT`
     if  [ $value != 64 ]; then
          $ECHO -e "\nERROR: You are attempting to install 64-bit Oracle on a 32-bit operating system.  This is not supported and will not work." | $TEE -a $filename1
        if [ ! "$ignoreCompatabilityFlag" ]; then
          exit 1
        fi
     fi
fi
 fi
fi

fi
if [ "$configFlag" ] ; then
#FILE="$agentBaseDir/$type/$version/install/eminstall.info"
FILE=$agentBaseDir/$type"_"$version/install/eminstall.info
$ECHO -e "\nThe type is $type version is $version and file is $FILE" 1>>$filename
if [ ! -f "$FILE" ] ; then
$ECHO -e "\nERROR: Make sure the agentDeploy.sh is executed with -softwareOnly option before running it with -configOnly option." | $TEE -a $filename1
exit 1
fi
fi
}

#checkFullyConfiguredAgent is used to check if the agentDeploy.sh is invoked second time against the fully configured agent.

checkFullyConfiguredAgent()
{
#This is added for bug 13417273
ORACLE_HOME="$agentBaseDir/$type_$version"


HOMEFILE="$agentBaseDir/$type_$version/install/oragchomelist"
if [ ! "$softwareFlag" -a ! "$prereqFlag" -a ! "$forcefullFlag" -a ! "$upgradeFlag" -a ! "$forceFlag" ] ; then
        if [ "$instHome" = "" ] ; then
        if [ -f "$HOMEFILE" ] ; then
                set `cat $HOMEFILE|grep -i $ORACLE_HOME|cut -d ":" -f2`
                instHome=$1
        else
                instHome="$agentBaseDir/agent_inst"
        fi
        fi


DEPSUC="$instHome/install/deploy.success"
if [ ! -f "$DEPSUC"  -a  "$retryFlag" ] ; then
deploy=true
fi
if [ ! "$retryFlag" ] ; then
deploy=true
fi

if [ ! "$retryFlag" ] ; then
if [ ! "$softwareFlag" -a ! "$prereqFlag" -a ! "$forcefullFlag" -a ! "$upgradeFlag" ] ; then

                if [ -d "$instHome" ] ; then
                set `ls -A $instHome|wc -l`
                NOOFFILES=$1
                if [ $NOOFFILES -gt 0 ] ; then
                $ECHO -e "\nERROR: The instance directory $instHome is not empty. If you want to configure the Management Agent in the same instance home, then stop the existing agent, manually delete the targets monitored by this management agent from the Cloud Control console, and then manually delete the agent instance home associated with this Management Agent. If you want to configure the agent in a different instance home, then enter a new instance home location by passing AGENT_INSTANCE_HOME argument." | $TEE -a $filename1
                        exit 1
                fi
                fi
	fi
fi
fi
}

#rspFileValidation validates the mandatory parameters present in the response file

rspFileValidation()
{
if [ ! "$rspLoc" = "" ] ; then
if [ -f "$rspLoc" ] ; then
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_BASE_DIR|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_BASE_DIR|$CUT -d "=" -f2`
        agentBaseDir=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP OMS_HOST|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP OMS_HOST|$CUT -d "=" -f2`
        omsHost=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP EM_UPLOAD_PORT|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP EM_UPLOAD_PORT|$CUT -d "=" -f2`
        omsPort=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_REGISTRATION_PASSWORD|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_REGISTRATION_PASSWORD|$CUT -d "=" -f2`
        pwd=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_INSTANCE_HOME|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP AGENT_INSTANCE_HOME|$CUT -d "=" -f2`
        instHome=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP OLD_AGENT_VERSION|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP OLD_AGENT_VERSION|$CUT -d "=" -f2`
        oldAgentVersion=`$ECHO $value|$TR -d "\""`
        fi
        idx=`cat $rspLoc|$GREP -v "^#"|$GREP OLDHOME|wc -l`
        if [ $idx -gt 0 ] ; then
        value=`cat $rspLoc|$GREP -v "^#"|$GREP OLDHOME|$CUT -d "=" -f2`
        oldHome=`$ECHO $value|$TR -d "\""`
        fi
fi
fi
if [ ! "$rspLoc" = "" ] ; then
if [ ! -f "$rspLoc" ] ; then
        $ECHO -e "\nERROR: The response file passed to the agentDeploy.sh does not exist." | $TEE -a $filename1
        exit 1;
fi
fi
}
validateMandatoryParams()
{
if [ ! "$validationFlag" -a ! "$upgradeFlag" ] ; then
if [ "$omsHost" = "" ] ; then
        $ECHO -e "\n ERROR: OMS_HOST cannot be null. Pass OMS_HOST value either as command-line arguments or in response file." |$TEE -a $filename1
        exit 1
fi

if [ "$omsPort" = "" ] ; then
        $ECHO -e "\n ERROR: EM_UPLOAD_PORT cannot be null. Pass EM_UPLOAD_PORT value either as command-line arguments or in response file." | $TEE -a $filename1
        exit 1
fi
fi
if [ "$upgradeFlag" ] ; then
if [ "$instHome" = "" ] ; then
$ECHO -e "\n ERROR: Invalid invocation. AGENT_INSTANCE_HOME is mandatory for upgrade\n" | $TEE -a $filename1
upgradeUsage
exit 2
fi
if [ "$oldHome" = "" ] ; then
$ECHO -e "\n ERROR: Invalid invocation. OLDHOME is mandatory for upgrade\n" | $TEE -a $filename1
upgradeUsage
exit 2
fi
#if [ ! "$sbinUpgradeFlag" ] ; then
#if [ "$oldAgentVersion" = "" ] ; then
#$ECHO -e "\n ERROR: Invalid invocation. OLD_AGENT_VERSION is mandatory for upgrade\n"
#upgradeUsage
#exit 2
#fi
#fi
fi

}

spaceCheck()
{
if [ ! "$prereqFlag" ] ; then
if [ ! "$configFlag" ] ; then

        if [ ! -d $agentBaseDir ] ; then
                $MKDIR -p $agentBaseDir
        fi
plat=`uname -s`
        if [ "$plat" = "HP-UX" ] ; then
        set `$DF -k $agentBaseDir |$GREP -i free|$TR -s ' '|$CUT -d " " -f2` 1>>$filename 2>>$filename1
             elif [ "$plat" = "AIX" ] ; then
               set `$DF -k $agentBaseDir | $TR -s ' '|tail -1|$CUT -d " " -f3` 1>>$filename 2>>$filename1
             else
               set `$DF -k $agentBaseDir | $TR -s ' '|tail -1|$CUT -d " " -f4` 1>>$filename 2>>$filename1
        fi
        if [ $debugSwitch ] ; then
        $ECHO "Executing command : $DF -k $agentBaseDir |$TR -s ' '|$CUT -d \" \" -f4|$CUT -f2 -d \" \" "| $TEE -a $filename 
                $ECHO "Output of the above command is $1" | $TEE -a $filename
        fi

space=`echo $1 / 1024 | bc`
$ECHO "The space available is ....  $space MB"
        if [ "$debugSwitch" ] ; then
                $ECHO $space | $TEE -a $filename
        fi
                if [ $space -lt 1536 ] ; then
                        $ECHO -e "\n ERROR: $agentBaseDir Directory has space less than 1.5 GB. Make sure that the agent base directory has space more than 1.5 GB." | $TEE -a $filename1
                        exit 1
                fi
fi
fi
}

#validateOMS method validates whether the oms host and port is active.
validateOMS()
{
if [ ! "$retryFlag" ] ;then
$ECHO "The flag of config is $configFlag and debug flag is $debugSwitch" 1>>$filename
if [ ! "$configFlag" ] ; then
if [ "$debugSwitch" ] ; then
        $ECHO "Agent Base Directory is : $agentBaseDir" |  $TEE -a $filename
        $ECHO "Response File Location is : $rspLoc" | $TEE -a $filename
fi


if [ "$debugSwitch" ] ; then
        $ECHO "Executing command : $archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.sysman.emagent.installer/13.1.0.0.0/DataFiles/filegroup1.jar -d $agentBaseDir " | $TEE -a $filename
fi

if [ -f "$archiveLoc/unzip" ] ; then
$archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.sysman.top.agent/13.1.0.0.0/DataFiles/filegroup1.jar -d $agentBaseDir 1>>$filename
$archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.nginst.core/13.6.0.0.0/DataFiles/filegroup1.jar -d $agentBaseDir 1>>$filename
$archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.nginst.common/13.6.0.0.0/DataFiles/filegroup1.jar -d $agentBaseDir 1>>$filename
$archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.sysman.emagent.installer/13.1.0.0.0/DataFiles/filegroup1.jar -d $agentBaseDir 1>>$filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.sysman.top.agent/13.1.0.0.0/DataFiles/filegroup1.jar jlib/agentInstaller.jar -d $agentHome 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.nginst.core/13.6.0.0.0/DataFiles/filegroup1.jar modules/OraInstaller.jar -d $agentHome 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.nginst.core/13.6.0.0.0/DataFiles/filegroup1.jar modules/*jar -d $agentHome 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.nginst.common/13.6.0.0.0/DataFiles/filegroup1.jar modules/*jar -d $agentHome 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.sysman.emagent.installer/13.1.0.0.0/DataFiles/filegroup1.jar oui/emagent/oui/jlib/emCfg.jar  -d $agentHome 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.nginst.common/13.6.0.0.0/DataFiles/filegroup1.jar modules/xmlparserv2.jar -d $agentHome 1>> $filename

if [ "$debugSwitch" ] ; then
 $ECHO "Executing command : $archiveLoc/unzip -o $archiveLoc/agentcore.bin core/$version/jdk/* -d $agentBaseDir " | $TEE -a $filename
fi
$archiveLoc/unzip -o $archiveLoc/agentcore.bin Disk1/stage/Components/oracle.jre/*/DataFiles/filegroup1.jar -d $agentBaseDir 1>> $filename
$archiveLoc/unzip -o $agentBaseDir/Disk1/stage/Components/oracle.jre/*/DataFiles/filegroup1.jar "jdk/*" -d $agentHome 1>> $filename

$ECHO -e "\n Validating the OMS_HOST & EM_UPLOAD_PORT" | $TEE -a $filename
#agentHome="$agentBaseDir/$type_$version"
$MKDIR -p $agentHome/cfgtoollogs/agentDeploy
$MKDIR -p $agentHome/cfgtoollogs/prereqlogs

#Agentpush passes -rscratchpath for prereq log temp location 
if [ "$rscratchFlag" ]; then  
pretmp="$rscratch"
else
pretmp="$agentHome/cfgtoollogs/prereqlogs"
fi
$CHMOD 755 $agentHome/jdk/jre/bin/java
$ECHO "Executing command : $agentHome/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/oui/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller $agentHome $archiveLoc $agentBaseDir $args -prereq" | $TEE -a $filename
#$ECHO "Executing command : $agentHome/oracle_common/jdk/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller $agentHome $archiveLoc $agentBaseDir $args --prereqOnly" | $TEE -a $filename

$agentHome/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller $agentHome $archiveLoc $agentBaseDir $args -prereq 
#$agentHome/oracle_common/jdk/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/oui/modules/OraInstaller.jar oracle.sysman.agent.installer.AgentInstaller $agentHome $archiveLoc $agentBaseDir $args -prereqOnly
status="$?"
sleep 2

if [ $status -eq 1 ] ; then
        $ECHO -e "Validating the OMS_HOST & EM_UPLOAD_PORT has failed" | $TEE -a $filename1
        exit 1
fi
#else
 #       $ECHO -e "ERROR: $archiveLoc/unzip does not exist"
  #      exit 1
fi

rm -rf $agentBaseDir/Disk1

fi
fi
}

if [ "$instHome" = "" ]
then
instHome="$agentBaseDir/agent_inst"
fi
if [ "$sharedFlag" ]; then
	if [ !  -d  "$instHome/install/logs" ]; then
		$MKDIR -p "$instHome/install/logs"
	fi
fi


if [ "$logDir" = "" ] ; then
        if [ "$sharedFlag" ]; then
                logDir="$instHome/install/logs"
        else
                logDir=$archiveLoc
        fi
	if [ ! -w "$archiveLoc" -a ! "$sharedFlag" ] ; then
		$ECHO -e "\n ERROR: The agent image location $archiveLoc is not writable." | $TEE -a $filename1
		exit 1
	fi
else
	if [ !  -d  "$logDir" ]; then
		$MKDIR -p $logDir
	if [ $? -ne 0 ];then
		$ECHO -e "\n ERROR: The log directory location $logDir is not writable." | $TEE -a $filename1 
	fi
	elif [ ! -w "$logDir" ] ; then
		$ECHO -e "\n ERROR: The log directory location $logDir is not writable." | $TEE -a $filename1 
		exit 1
	fi

fi

filename="$logDir/agentDeploy_$timestamp.log"
filename1="$logDir/agentDeploy_$timestamp.err"

validateParams
readPropFile
if [ ! "$sharedFlag" ] ; then
rspFileValidation
validateMandatoryParams
checkFullyConfiguredAgent
spaceCheck

if [ $debugSwitch ] ; then
        $ECHO "Agent Base Directory is : $agentBaseDir" 1>>$filename
        $ECHO "Response File Location is : $rspLoc" 1>>$filename
fi

# Calling the java class to perform all the other operations
###############Need to change this after deciding on the agent home
agentHome=$agentBaseDir/$type"_"$version


if [ ! "$upgradeFlag" -a ! "$cloneFlag" ] ; then
validateOMS
$ECHO "Validating the OMS Host and Port completed." | $TEE -a $filename
else

if [ ! "$configFlag" ] ; then
$MKDIR -p $agentHome/cfgtoollogs/agentDeploy
$MKDIR -p $agentHome/cfgtoollogs/prereqlogs
fi

fi
fi

if [ "$agentMode" = "" ] ; then
        agentMode=NONE
fi

agentHome=$agentBaseDir/$type"_"$version

agtRspFile=$agentBaseDir/agentInstall.rsp

if [ "$sharedFlag" ] ; then
agtRspFile=$instHome/agentInstall.rsp
fi

if [ -f "$agtRspFile" ] ; then
        $ECHO "The response file in the agent home exist, So deleting it" 1>>$filename
        rm -f $agtRspFile
fi

#Checking hostname bug#	19956582
if [ ! -z "$hostname" ];then
hostnameswitch="-J-DORACLE_HOSTNAME=$hostname"
fi 
#host=`/bin/hostname -f`
#echo "$host"
## call the new install.bin file here
if [ $rspFlag ] ; then
   cp $rspLoc $agtRspFile 1>>$filename 2>>$filename1
   $SED -i "s|AGENT_BASE_DIR=[^ ]*|AGENT_BASE_DIR=$agentBaseDir|g" $agentBaseDir/agentInstall.rsp
   $SED -i "s|ORACLE_HOME=[^ ]*|ORACLE_HOME=$agentHome|g" $agtRspFile
   idRes=`cat $agtRspFile |grep -v "^#"|grep ORACLE_HOME|wc -l`
   if [ $idRes -eq 0 ] ; then
   $ECHO "ORACLE_HOME=$agentHome" 1>>$agtRspFile
   fi
   $SED -i "s|AGENT_INSTANCE_HOME=[^ ]*|AGENT_INSTANCE_HOME=$instHome|g" $agtRspFile
   cp $agtRspFile $rspLoc
#   $SED -i "s|ORACLE_HOSTNAME=[^ ]*|ORACLE_HOSTNAME=$host|g" $agtRspFile
#   $SED -i "s|b_chainedInstall=[^ ]*|b_chainedInstall=true|g" $agtRspFile
else
   #cp $archiveLoc/agent.rsp $agtRspFile   
   $ECHO "ORACLE_HOME=$agentHome" 1>>$agtRspFile
   if [ ! -z "$agentPort" ];then
   $ECHO "AGENT_PORT=$agentPort" 1>>$agtRspFile
   fi
   if [ ! -z "$omsPort" ];then
   $ECHO "EM_UPLOAD_PORT=$omsPort" 1>>$agtRspFile
   fi
   if [ ! -z "$omsHost" ]; then
   $ECHO "OMS_HOST=$omsHost" 1>>$agtRspFile
   fi
   $ECHO "AGENT_INSTANCE_HOME=$instHome" 1>>$agtRspFile
   $ECHO "AGENT_BASE_DIR=$agentBaseDir" 1>>$agtRspFile
   $ECHO "AGENT_REGISTRATION_PASSWORD=$pwd" 1>>$agtRspFile
   $ECHO "s_encrSecurePwd=$pwd" 1>>$agtRspFile

#   $ECHO "EMCTLCFG_MODE=$agentMode" 1>>$agtRspFile
   if [ ! -z "$cmdvalue" ];then
      $ECHO "COMMAND=$cmdvalue" 1>>$agtRspFile
   fi
#   $ECHO "ORACLE_HOSTNAME=$host" 1>>$agtRspFile
if [ $timeFlag ]; then
   $ECHO "AGENT_START_TIMEOUT=$timevalue" 1>>$agtRspFile
   fi
   #if [ ! -z "$oracle_home_name" -a "$oracle_home_name"!=" " ];then
   #$ECHO "ORACLE_HOME_NAME=$oracle_home_name" 1>>$agtRspFile
  # fi

   if [ "$doDiscovery" = "" ] ; then
     $ECHO "b_doDiscovery=true" 1>>$agtRspFile
  # else
  #   $ECHO "b_doDiscovery=$doDiscovery" 1>>$agtRspFile
   fi

   if [ "$startAgent" = "" ] ; then
     $ECHO "START_AGENT=true" 1>>$agtRspFile
   else
     $ECHO "START_AGENT=$startAgent" 1>>$agtRspFile
   fi  
   
   if [ "$forceconFlag" = "" ] ; then
     $ECHO "b_forceConfigure=false" 1>>$agtRspFile
   else
     $ECHO "b_forceConfigure=$forceconFlag" 1>>$agtRspFile
   fi     
   if [ "$sharedFlag" ] ; then
     $ECHO "b_sharedAgents=true" 1>>$agtRspFile 
   else
     $ECHO "b_sharedAgents=false" 1>>$agtRspFile 
   fi

   if [ "$secureAgent" = "" ] ; then
     $ECHO "b_secureAgent=true" 1>>$agtRspFile
   else
     $ECHO "b_secureAgent=$secureAgent" 1>>$agtRspFile
   fi     
#   $ECHO "b_chainedInstall=true" 1>>$agtRspFile

   if [ "$upgradeFlag" ] ; then
     $ECHO "b_noUpgrade=false" 1>>$agtRspFile
     $ECHO "b_agentupgrade=true" 1>>$agtRspFile
   else
     $ECHO "b_noUpgrade=true" 1>>$agtRspFile
     $ECHO "b_agentupgrade=false" 1>>$agtRspFile
   fi
   $ECHO "PLUGIN_RSPFILE=$archiveLoc/plugins.txt" 1>>$agtRspFile

# KI: check for $arg, bug#20445253 split with space, get each values PLUGIN_RSPFILE="" and append to rsp file

     if [ ! -z "$args" ]; then
        $ECHO "Args : $args "
#        read -a argsArray <<<$args
        #argsArray=($args)
        for sepArg in $args
         do

           #$ECHO "Writing $sepArg to $agtRspFile"
           $ECHO "$sepArg" 1>>$agtRspFile

         done
      fi


fi

$ECHO -e "\nThe oracle home value should be set to $agentHome" 1>>$filename

entryPoint="oracle.sysman.top.agent_Complete"
if [ "$invFlag" ];then
invPtrLoc=INVENTORY_LOCATION=$invparam 
invswitch=$invPtrLoc
elif [ ! "$ptrLoc" = "" ] ; then
  invPtrLoc="-invPtrLoc $ptrLoc"
fi


#if [ "$upgradeFlag" ] ; then
if [ ! -z "$oldHome" ];then
  entryPoint="oracle.sysman.top.agent_Upgrade"
  if [ "$ptrLoc" = "" -a ! "$invFlag" ] ; then
    invPtrLoc="-invPtrLoc $oldHome/oraInst.loc"
  fi
fi

#Check whether Inventory is writable or not
if [ ! -z "$invparam" ]; then
	touch $invparam/a
	if [ $? -ne 0 ];then
		$ECHO "Inventory location $invparam is not writable" | $TEE -a $filename1
		exit 1
		else
		$RM  $invparam/a
		$ECHO "Inventory location is writable" | $TEE -a $filename
	fi

elif [ ! -z "$ptrLoc" ]; then
	inv_loc=`$CAT $ptrLoc|$GREP inventory_loc|$CUT -d "=" -f2`
	touch $inv_loc/a
	if [ $? -ne 0 ];then
		$ECHO "Inventory location $inv_loc is not writable" | $TEE -a $filename1
		exit 1
		else
		$RM  $inv_loc/a
		$ECHO "Inventory location is writable" | $TEE -a $filename
	fi

fi
#Inventory writable check ends

ApplyPatch()
{
if [ -f "$agentBaseDir/oneoffs/applypatchesonapplicablehome.pl" ]; then
echo "Applying oneoffs...." | $TEE -a $filename
$agentHome/perl/bin/perl $agentBaseDir/oneoffs/applypatchesonapplicablehome.pl -patch_location=$agentBaseDir/oneoffs -primary_home=$agentHome  -log_loc=$agentHome/cfgtoollogs/agentDeploy 1>>$filename 2>>$filename1
if [ $? -ne 0 ] ; then
$ECHO "Apply oneoffs failed" | $TEE -a $filename
fi
fi
}

LinkJdk()
{
#creating symlink for oracle_common jdk under agenthome/jdk
$ECHO "Creating symlink $agentHome/oracle_common/jdk/bin $agentHome/jdk/bin" | $TEE -a $filename
rm -rf $agentHome/jdk
$LN -s $agentHome/oracle_common/jdk $agentHome/jdk 1>>$filename 2>>$filename1
}

PostInstall()
{
$ECHO -e "Entered Post Install...\n" | $TEE -a $filename
$ECHO "Relaxing execute  permission for other users  on $agentHome/install for bug#20005612" | $TEE -a $filename
$ECHO -e "agenthome is $agentHome \n" 1>>$filename
$CHMOD 755 $agentHome/sysman  #bugfix 19514872  
$CHMOD 755 $agentHome/install
$CHMOD 755 $agentHome/install/unix
$CHMOD -R 755 $agentHome/install/unix/scripts
# change permissions so they are accessible by users from groups
# other than the agent user group.
#Bug 22085251 - Perl execution fails if users are different (tgt and agent)
$CHMOD a+rx $agentHome/lib
$CHMOD a+rx $agentHome/lib/lib*.s*
$CHMODR a+rx $agentHome/perl

#Bug 22103670 - path to require emd_common.pl does not appear to work in job script
$CHMODR 755 $agentHome/sysman/admin
$CHMOD 755 $agentHome/oracle_common
$CHMODR 755 $agentHome/oracle_common/jdk
$CHMOD 755 $agentHome/plugins

$CHMODR 755 $agentHome/jlib
$CHMODR 755 $agentHome/jdbc
$CHMODR 755 $agentHome/instantclient


# Bug 21963403 - agent_13.1.0.0.0/bin 750 permission caused nmocat to fail with non-agent user
$CHMOD 755 $agentHome/bin

# bug 8372547, relax permission for emctl and emtgctl in grid control
$CHMOD 755 $agentHome/bin/emtgtctl
$CHMOD 6711 $agentHome/bin/emtgtctl2

}

DEPSUC="$instHome/install/deploy.success"
if [ ! -f $DEPSUC  -a  "$retryFlag" ] ; then
deploy=true
fi
if [ ! "$retryFlag" ] ; then
deploy=true
fi


if [ ! "$ignorePrereqFlag" -a ! "$configFlag"  -a ! "$cloneFlag" -a  "$deploy" ] ; then
	  $ECHO "$archiveLoc/agentcore.bin -ignoreSysPrereqs -prereqChecker -entryPoint $entryPoint -silent -ignoreSysPrereqs -detailedExitCodes -responseFile $agtRspFile $invPtrLoc $hostnameswitch -J-Djava.io.tmpdir=$pretmp -J-DAGENT_BASE_DIR=$agentBaseDir $allowIPswitch $javaOpt $runInstallerOpt" | $TEE -a $filename
	  $archiveLoc/agentcore.bin -ignoreSysPrereqs -prereqChecker -entryPoint $entryPoint -silent -ignoreSysPrereqs -detailedExitCodes -responseFile $agtRspFile $invPtrLoc $hostnameswitch -J-Djava.io.tmpdir=$pretmp -J-DAGENT_BASE_DIR=$agentBaseDir $allowIPswitch $javaOpt $runInstallerOpt

	if [ $? -ne 0 ] ; then
	   $ECHO "Agent Prereqs failed." | $TEE -a $filename1
	    $ECHO "Check the logs at $agentHome/cfgtoollogs/prereqlogs" | $TEE -a $filename1
	   exit 1
	fi

$ECHO -e " \n Agent Prereqs Completed " | $TEE -a $filename
fi

if [ $prereqFlag ] ; then
  $ECHO "Only the Prereqs have been executed. Prereqs were executed successfully." | $TEE -a $filename
  exit 0;
fi 

# section for software only and not clone 

if [ ! "$configFlag"  ] ; then
	if [  "$deploy" ]; then
	if [ ! "$cloneFlag" ] ; then
     TMPDIR=
     export TMPDIR

     #If user choose -ignoreprereq then mkdir is required
     if [ ! -d "$agentHome/cfgtoollogs/agentDeploy" ]; then
     	$MKDIR -p "$agentHome/cfgtoollogs/agentDeploy"
     fi

     #Appending EMCTLCFG_MODE to a  response file to fix bug#21783709 
     if [ ! "$agentMode" = ""  -a ! "$upgradeFlag"  ];then
        $ECHO EMCTLCFG_MODE=$agentMode >> $agtRspFile
     elif [ "$upgradeFlag" ]; then
        agentMode=`$CAT $oldHome/bin/emctl | $GREP -i EMCTLCFG_MODE|$GREP -v export  |$CUT -d "=" -f2`
	$ECHO EMCTLCFG_MODE=$agentMode >> $agtRspFile
     fi

		$ECHO -e  "\n \n Starting Install Phase ....." | $TEE -a $filename
		$ECHO "$archiveLoc/agentcore.bin -ignoreSysPrereqs -silent -responseFile $agtRspFile $invPtrLoc $tmpswitch $javaOpt $runInstallerOpt"  |  $TEE -a $filename
			$archiveLoc/agentcore.bin -ignoreSysPrereqs -silent -responseFile $agtRspFile $invPtrLoc $tmpswitch $javaOpt $runInstallerOpt
		if [ $? -ne 0 ] ; then
		   $ECHO "Agent installation failed." | $TEE -a $filename1
			$ECHO "Copying Install logs to $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename
			inventory_loc=`$CAT $agentHome/oraInst.loc|$GREP inventory_loc|cut -d "=" -f2`
			logs=`ls -lrt   $inventory_loc/logs|tail -1|$CUT -d "_" -f2|$CUT -d "." -f1`
			$CP $inventory_loc/logs/*$logs* $agentHome/cfgtoollogs/agentDeploy 1>>$filename 2>>$filename1
                        $ECHO "Check logs at $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename1
		   exit 1
		fi
		$ECHO -e  " Agent Software install completed \n" | $TEE -a $filename	

		LinkJdk
                
		 #Applying oneoff patches
			$ECHO "Executing command to check/apply patches if exist in agenthome....." | $TEE -a $filename
			$ECHO "$agentHome/perl/bin/perl $agentHome/install/oneoffs/apply_NewOneoffs.pl $agentHome true"
			$agentHome/perl/bin/perl $agentHome/install/oneoffs/apply_NewOneoffs.pl $agentHome true
			if [ ! $? -eq 0 ];then
			$ECHO -e  "Oneoff patch application failed \n" | $TEE -a $filename1
			fi
		#Apply oneoff patch completed

                #copying intall logs to agenthome
		$ECHO "Copying Install logs to $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename
                inventory_loc=`$CAT $agentHome/oraInst.loc|$GREP inventory_loc|cut -d "=" -f2`
	        logs=`ls -lrt 	$inventory_loc/logs|tail -1|$CUT -d "_" -f2|$CUT -d "." -f1`
		$CP $inventory_loc/logs/*$logs* $agentHome/cfgtoollogs/agentDeploy 1>>$filename 2>>$filename1
                
		#Checking for oneoffs in archieve location ..

		if [ ! "$retryFlag" ]; then
			if [ -d "$archiveLoc/oneoffs" ] ; then
				 $ECHO "Oneoffs present in agent Image" | $TEE -a $filename
				 $CHMODR 755 "$archiveLoc/oneoffs" 
				 cp -r "$archiveLoc/oneoffs" "$agentBaseDir" 1>>$filename 2>>$filename1
				 if [ $? -eq 0 ]; then
				 $ECHO ""
				 else
				 $ECHO "Copying of oneoffs failed "| $TEE -a  $filename1
				 fi
			fi

		       if [ -f "$agentBaseDir/oneoffs/jdk.zip" ] ;then
			  echo "Applying JDK oneoff to fix bug#20009847"| $TEE -a $filename
			  cp -r "$agentHome/oracle_common/jdk" "$agentHome/oracle_common/jdk.bak" 1>>$filename 2>>$filename1
			  $archiveLoc/unzip -o $agentBaseDir/oneoffs/jdk.zip -d $agentHome/oracle_common 1>>$filename 2>>$filename1
			  res=$?
			  if [ $res -eq 0 ]; then
			    echo "Successfully unzipped JDK oneoff" | $TEE -a $filename
			    else
			    echo "Failed to unzip $agentBaseDir/oneoffs/jdk.zip to $agentHome/oracle_common !" | $TEE -a $filename1
			  fi
		       fi
			ApplyPatch
	       fi


		PostInstall
		#pluginTxt="$archiveLoc/plugins.txt"

		if [ -z "$pluginTxt" ] ; then
                  pluginTxt="$archiveLoc/plugins.txt"
    		fi

           #Migrate plugin section
           if [ "$upgradeFlag" ] ; then
                pluginTxtBase="$(dirname "$pluginTxt")"
                migPluginTxt="$pluginTxtBase/plugins_migrate.txt"

                pluginHome="$agentHome/plugins"
                oldPluginHome=""
                count=0
                pluginList=""
                farbLoc="$archiveLoc/plugins"
                oldPluginHome=`dirname "$oldHome"`
                oldPluginHome=`dirname "$oldPluginHome"`
                oldPluginHome="$oldPluginHome/plugins"

                if [ -d "$oldHome/plugins" ] ; then
                        oldPluginHome="$oldHome/plugins"
                elif [ ! -d "$oldPluginHome" ] ; then
                        $ECHO "Failed: Missing plugins Directory." | $TEE -a $filename1
                        exit 1
                fi



                if [ -f $migPluginTxt ] ; then
                        cat $migPluginTxt | while read LINE
                        do
                        var="$(echo $LINE | awk -F"|" '{print $1,$2,$4}')"
                        set -- $var
                        pluginId=$1
                        pluginVer=$2
                        pluginType=$3

                        echo "plugintype is $pluginType"
                        echo $pluginType |grep -i discovery
                        if [ $? -eq 0 ]; then
                            typ=discovery
                        else
                            typ=agent
                        fi
                        echo "ptype is $typ"

                        pluginName="$pluginId"."$typ"."plugin_$pluginVer"

                        $ECHO "$agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/sysman/jlib/ngouihelper.jar:$agentHome/oui/modules/* oracle.sysman.agent.installer.AgentPluginUtil $pluginId $pluginType $pluginVer $pluginName $oldPluginHome $farbLoc $version" | $TEE -a $filename
                    $agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/sysman/jlib/ngouihelper.jar:$agentHome/oui/modules/* oracle.sysman.agent.installer.AgentPluginUtil $pluginId $typ $pluginVer $pluginName $oldPluginHome $farbLoc $version 1>>$filename 2>>$filename1
                    if [ $? -ne 0 ] ; then
                        $ECHO "Agent Migration Plugins Farb creation failed." | $TEE -a $filename1
                        exit 1
                    fi

                    done

                fi
            fi
    	
		ohAgent="failure"
                ohDiscovery="failure"
		if [ -f "$pluginTxt" ] ; then
		  if [ ! -f "$instHome/install/configPlug.success" ] ; then

			 	$CAT $pluginTxt | grep -i "oracle.sysman.oh" |grep "agentPlugin"
                                if [ $? -eq 0 ]; then
                                ohAgent="success"
                                fi
                                $CAT $pluginTxt | grep -i "oracle.sysman.oh" |grep "discoveryPlugin"
                                if [ $? -eq 0 ]; then
                                ohDiscovery="success"
                                fi

				if [ "$ohAgent" = "success" -a "$ohDiscovery" = "success" ] ;then
					##################################
					#moving below lines under condition of oh plugin present in plugin.txt
					   cp $pluginTxt $agentHome/sysman/install/plugins.txt 1>>$filename 2>>$filename1
					   $SED  "s|PLUGIN_RSPFILE=[^ ]*|PLUGIN_RSPFILE=$agentHome/sysman/install/plugins.txt|g" $agtRspFile > /dev/null 2>&1
					   $ECHO "$agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/oui/modules/OraInstaller.jar:$agentHome/oui/modules/com.oracle.cie.oui-common_12.4.0.0.jar:$agentHome/oui/modules/com.oracle.cie.ora-installer_12.4.0.0.jar oracle.sysman.agent.installer.AgentPluginInstaller $agentHome $archiveLoc/plugins $invswitch" | $TEE -a $filename
					   $agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/jlib/agentInstaller.jar:$agentHome/oui/modules/OraInstaller.jar:$agentHome/oui/modules/com.oracle.cie.oui-common_12.4.0.0.jar:$agentHome/oui/modules/com.oracle.cie.ora-installer_12.4.0.0.jar oracle.sysman.agent.installer.AgentPluginInstaller $agentHome $archiveLoc/plugins $invswitch 1>>$filename 2>>$filename1
					   if [ $? -ne 0 ] ; then
					      $ECHO "Agent Plugin Installation failed." | $TEE -a $filename1
					      exit 1
					   fi
	          		else
				$ECHO "The Management Agent installation failed. The plug-in oracle.sysman.oh may not be present in the Management Agent software. Ensure that the Management Agent software has the oracle.sysman.oh monitoring and discovery plug-in." | $TEE -a $filename1
                                 exit 1
				fi
             	     fi
		else
                $ECHO "$pluginTxt not found. The Management Agent installation failed. The plug-in oracle.sysman.oh may not be present in the Management Agent software. Ensure that the Management Agent software has the oracle.sysman.oh monitoring and discovery plug-in." | $TEE -a $filename
                exit 1
                fi
            #plugin selection completed

	    # clone section for fresh install and upgrade
             else
		       if [ "$invFlag" ];then
				invPtrLoc=INVENTORY_LOCATION=$invparam
				invswitch=$invPtrLoc
				echo "inventory pointer $invPtrLoc"
				elif [ ! "$ptrLoc" = "" ] ; then
				invPtrLoc="-invPtrLoc $ptrLoc"		
			fi
			if [ ! "$sharedFlag" ] ; then
				   $ECHO "Unzipping the agent image : $archiveLoc/unzip -oq $archiveLoc/agentcoreimage.zip -d $agentBaseDir" | $TEE -a $filename
                                   cd $agentBaseDir
				   $archiveLoc/unzip -oq $archiveLoc/agentcoreimage.zip 1>>$filename 2>>$filename1
				   if [ $? -ne 0 ] ; then
				     $ECHO "Agent image unzip failed." | $TEE -a $filename1
				     exit 1
				   fi

			fi

			#creating symlink for oracle_common jdk under agenthome/jdk
		        $ECHO "Creating symlink $agentHome/oracle_common/jdk/bin $agentHome/jdk/bin" | $TEE -a $filename
		        rm -rf $agentHome/jdk
		        $LN -s $agentHome/oracle_common/jdk $agentHome/jdk 1>>$filename 2>>$filename1

		       
		       #Appending EMCTLCFG_MODE to a new response file to fix inventory updation not happening
		       emrsp=""
                       if [ ! "$agentMode" = ""  -a "$oldHome" = ""  ];then
                                mod=EMCTLCFG_MODE=$agentMode
                                $ECHO EMCTLCFG_MODE=$agentMode > $agentBaseDir/emctlcfg.rsp
				emrsp="-responseFile $agentBaseDir/emctlcfg.rsp"
		       elif  [ ! -z "$oldHome" ];then
                          agentMode=`$CAT $oldHome/bin/emctl | $GREP -i EMCTLCFG_MODE|$GREP -v export  |$CUT -d "=" -f2`
	                  $ECHO EMCTLCFG_MODE=$agentMode > $agentBaseDir/emctlcfg.rsp
			  emrsp="-responseFile $agentBaseDir/emctlcfg.rsp"
                       fi
                         

		       $ECHO "Running clone for agent oracle home"| $TEE -a $filename
                       
		       if [ ! -z "$invPtrLoc" ]; then
				$ECHO "$agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig $invPtrLoc $emrsp $javaOpt $runInstallerOpt" | $TEE -a $filename
				$agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig $invPtrLoc $emrsp $javaOpt $runInstallerOpt
		    elif [ -f "/etc/oraInst.loc" ]  ; then
			       $ECHO "$agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig -invPtrLoc /etc/oraInst.loc $emrsp $javaOpt $runInstallerOpt" | $TEE -a $filename
			       $agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig -invPtrLoc /etc/oraInst.loc $emrsp $javaOpt $runInstallerOpt
		    elif [ -f "/var/opt/oracle/oraInst.loc" ] ; then
			      $ECHO "$agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig -invPtrLoc /var/opt/oracle/oraInst.loc $emrsp $javaOpt $runInstallerOpt" | $TEE -a $filename
			       $agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig -invPtrLoc  /var/opt/oracle/oraInst.loc $emrsp $javaOpt $runInstallerOpt
		     else
			     if [ -e "$agentBaseDir" ] ; then
			     
			       $ECHO "$agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig INVENTORY_LOCATION=$agentBaseDir/oraInventory $emrsp $javaOpt $runInstallerOpt" | $TEE -a $filename
			       $agentHome/oui/bin/launch.sh  -clone -force ORACLE_HOME=$agentHome -silent -jreLoc $agentHome/oracle_common/jdk/jre -noConfig INVENTORY_LOCATION=$agentBaseDir/oraInventory $emrsp $javaOpt $runInstallerOpt
			       fi
     		     fi 
		if [ $? -ne 0 ] ; then
		   $ECHO "Agent clone command failed." | $TEE -a $filename1
		   $ECHO "Copying Install logs to $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename
                        inventory_loc=`$CAT $agentHome/oraInst.loc|$GREP inventory_loc|cut -d "=" -f2`
                        logs=`ls -lrt   $inventory_loc/logs|tail -1|$CUT -d "_" -f2|$CUT -d "." -f1`
                        $CP $inventory_loc/logs/*$logs* $agentHome/cfgtoollogs/agentDeploy 1>>$filename 2>>$filename1
                        $ECHO "Check logs at $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename1	
		   exit 1
		fi
		LinkJdk
		PostInstall
		 #copying intall logs to agenthome for clone
                $ECHO "Copying Install logs to $agentHome/cfgtoollogs/agentDeploy ....." | $TEE -a $filename
                inventory_loc=`$CAT $agentHome/oraInst.loc|$GREP inventory_loc|cut -d "=" -f2`
                logs=`ls -lrt   $inventory_loc/logs|tail -1|$CUT -d "_" -f2|$CUT -d "." -f1`
                $CP $inventory_loc/logs/*$logs* $agentHome/cfgtoollogs/agentDeploy 1>>$filename 2>>$filename1

	fi
   fi
fi

if [ ! "$softwareFlag" ] ; then
	if [ ! "$upgradeFlag" ] ; then
		#$ECHO "$agentHome/oui/bin/runConfig.sh ORACLE_HOME=$agentHome RESPONSE_FILE=$agtRspFile ACTION=configure MODE=perform COMPONENT_XML={oracle.sysman.top.agent.11_1_0_1_0.xml} RERUN=true"
		#$agentHome/oui/bin/runConfig.sh ORACLE_HOME=$agentHome RESPONSE_FILE=$agtRspFile ACTION=configure MODE=perform COMPONENT_XML={oracle.sysman.top.agent.11_1_0_1_0.xml} RERUN=true
		$ECHO "$agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/oui/modules/OraInstaller.jar:$agentHome/oui/modules/emCfg.jar:$agentHome/jlib/agentInstaller.jar oracle.sysman.agent.installer.AgentFreshInstaller $agentHome $instHome $agentBaseDir RESPONSE_FILE=$agtRspFile $invswitch $args " | $TEE -a $filename
                $agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/oui/modules/OraInstaller.jar:$agentHome/oui/modules/emCfg.jar:$agentHome/jlib/agentInstaller.jar oracle.sysman.agent.installer.AgentFreshInstaller $agentHome $instHome $agentBaseDir RESPONSE_FILE=$agtRspFile $invswitch $args
	

        doDiscovery=""
        b_doDiscovery=`cat $agtRspFile|grep -i b_doDiscovery|cut -d"=" -f2`
	
	if [ "$b_doDiscovery" != "false" ] ; then
	        
	for v in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
	do
	 idx=`cat $instHome/sysman/emd/targets.xml|grep -i "host" |grep "oracle_emd"|wc -l`
	 if [ $idx -gt 0 ]; then
                   doDiscovery="success"
		   echo "Successfully Promoted agent and its related targets to Management Agent" | $TEE -a $filename	
		   break
		 else
		 doDiscovery="failed"
		   echo "Waiting for agent targets to get promoted..."
	         sleep 30

	  fi
	 
	done
	if [ "$doDiscovery" = "failed" ] ; then
		 echo "Promoting agent and its related targets to Management Agent failed" | $TEE -a $filename1
		 echo "Fix the cause of the error and retry the operation (or) manually run the following commands on the remote host" | $TEE -a $filename1
		 echo "$instHome/bin/emctl start agent" | $TEE -a $filename1
		 echo "$instHome/bin/emctl config agent addinternaltargets" | $TEE -a $filename1

	 exit 2	
	fi	
	fi

	else

  if [ "$sharedFlag" ] ; then
     $ECHO "$agentHome/oui/bin/attachHome.sh -attachHome -silent -force -nogenerateGUID  ORACLE_HOME=$agentHome -invPtrLoc $agentHome/oraInst.loc $javaOpt $runInstallerOpt" |$TEE -a $filename
     $agentHome/oui/bin/attachHome.sh -attachHome -silent -force -nogenerateGUID  ORACLE_HOME=$agentHome -invPtrLoc $agentHome/oraInst.loc $javaOpt $runInstallerOpt
    if [ $? -ne 0 ] ; then
		   $ECHO "Attaching agent oracle home failed." | $TEE -a $filename1 
		   exit 1
		else
		   $ECHO "Attaching agent oracle home completed successfully. $?" | $TEE -a $filename
		fi
    fi



		$ECHO "$agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/oui/modules/OraInstaller.jar:$agentHome/oui/jlib/xmlparserv2.jar:$agentHome/oui/jlib/srvm.jar:$agentHome/oui/jlib/emCfg.jar:$agentHome/jlib/agentInstaller.jar:$agentHome/oui/jlib/share.jar:$agentHome/jlib/emConfigInstall.jar oracle.sysman.agent.installer.AgentUpgradeInstaller ORACLE_HOME=$agentHome $archiveLoc $agentBaseDir $instHome AGENT_BASE_DIR=$agentBaseDir $invswitch $args " |$TEE -a $filename
		$agentHome/oracle_common/jdk/jre/bin/java -classpath $agentHome/oui/modules/OraInstaller.jar:$agentHome/jlib/agentInstaller.jar:$agentHome/jlib/emConfigInstall.jar oracle.sysman.agent.installer.AgentUpgradeInstaller ORACLE_HOME=$agentHome $invswitch $args
		
		#TODO : Add the code to deinstall the old oracle home
	fi	
fi

$CHMOD 755 $agentHome/plugins

exit 0
