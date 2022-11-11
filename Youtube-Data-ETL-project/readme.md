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
> [s3_cli_command.sh](https://github.com/ShyanRoyChoudhury/Data-Engineering/blob/83afa9cd1a3ddb35bce5796f7d997b68c4ee7d76/Youtube-Data-ETL-project/s3_cli_command.sh)
* Used Crawler in AWS Glue Catalog to crawl the data from JSON and CSV files from the raw bucket and store them in separate database which then could be queried in Athena.
* If problems arise as a result of data in JSON format, wrote a Python function using AWS Lambda to clean them up and convert them to parquet format.
> [lambda_function.py](https://github.com/ShyanRoyChoudhury/Data-Engineering/blob/main/Youtube-Data-ETL-project/lambda_function.py)
* Added a trigger to the Lambda function to run whenever any data with .json extension would added to the S3 bucket, and the output was to be saved in a database in Athena.
* Converted the CSV files into parquet format with help of AWS Glue ETL.
> [glue-script.py](https://github.com/ShyanRoyChoudhury/Data-Engineering/blob/10dd643852682565bf0c6ddcc7102f5a59e02dfe/Youtube-Data-ETL-project/glue-script.py)
* Created another Glue Crawler to crawl the clean data into the clean_database.
* After all the clean parquet files are converted from CSV and JSON files, they is present in the same database, did an ETL job using AWS Glue Studio to join both the tables and store it in a separate S3 bucket intended to use for Analytics purposes.
> [joining-script.py](https://github.com/ShyanRoyChoudhury/Data-Engineering/blob/10dd643852682565bf0c6ddcc7102f5a59e02dfe/Youtube-Data-ETL-project/joining-script.py)


![ETL-Joining_Data](https://user-images.githubusercontent.com/83347717/201347694-fa0b8a3a-4ea5-4baf-b443-43d573beb289.png)

* GG. The data is now ready!!!!! 👍
 ## :jigsaw: Resouces:
[Kaggle](https://www.kaggle.com/)
[YOUTUBE DATA ANALYSIS - DATA ENGINEERING PROJECT](https://www.youtube.com/playlist?list=PLBJe2dFI4sguF2nU6Z3Od7BX8eALZN3mU)


### [QuickSight Dashboard](https://github.com/ShyanRoyChoudhury/Data-Engineering/blob/main/Youtube-Data-ETL-project/Youtube%20de%20dashboard.pdf)

### Give a 🌟 if you liked this project 
