#!/bin/bash

start-all.sh && sleep 30

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-rdd.py 1000000.csv && sleep 20

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-rdd.py 10000000.csv && sleep 20

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-rdd.py 100000000.csv && sleep 20

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-df.py 1000000.csv && sleep 20

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-df.py 10000000.csv && sleep 20

spark-submit --master spark://192.168.31.136:7077 --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount-df.py 100000000.csv && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_rdd_1m_2.12-1.0.jar && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_rdd_10m_2.12-1.0.jar && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_rdd_100m_2.12-1.0.jar && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_df_1m_2.12-1.0.jar && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_df_10m_2.12-1.0.jar && sleep 20

spark-submit --class wordcount --deploy-mode client --executor-memory 6G --executor-cores 4 wordcount_df_100m_2.12-1.0.jar && sleep 20
