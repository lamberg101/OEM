set lines 200
col SNAP_INTERVAL format a20
col RETENTION format a20
select * from dba_hist_wr_control;

 DBID              SNAP_INTERVAL        RETENTION            TOPNSQL
---------- -------------------- -------------------- ---------- ----------------------------
3275747663    +00000 01:00:00.0          +00008 00:00:00.0    DEFAULT

--Here interval is set to 1 hour and retention is set to 8 days.
--You can also create a snapshot manually by executing following procedure
SQL> exec dbms_workload_repository.create_snapshot;

PL/SQL procedure successfully completed.

--Now let’s change the retention and interval settings. Interval will be set to 15 minutes and retention to 30 days (30x24x60 = 50400)

SQL> exec dbms_workload_repository.modify_snapshot_settings(interval => 15, retention => 43200)

PL/SQL procedure successfully completed.

SQL> select * from dba_hist_wr_control;

 DBID              SNAP_INTERVAL        RETENTION            TOPNSQL
---------- -------------------- -------------------- -------------------------------------
3275747663    +00000 00:15:00.0         +00030 00:00:00.0    DEFAULT

