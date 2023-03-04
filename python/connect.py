# import urllib library
from urllib.request import urlopen

# import json
import json
# store the URL in url as
# parameter for urlopen
url = "http://ergast.com/api/f1/drivers.json?limit=10"

# store the response of URL
response = urlopen(url)

# storing the JSON response
# from url in data
data_json = json.loads(response.read())

# print the json response
print(data_json)


for i in data_json['MRData']['DriverTable']['Drivers']:
    print(i['url'])
