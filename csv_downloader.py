import requests
import csv
import os

QUERY_ID=os.getenv('QUERY_ID')
API_KEY=os.getenv('API_KEY')
API_ENDPOINT="https://api.dune.com/api/v1/query/%s/results?api_key=%s" % (QUERY_ID, API_KEY)
OUTPUT_FILE=os.getenv('OUTPUT_FILE')

result = requests.get(API_ENDPOINT)
data = result.json()[0]['result']

with open(OUTPUT_FILE, 'w') as file:
    writer = csv.writer(file)
    # header
    writer.writerow(['address', 'amount'])
    # content
    for row in data['rows']:
        writer.writerow([row['address'], row['amount']])

    file.close()