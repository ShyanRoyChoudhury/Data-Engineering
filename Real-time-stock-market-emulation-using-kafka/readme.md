# Real-time-stock-market-emulation-using-kafka
In this very exciting project, I have created a model to emulate a toned down version of realtime stock market scenario using kafka. Where data is constanly being generated from the stock prices and updated on the database. I have used a pre-recorded dataset to sample data from it and the generated data is constantly being  uploaded to AWS glue database.

## 📚:Datasets:
* [S&P 500 Stocks (daily updated)](https://www.kaggle.com/datasets/andrewmvd/sp-500-stocks)

## 🔧:Technologies used:
* AWS EC2
* AWS S3
* AWS Athena
* AWS Glue Crawler
* AWS IAM
* Kafka
* Google Colab

## 🏗️:Project Architecture:
> Project Architecture

![architecture](./Real-time-stock-market-emulation-using-kafka/architecture.jpg)
## ☢️: Project Steps:
* Download the datasets from kaggle.
* Create a t2-micro(free-tier) linux instance on AWS EC2. Create a keygen pair(.ppk file) and save in local machine. Then connect to cloud instance from local machine using Putty.
* Download and install all the required libraries(kafka, JVM). Extract the files into a certain folder. Open the folder where kafka is installed.
* Start zookeeper service. This would occupy the current terminal. Concurrently connect to instance using putty again and change directory to kafka folder. 
* Before starting kafka server. Allocate more ram to kafka server. Start kafka server.
* Follow the previous steps of connecting to instance and create Two topics in kafka server.
* Follow the previous steps of connecting to instance again and start kafka producer and kafka consumer.
* Once they are all up and running. Switch to google colab. Create two notebooks. One for producer and another for consumer.
* Download and Set up all required connections in order to connect the notebooks with ec2 instance.
* Now using an infinite loop create samples of data and pass it to the kafka-producer. 
* Since we are using a simple architecture with 1 partition. If we continue to create data and pass it to consumer. Our server crashes. So we will pass data to the producer for a small amount of time.
* We can check that the data is now visible in kafka-consumer. Upload this data to a S3 bucket in 1 sec intervals.
* Setup a crawler to crawl through the generated data and create a database.
* Once crawled we can check the tables of data in the database in AWS Athena.

GG. 

## :jigsaw: Resouces:
[Kaggle](https://www.kaggle.com/)
[Stock Market Real-Time Data Analysis Using Kafka](https://www.youtube.com/watch?v=KerNf0NANMo&t=1s)

### Give a 🌟 if you liked this project 
