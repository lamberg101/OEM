1.	ASH Report
	- Run ASH Report dibawah grafik Top Activity.
	- Sesuaikan
	- Generate report
	- setelah itu klik save file.
 

2.	AWR Report (automatic workload repository) 
	- Performance
	- AWR > AWR Report.
	- Sesuaikan
	- Generate report
	- Save file.
 @?/rdbms/admin/awrrpt.sql
 
3.	ADDM Report (automatic database diagnostic monitor) 
	- Performance > Adviors Home
	- Pilih ADDM
	- Sesuaikan start dan end time > Ok
	- View report
	- save file.
 

4.	Process & Session Limit Usage
	- Select Oracle Database > Monitoring > All Metrics
	- Pilih Database limits > Process limits usage (%) untuk melihat process limit usage
	- Pilih Database limit > Session limit usage (%)  untuk melihat session limits.
 

5.	Check cell performance
	- Specify nama dari cell yang ingin di Check.
	- Pilih Exadata Storage Server > Performance
	- Sesuaikan sesuai request dari user.
	- Contoh grafik dari flash, hard drive dan I/O utilization. 


6.	Check Query elapsed time.
	- Dibawah grafik Top Activity, klik sql_id yang ingin di Check elapsed time nya. 
	- Klik Statistic
	- Pilih historical 
	- Sesuaikan sesuai request.
 
8.	Server Utilization
	- Pada search target masukan nama server, lalu pilih Host
	- Done
 
9. Decom agent server
	- masuk ke server di oem
	- agent > target setup > agent decommision.