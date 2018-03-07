from ftplib import FTP
import gzip
import StringIO

ftp = FTP('ftp.ncbi.nlm.nih.gov')
ftp.login() # Username: anonymous password: anonymous@

sio = StringIO.StringIO()
def handle_binary(more_data):
    sio.write(more_data)

resp = ftp.retrbinary("RETR pub/pmc/PMC-ids.csv.gz", callback=handle_binary)
sio.seek(0) # Go back to the start
zippy = gzip.GzipFile(fileobj=sio)

uncompressed = zippy.read()

#for line in uncompressed.splitlines():
#	if re.search('22374506', line):
#		print line


# for line in uncompressed.splitlines():
	# if re.search('123', line):
		# line1 = line.split(',')
		# if(not line1[10]):
			# print line1[8],"\t","NA"
		# elif(not line1[8] and not line1[10]):
			# print "ALERT! No PMCID and no NIHMSID. Do you want to continue NIH funding?"
			
for line in uncompressed.splitlines():
	if re.search('22374506', line):
		print line