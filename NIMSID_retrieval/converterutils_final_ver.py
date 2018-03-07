#!usr/bin/python

################################################################################################################################
## Author: Sammed N Mandape
## Date: 09/24/2013.
## This code is written as a part of Meharry Medical College.
##
################################################################################################################################

import urllib2
from xml.etree import ElementTree as ET

inputuser = raw_input("Enter the id[s] you want to convert (comma separated) and its type(pubmed or pmc), a semicolon between ids and type: ")
inputuser_list = inputuser.split(';')

url = 'http://www.pubmedcentral.nih.gov/utils/idconv.cgi?ids=%s&convtype=%s&outtype=xml' % (inputuser_list[0],inputuser_list[1])
data = urllib2.urlopen(url).read()

xml = ET.fromstring(data)
for item in (xml.findall('pair')):
	print 'Pubmed\t', item.find('pubmed').text
	print 'PMCid\t', item.find('pmc').text
	print 'NIHMSID\t', item.find('nihmsid').text
