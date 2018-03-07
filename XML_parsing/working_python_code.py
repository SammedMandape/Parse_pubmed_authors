for contrib in root.iter('contrib-group'):
	for author in contrib.findall('aff'):
		aff = author.get('id')
		text = author.text
		print text		
		
for contrib in root.iter('contrib-group'):
	for author in contrib.findall('contrib'):
		aff = author.find('aff').text
		print aff
		
		
for author in root.iter('name'):
	lastname = author.find('surname').text
	firstname = author.find('given-names').text
	print lastname, firstname
	

for contrib in root.iter('contrib'):
	if contrib.get('contrib-type') == 'author':
		for author in contrib.iter('name'):
			lastname = author.find('surname').text
			firstname = author.find('given-names').text
			print lastname, firstname
			
for contrib in tree.iter('article-meta'):
	for i in contrib.xpath("./contrib-group/contrib[@contrib-type='author']"):
		print i.xpath("./name/surname/text() | ./name/given-names/text()")

		
for contrib in tree.iter('article-meta'):
	for i in contrib.xpath("./contrib-group/contrib[@contrib-type='author']"):
		mylist = i.xpath("./name/surname/text() | ./name/given-names/text()")
		print ','.join(map(str, mylist))
		
		
for contrib in tree.iter('article-meta'):
	for i in contrib.xpath("./contrib-group/contrib[@contrib-type='author']"):
		print ', '.join(i.xpath("./name/surname/text() | ./name/given-names/text()"))