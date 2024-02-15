--backup identified value existing
select password from sys.user$ where name='DBSNMP';
4549E1232706A4C3
ALTER USER DBSNMP IDENTIFIED BY DbsnmpBMI#2023;
DbsnmpBMI#2023

------------------------------------------------------------------------------------------

Database system: Oracle Database

ORACLE_SID=bmiprd1
ORACLE_BASE=/oracle/app/oracle
ORACLE_HOME=/oracle/app/oracle/product/11.2.0.4

--Conn string:
BMIDR=
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = mcbdbdrcscan.muamalatbank.com)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = bmidr.muamalatbank.com)
    )
  )

--check cluster
olsnodes
crsctl stat res -t

--Listener machine name
to the hostname or IP address of the server where the database listener is running.


--HOST
mcbdbdrc01
mcbdbdrc02
mcbdbdrc03

--Instance
bmiprd1
bmiprd3
bmiprd2


-rw-r-----. 1 oracle oracle  3019908 Jul  5 16:39 emoms.trc
-rw-r-----. 1 oracle oracle  8026926 Jul  5 16:39 emoms.log
-rw-r-----. 1 oracle oracle   609666 Jul  5 16:53 emctl.log
[oracle@bmioem log]$
[oracle@bmioem log]$ pwd /oracle/app/oracle/gc_inst/em/EMGC_OMS1/sysman/log
