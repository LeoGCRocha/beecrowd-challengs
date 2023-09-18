import os
import weasyprint
import boto3
import os

# Initialize the S3 client
s3 = boto3.client('s3')
# Specify the S3 bucket and object key
bucket_name = os.environ['BUCKET_NAME']
object_key = 'input/index.html'
# Download the file from S3 and write it to the local file
response = s3.get_object(Bucket=bucket_name, Key=object_key)
html = response['Body'].read().decode('utf-8')
pdf = weasyprint.HTML(string=html).write_pdf()

# Save the PDF to a file
with open('index.pdf', 'wb') as pdf_file:
    pdf_file.write(pdf)
s3.upload_file('index.pdf', bucket_name, 'output/index.pdf')