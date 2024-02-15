--Change snapshot interval

STEP 1: Check the Database name and DBID.
SQL> select name,dbid from v$database;

STEP 2: Check the existing snapshot_interval time
SQL> select extract( day from snap_interval) *24*60+extract( hour from snap_interval) *60+extract( minute from snap_interval ) snapshot_interval,
extract( day from retention) *24*60+extract( hour from retention) *60+extract( minute from retention ) retention_interval
from dba_hist_wr_control;

STEP 3: Modify the existing snapshot interval
BEGIN
  DBMS_WORKLOAD_REPOSITORY.modify_snapshot_settings(
    retention => 43200,        -- Minutes (= 30 Days). Current value retained if NULL.
    interval  => 30);          -- Minutes. Current value retained if NULL.
END;

