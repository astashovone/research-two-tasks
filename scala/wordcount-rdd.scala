import org.apache.spark.sql.SparkSession

object wordcount {
    def main(args: Array[String]) {
        val file = "1000000.csv"
        val spark: SparkSession = SparkSession.builder
                                              .appName("Scala WordCount RDD")
                                              .master("spark://192.168.31.136:7077")
                                              .getOrCreate()
        val fileRdd = spark.sparkContext.textFile(file)

        // create the counts
        val counts = fileRdd.map(_.replaceAll("[.,]", ""))
                            .map(_.replace("—", " "))
                            .flatMap(line => line.split(" "))
                            .map(word => (word, 1))
                            .reduceByKey(_ + _)
                            .sortBy(_._2)
                            .collect

        println( "------------------------------------------")
        counts.foreach(println)
        println( "------------------------------------------")

        spark.stop()
    }
}