import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node AWS Glue Data Catalog
AWSGlueDataCatalog_node1668159014078 = glueContext.create_dynamic_frame.from_catalog(
    database="youtube_de_cleaned_useast1",
    table_name="raw_statistics",
    transformation_ctx="AWSGlueDataCatalog_node1668159014078",
)

# Script generated for node AWS Glue Data Catalog
AWSGlueDataCatalog_node1668158961629 = glueContext.create_dynamic_frame.from_catalog(
    database="youtube_de_cleaned_useast1",
    table_name="cleaned_statistics_reference_data_useast1",
    transformation_ctx="AWSGlueDataCatalog_node1668158961629",
)

# Script generated for node Join
Join_node1668159084727 = Join.apply(
    frame1=AWSGlueDataCatalog_node1668159014078,
    frame2=AWSGlueDataCatalog_node1668158961629,
    keys1=["category_id"],
    keys2=["id"],
    transformation_ctx="Join_node1668159084727",
)

# Script generated for node Amazon S3
AmazonS3_node1668159249786 = glueContext.getSink(
    path="s3://youtube-de-analytical-bucket",
    connection_type="s3",
    updateBehavior="UPDATE_IN_DATABASE",
    partitionKeys=["region", "category_id"],
    compression="snappy",
    enableUpdateCatalog=True,
    transformation_ctx="AmazonS3_node1668159249786",
)
AmazonS3_node1668159249786.setCatalogInfo(
    catalogDatabase="youtube_de_analytics", catalogTableName="final_analytics"
)
AmazonS3_node1668159249786.setFormat("glueparquet")
AmazonS3_node1668159249786.writeFrame(Join_node1668159084727)
job.commit()
