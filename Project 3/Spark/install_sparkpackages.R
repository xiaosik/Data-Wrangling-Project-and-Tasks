#detach loaded libraries
detach("package:rsparkling", unload = TRUE)
if ("package:h2o" %in% search()) {detach("package:h2o", unload = TRUE)}
if (isNamespaceLoaded("h2o")) { unloadNamespace("h2o") }
# remove h2o from your installation
remove.packages("h2o", lib = .libPaths()[1])
install.packages("rsparkling")
install.packages("h2o")
install.packages("h2o", type = "source",
                 repos = "http://h2o-release.s3.amazonaws.com/h2o/rel-tverberg/2/R")
  
  # spark_available_versions()
  spark_install(version = "2.1.0")

