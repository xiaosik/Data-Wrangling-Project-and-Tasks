library(rsparkling)
library(sparklyr)
library(h2o)
h2o.init()
library(dplyr)
#sc <- spark_connect(master = "local")
sc <- spark_connect("local", version = "2.1.0")
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
