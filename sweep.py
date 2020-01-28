import subprocess 

for ip in range(2,254): 
	address = "10.11.1." + str(ip)
	res = subprocess.call(['ping', '-c', '3', address]) 
	if results == 0: 
		print( "ping to", address, "OK") 
	elif results == 2: 
		print("no response from", address) 
	else: 
		print("ping to", address, "failed!") 

