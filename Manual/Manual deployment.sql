Install agent OEM
1.	Pre-requisites
-- add ip,hostname in /etc/hosts (both) 


2.	Create Directory Di Server Target
cd /apps/oracle
mkdir agent13c

3.	Download Source Engine Agent (Di Server Oem)
/*
./emcli login -username=sysman
./emcli sync
./emcli get_supported_platforms
./emcli get_agentimage -destination=/home/oracle/image_aix -platform="IBM AIX on POWER Systems (64-bit)"
*/


4.	Copy Source (13.3.0.0.0_AgentCore_226.zip) Ke Server Target
--Note! Jika perlu dengan user root, change owner file .zip ke user oracle.
 

5.	Unzip file
--$> unzip 13.3.0.0.0_AgentCore_226.zip


6.	add agent.rsp di server target
/*
OMS_HOST=10.55.60.193
EM_UPLOAD_PORT=4903
AGENT_REGISTRATION_PASSWORD=oracle123
AGENT_PORT=3872
b_forceConfigure=true
*/ 


7.	Run Agent Deploy (di server target)

./agentDeploy.sh -force AGENT_BASE_DIR=/fcubs/backup/agent/agent_vip1 RESPONSE_FILE=/fcubs/backup/agent/agent_vip1/agent.rsp ORACLE_HOSTNAME=mcbdbdrc01-vip.bankmuamalat.co.id > Install.log &

--Jalankan script diatas dalam 1 baris.
--Process ini akan berlangsung kurang lebih 15-20 menit.


5.	Finishing
--Note! apabila ada error dan oms nya belum kebaca jalankan di bawah.

cd /apps/oracle/agent13c/agent_13.3.0.0.0/bin
/*
./emctl status agent
./emctl stop agent
cd /apps/oracle/agent13c/agent_inst/sysman/emd/upload
rm -rf *
cd ../state
rm -rf *

cd /apps/oracle/agent13c/agent_13.3.0.0.0/bin
./emctl start agent
./emctl status agent
./emctl upload agent
./emctl config agent addinternaltargets
./emctl secure agent

./emctl stop agent
./emctl clearstate agent
./emctl start agent
./emctl status agent
./emctl upload
./emctl status agent
*/
 

--sysman/oracle123
--agent registration password/oracle123

Note!
Heartbeat status dari OMS is unreachable to (none)
Jalankan semua command diatas sampai Heartbeat status nya OK.
lalu cek ke OEM (oracle entreprise manager) apakah sudah terdaftar dan status host nya sudah up.