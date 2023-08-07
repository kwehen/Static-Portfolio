import requests 
import boto3
from botocore.exceptions import ClientError
import time

base_url = "https://website.com/"
pages = {"portfolio", "contact", "jondoe", "london", "graduation", "pelondon", "jacks", "rich", "nyc", "chamberlain", "idk"}
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0"
}

SENDER = "email@email.com"
RECIPIENT = "email@email.com"
# CONFIGURATION_SET = "ConfigSet"
AWS_REGION = "us-east-1"
SUBJECT = "Website Health Check"


# response = requests.get(base_url, verify=False, headers=headers)
# code = response.status_code

while True:
    for page in pages:
        response = requests.get(f'{base_url}{page}', headers=headers)
        code = response.status_code
        if code == 200:
            print(f"{base_url}{page} is healthy")
        else:
            print(f"{base_url}{page} is not responding properly, login and remediate error.")
            try:
                client = boto3.client('ses', region_name=AWS_REGION)
                response = client.send_email(
                    Destination={
                        'ToAddresses': [
                            RECIPIENT,
                        ],
                    },
                    Message={
                        'Body': {
                            'Text': {
                                'Charset': 'UTF-8',
                                'Data': f"{base_url}{page} is not responding properly, please remediate error.",
                            },
                        },
                        'Subject': {
                            'Charset': 'UTF-8',
                            'Data': SUBJECT,
                        },
                    },
                    Source=SENDER,
                    # ConfigurationSetName=CONFIGURATION_SET,
                )
            except ClientError as e:
                print(e.response['Error']['Message'])
            else:
                print("Email sent! Message ID:"),
                print(response['MessageId'])
    time.sleep(36000)

# Send SES email for the else statement. This also needs reformatted into a lambda function. 
