import sys

from pyspark.sql import SparkSession

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: wordcount <file>", file=sys.stderr)
        sys.exit(-1)

    spark = SparkSession\
        .builder\
        .appName("Python DataFrame WordCount")\
        .getOrCreate()

    dataframe = spark.read.csv(sys.argv[1])
    #dataframe.printSchema()
    #dataframe.show(truncate=False)

    wordcount = dataframe.groupBy("_c0").count()
    #wordcount.printSchema()
    wordcount.show(truncate=False)

    spark.stop()