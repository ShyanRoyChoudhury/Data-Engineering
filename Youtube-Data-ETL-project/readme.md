# Youtube-Data-ETL-project
> In this project, I created a Data Pipeline using AWS and created a basic dashboard from the processed data


## 📚:Datasets:
* [Trending YouTube Video Statistics](https://www.kaggle.com/datasets/datasnaek/youtube-new)

 ## 🔧 Tools and Technologies:
* SQL
* Python3
* AWS S3, AWS IAM, AWS GLUE, AWS ATHENA, AWS LAMBDA, QuickSight

## 🏗️:Project Architecture:
> ETL architecture

![Data-Architecture](https://user-images.githubusercontent.com/83347717/201344688-22dbe224-dce2-460d-b1da-5e20f27a3a65.png)

## ☢️: Project Steps:
* Downloaded the datasets from kaggle.
* Uploaded the data from my local machine to S3 using AWS CLI commands. Separated the data stored in different folders based on their extension(CSV and JSON).
> s3_cli_command.sh
* Used Crawler in AWS Glue Catalog to crawl the data from JSON and CSV files from the raw bucket and store them in separate database which then could be queried in Athena.
* If problems arise as a result of data in JSON format, wrote a Python function using AWS Lambda to clean them up and convert them to parquet format.
> lambda_function.py

 ## :jigsaw: Resouces:
[Kaggle](https://www.kaggle.com/)
[YouTube Data Analysis | END TO END DATA ENGINEERING PROJECT](https://www.youtube.com/playlist?list=PLBJe2dFI4sguF2nU6Z3Od7BX8eALZN3mU)
