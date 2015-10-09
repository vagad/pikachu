import json
from pprint import pprint
from parse_rest.datatypes import Object as ParseObject
from parse_rest.connection import register

APPLICATION_ID = "2yokKd96SUq3dKCQDcSI7LlGPJ7ZddnCMwbCIvX7"
REST_API_KEY = "MyfLxYfGm8iaxVahmsTCeKSNNuiz2wKzkQIOCyhS"

register(APPLICATION_ID, REST_API_KEY)

def uploadToParse(newClass):
	print(newClass['CallNumber'])
	newClass = ParseObject.extend("class_data")
	newClass.class_code = newClass['Course']
	newClass.instructor = newClass['Instructor1Name']
	newClass.name = newClass['CourseTitle']
	newClass.start_time, newClass.end_time, newClass.location = parseMeetString(newClass['Meets1'])
	newClass.save()


def parseMeetString(meetString):

with open('doc.json') as data_file:
	data = json.load(data_file)
for course in range(len(data)):
	uploadToParse(data[course])
