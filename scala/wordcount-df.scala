import org.apache.spark.sql.SparkSession

object wordcount {
    def main(args: Array[String]) {
        val file = "1000000.csv"
        val spark: SparkSession = SparkSession.builder
                                              .appName("Scala WordCount DF")
                                              .master("spark://192.168.31.136:7077")
                                              .getOrCreate()

        val df = spark.read.csv(file)
        // df.show(10,truncate=false)
        
        val wordcount = df.groupBy("_c0").count()
        wordcount.show(20, truncate=false)
        
        spark.stop()
    }
}
