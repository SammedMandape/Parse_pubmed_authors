#!usr/bin/python

import mechanize
#import cookielib
import shutil

#Browser
br = mechanize.Browser()

#Cookie Jar
#cj = cookielib.LWPCookieJar()
#br.set_cookiejar(cj)

#Broser options
#br.set_handle_equiv(True)
#br.set_handle_gzip(True)
#br.set_handle_redirect(True)

#Open site
br.open("http://www.ncbi.nlm.nih.gov/pmc/pmctopmid/")

# Prints forms
# for form in br.forms():
#	print "Form name:", form.name
#	print form

# Prints the forms and choose the form 2, indexing starts at 0
# >>> br.form = list(br.forms())
# >>> br.form
# [<mechanize._form.HTMLForm instance at 0x00000000032E9D88>, <mechanize._form.HTMLForm instance at 0x0000000003319A48>]
# >>> br.form = list(br.forms())[1]
# >>> br.form
# <mechanize._form.HTMLForm instance at 0x0000000003319A48>

# Iterates through the controls in the form
# for control in br.form.controls:
#	print control
#	print "type=%s, name=%s, value=%s" % (control.type, control.name, br[control.name])

# Get the control item names
# options = [item.name for item in br.form.find_control('PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.from_db').items]
#
# Another way to select checkbox:
# br.form.find_control(name='PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.from_db').items[0].selected = True


br.form = list(br.forms())[1]
#br.form['PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.from_db'] = ['from_pmid']
br.form.find_control(name="PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.from_db").items[0].selected = True
br.form["PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.Ids"] = "21707345"
br.form.find_control(name="PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.ToFile").items[0].selected = True
br.form.find_control(name="ConvertButton").selected = True
with open("output_converter.csv",'wb') as f:
	shutil.copyfileobj(br.submit(),f)

