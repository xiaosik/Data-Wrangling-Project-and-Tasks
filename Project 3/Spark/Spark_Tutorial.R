library(sparklyr)
library(rsparkling)
library(h2o)
library(dplyr)
library(dbplyr)
spark_install()
sc <- spark_connect("local")
sc <- spark_connect("local",version = "3.0.0")


iris_tbl <- copy_to(sc, iris)
flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
batting_tbl <- copy_to(sc, Lahman::Batting, "batting")
filter_spl<-flights_tbl %>% filter(dep_delay == 2)
delay <- flights_tbl %>%
  group_by(tailnum)%>%
  summarise(count = n(), dist = mean(distance), delay = mean(arr_delay)) %>%
  filter(count > 20, dist < 2000, !is.na(delay)) %>%
  collect()
##flights_tbl %>% filter(dep_delay == 2)

library(ggplot2)
ggplot(delay, aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area(max_size = 2)
###Using SQL
library(DBI)
iris_preview <- dbGetQuery(sc, "SELECT * FROM iris LIMIT 10")

# copy mtcars into spark
mtcars_tbl <- copy_to(sc, mtcars)

# transform our data set, and then partition into 'training', 'test'
partitions <- mtcars_tbl %>%
  filter(hp >= 100) %>%
  mutate(cyl8 = cyl == 8) %>%
  sdf_random_split(training = 0.5, test = 0.5, seed = 1099)

fit <- partitions$training %>%
  ml_linear_regression(response = "mpg", features = c("wt", "cyl"))
summary(fit)

# convert to h20_frame (uses the same underlying rdd)
training <- as.h2o(partitions$training)
test <- as.h2o(partitions$test)

# fit a linear model to the training dataset
fit <- h2o.glm(x = c("wt", "cyl"),
               y = "mpg",
               training_frame = training)

###using sparklingR
h2oConf <- H2OConf()
hc <- H2OContext.getOrCreate(h2oConf)
library(dplyr)
mtcars_tbl <- copy_to(sc, mtcars, overwrite = TRUE)
mtcars_tbl
mtcars_hf <- hc$asH2OFrame(mtcars_tbl)
mtcars_hf
mtcars_glm <- h2o.glm(x = c("wt", "cyl"),
                      y = "mpg",
                      training_frame = mtcars_hf,
                      lambda_search = TRUE)
mtcars_glm

partitions <- mtcars_tbl %>%
  filter(hp >= 100) %>%
  mutate(cyl8 = cyl == 8) %>%
  sdf_random_split(training = 0.5, test = 0.5, seed = 1099)
training <- hc$asH2OFrame(partitions$training)
testing <- hc$asH2OFrame(partitions$test) 
glm_model <- h2o.glm(x = c("wt", "cyl"), 
                     y = "mpg", 
                     training_frame = training,
                     lambda_search = TRUE)
glm_model

# inspect the model
print(fit)

# inspect the model
print(fit)

###READ/WRITE IN VARIOU 
temp_csv <- tempfile(fileext = ".csv")
temp_parquet <- tempfile(fileext = ".parquet")
temp_json <- tempfile(fileext = ".json")

spark_write_csv(iris_tbl, temp_csv)
iris_csv_tbl <- spark_read_csv(sc, "iris_csv", temp_csv)
tempfile <- tempfile(fileext = ".csv")
write.csv(nycflights13::flights, tempfile, row.names = FALSE)
spark_write_parquet(iris_tbl, temp_parquet)
iris_parquet_tbl <- spark_read_parquet(sc, "iris_parquet", temp_parquet)

spark_write_json(iris_tbl, temp_json)
iris_json_tbl <- spark_read_json(sc, "iris_json", temp_json)

src_tbls(sc)

spark_disconnect(sc)
