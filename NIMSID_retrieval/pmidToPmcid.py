import urllib
from bs4 import BeautifulSoup

soup = BeautifulSoup(urllib.urlopen("http://www.ncbi.nlm.nih.gov/pmc/pmctopmid/"))

#htmltext = BeautifulSoup.r

print (soup.prettify())
