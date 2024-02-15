Note!
1. yg standby jgn di apa2kan

Sebelum merubah retention di awr pastikan dulu space di tablespace sysaux mencukupi dengan cara:

$ cd $ORACLE_HOME/rdbms/admin
$ sqlplus / as sysdba
SQL> @utlsyxsz

input retention yang diinginkan, akan muncul estimasi berapa tablespace sysaux yang dibutuhkan.

setelah estimasi tablespace sysaux sudah didapat dan diupdate kemudian kita eksekusi.


example : kita merubah snap interval dari 1jam menjadi 15menit dan retentionnya dari 8 hari menjadi 35 hari:

set lines 200
col SNAP_INTERVAL format a20
col RETENTION format a20
select * from dba_hist_wr_control;

 DBID              SNAP_INTERVAL        RETENTION            TOPNSQL
---------- -------------------- -------------------- ---------- ----------------------------
3275747663    +00000 01:00:00.0          +00008 00:00:00.0    DEFAULT

--Here interval is set to 1 hour and retention is set to 8 days.
--You can also create a snapshot manually by executing following procedure

SQL> exec dbms_workload_repository.create_snapshot;

PL/SQL procedure successfully completed.

--Now let’s change the retention and interval settings. Interval will be set to 15 minutes and retention to 35 days (35x24x60 = 50400)

SQL> exec dbms_workload_repository.modify_snapshot_settings(interval => 15, retention => 50400)

PL/SQL procedure successfully completed.

SQL> select * from dba_hist_wr_control;

 DBID              SNAP_INTERVAL        RETENTION            TOPNSQL
---------- -------------------- -------------------- -------------------------------------
3275747663    +00000 00:15:00.0         +00035 00:00:00.0    DEFAULT