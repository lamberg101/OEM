
IP Source:
telnet 10.55.60.193 4889
telnet 10.55.60.193 4903
telnet 10.55.60.193 3872

IP Target:
10.81.100.91
10.81.6.16
10.81.100.12
10.55.54.75

telnet 10.81.100.12 4889
telnet 10.81.100.12 4889

PORT: 
telnet 10.81.100.91 4889
telnet 10.81.6.16 4889
telnet 10.81.100.12 4889
telnet 10.55.54.75 4889

telnet 10.81.100.91 4903
telnet 10.81.6.16 4903
telnet 10.81.100.12 4903
telnet 10.55.54.75 4903




a.)Verify the following commands from the agent server 
nslookup bmioem.bankmuamalat.co.id
ping bmioem.bankmuamalat.co.id
ping bmioem
telnet 10.55.60.193 4903
curl -kv https://bmioem:4903/empbs/upload
wget --no-check-certificate https://bmioem:4903/empbs/upload



uat01-mcb-app 
MCBAPPDR2 MCBAPPDR2.bankmuamalat.co.id
FUTMCB FUTMCB.bankmuamalat.co.id
mcbdbconsuat mcbdbconsuat.bankmuamalat.co.id



nslookup mcbdbconsuat.bankmuamalat.co.id
ping mcbdbconsuat.bankmuamalat.co.id 
telnet mcbdbconsuat.bankmuamalat.co.id 3872
wget --no-check-certificate https://mcbdbconsuat:3872/emd/main/
curl -kv https://mcbdbconsuat:3872/emd/main/


