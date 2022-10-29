**In this project**, I have created a basic ETL pipeline using python in AWS. The raw data was initially uploaded to a S3 bucket. Then using crawler, the raw data was crawled and uploaded to Athena and then Quering. The queried data was then uploaded back to s3 bucket. Then a cluster was created in redshift to copy the data from s3 using aws glue. The technologies used in this project are: 
- Python
- AWS S3
- AWS Athena
- AWS Glue
- AWS Redshift



The raw data are in csv, json format. Few of the datasets were corrupt so it required little bit of tweaking.
:paperclip: Datesets used in Project: https://aws.amazon.com/blogs/big-data/exploring-the-public-aws-covid-19-data-lake/
