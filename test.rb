#!/usr/bin/ruby

#puts 'Hello World'

require 'mechanize'
 
agent = Mechanize.new
page  = agent.get("http://www.ncbi.nlm.nih.gov/pmc/pmctopmid/")
form = page.forms[1]
# select the radio button by value
form.radiobutton_with(:value => "from_pmid").check
# select the text area by name and set values
form["PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.Ids"] = "21707345\n23482678"
# select the CSV checkbox by name
form.checkbox_with(:name => "PAFAppLayout.AppController.Page.PMCToPmidC.MainPortlet.ToFile").check
f = agent.submit(form, form.buttons[1])
f.save "ids.txt"