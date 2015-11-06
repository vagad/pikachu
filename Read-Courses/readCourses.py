import json
from pprint import pprint
from parse_rest.connection import register, ParseBatcher
from parse_rest.datatypes import Object as ParseObject
from parse_rest.datatypes import ParseType, ParseResource

APPLICATION_ID = "2yokKd96SUq3dKCQDcSI7LlGPJ7ZddnCMwbCIvX7"
REST_API_KEY = "MyfLxYfGm8iaxVahmsTCeKSNNuiz2wKzkQIOCyhS"

register(APPLICATION_ID, REST_API_KEY)

with open('doc.json') as data_file:
	data = json.load(data_file)
data_to_upload = []
for course in range(len(data)):
	current = data[course]
	if current['Term'] == '20151':
		if current['DivisionCode'] == 'CC' or current['DivisionName'] == 'SCH OF ENGR & APP SCI: UGRAD' or current['DivisionCode'] == 'BC' or current['DivisionCode'] == 'GS':
				newClass = ParseObject()
				newClass.class_code = current['Course']
				newClass.instructor = current['Instructor1Name']
				newClass.name = current['CourseTitle']
				#call function that gets location, start, and end time
				#newClass.location, newClass.startTime, newClass.endTime = parseMeetString(current)
				data_to_upload.append(newClass)

batcher = ParseBatcher()
for x in range(0, len(data_to_upload), 50):
	batcher.batch_save(data_to_upload[x: (x+50) < len(data_to_upload) ? x+50 : len(data_to_upload)])
