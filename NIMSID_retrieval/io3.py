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
