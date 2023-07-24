from boto.cloudfront.distribution import Distribution
from boto.cloudfront import CloudFrontConnection
from botocore.signers import CloudFrontSigner
import datetime
import rsa

def rsa_signer(message):
    private_key = open('NAME_OF_PRIVATE_KEY.pem', 'r').read()
    return rsa.sign(message, rsa.PrivateKey.load_pkcs1(private_key.encode('utf8')),'SHA-1')

def lambda_handler(event, context):
    url = "PLACE.URL.HERE"
    expire_date = datetime.datetime(2024, 8, 1)
    key_id = 'KEY_ID_HERE'
    cf_signer = CloudFrontSigner(key_id, rsa_signer)
    signed_url = cf_signer.generate_presigned_url(url, date_less_than=expire_date)
    print(signed_url)
    return True
