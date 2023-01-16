#method:1 Extract metadata with metaserver
import requests
import json

metaserver_url= "http://metadata.google.internal/computeMetadata/v1/"
key = "instance/id"
url = metaserver_url + key
meta_output = requests.get(url, headers={'Metadata-Flavor': 'Google'})
json_output = json.dumps(meta_output.text)
print(json_output)



#method:2 Extract metadata with client libraries
import json
import googleapiclient.discovery
from google.oauth2 import service_account

authorization = service_account.Credentials.from_service_account_file('insert credentails file path', scopes=["https://www.googleapis.com/auth/compute.readonly"])
compute_client = googleapiclient.discovery.build('compute', 'v1', credentials=authorization) 
meta_output = compute_client.instances().get(project='insert-project-id', zone='insert-zone', instance='insert-instance-name').execute()
json_output = json.dumps(meta_output, indent=4)
print(json_output)
print(json_output.get('id')) #extracts instance_id with "id" key
