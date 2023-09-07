import os
import requests
import boto3
import time
from botocore.exceptions import ClientError

base_url = "https://website.com/"
pages = {"portfolio", "contact", "jondoe", "london", "graduation", "pelondon", "jacks", "rich", "nyc", "chamberlain", "about", "modeling", "brands", "street", "individuals", "duce", "b2tm", "peatl", "waterfall"}
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0"
}

SENDER = "email@email.com"
RECIPIENT = "email@email.com"
AWS_REGION = "us-east-1"
SUBJECT = "Website Health Check"

def lambda_handler(event, context):
    for page in pages:
        response = requests.get(f'{base_url}{page}', headers=headers)
        code = response.status_code
        if code == 200:
            print(f"{base_url}{page} is healthy")
        else:
            print(f"{base_url}{page} is not responding properly, please remediate the error.")
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
                                'Data': f"{base_url}{page} is not responding properly, please remediate the error.",
                            },
                        },
                        'Subject': {
                            'Charset': 'UTF-8',
                            'Data': SUBJECT,
                        },
                    },
                    Source=SENDER,
                )
            except ClientError as e:
                print(e.response['Error']['Message'])
            else:
                print("Email sent! Message ID:")
                print(response['MessageId'])
