1. Check the temprary disk, ram, cpu, etc.
2. Identifying the Installed Packages. (2-2)

check user:
$ more /etc/oraInst.loc


set serveroutput on
declare
oms_guids mgmt_medium_string_array := mgmt_medium_string_array();
oms_names mgmt_medium_string_array := mgmt_medium_string_array();
mismatches smp_emd_nvpair_array := smp_emd_nvpair_array();
begin
select host_url, em_plugin_util.get_guid_from_name(unique_oms_name)
bulk collect into oms_names, oms_guids
from gc_oms_info;
for j in 1..oms_guids.count
loop
dbms_output.put_line('Checking mismatch for OMS ' || oms_names(j));
mismatches := smp_emd_nvpair_array();
em_plugin_inventory.get_plugin_mismatch(oms_guids(j), mismatches);
if mismatches is null or mismatches.count = 0
then
dbms_output.put_line('No mismatch found for OMS ' || oms_names(j));
else
dbms_output.put_line('Mismatch found for OMS ' || oms_names(j));
for i in 1..mismatches.count
loop
dbms_output.put_line('Plug-in on repository: ' || nvl(mismatches(i).name, 'None') ||
', Plug-in on OMS: ' || nvl(mismatches(i).value, 'None'));
end loop;
end if;
end loop;
end;
/