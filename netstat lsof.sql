--Check using netstat/lsof

Case:
When starting the agent, error was encountered with details 3872 already used.
If agent port number is 3872 then.

$ netstat -nap | grep 3872 
OR 
$ /sbin/lsof -i :3872 

Note: Executing the above commands may require root privileges 

2. Kill the process id using 
$ kill -9 <process id> 