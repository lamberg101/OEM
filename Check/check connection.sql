nslookup bmioem
ping bmioem
telnet bmioem 4903
wget --no-check-certificate https://bmioem:4903/empbs/upload
curl -kv https://bmioem:4903/empbs/upload
netstat -an | grep 4903
