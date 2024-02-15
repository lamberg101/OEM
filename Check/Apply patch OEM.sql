Transfer the downloaded file to the OMS host, and run following command to import it to Enterprise Manager
emcli import_update -omslocal -file=p22344004_112000_Generic.zip

Transfer the downloaded file to any managed host in your environment, and run following command to import it to Enterprise Manager
emcli import_update -host=<hostname> -file=p22344004_112000_Generic.zip <host credential options>



--------


Use the following link to download the latest updates catalog

https://updates.oracle.com/Orion/Download/download_patch/p9348486_112000_Generic.zip

Once catalog is downloaded, it can be imported to Enterprise Manager in one of the following ways:

	Transfer the catalog to an OMS host, and run the following command to import it to Enterprise Manager
	emcli import_update_catalog -file=<catalog file name with full path> -omslocal

	Transfer the catalog to any managed host in your environment, and run following command to import it to Enterprise Manager
	emcli import_update_catalog -file=<catalog file name with full path> -host=<host name> <host credential options>
