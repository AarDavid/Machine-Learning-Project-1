#The following code is written with inspiration from kode provided in Rolands lectures

library(caret)
library(dplyr)

setwd("C:/IT/Machine Learning Course/Diamonds")
f = "diamonds_whole_pp_1.csv"
colClasses = c("numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
               "numeric", "numeric", "numeric")
df <- read.csv(file = f, colClasses = colClasses, sep = ",")

skip <- select(df, "price")

transformation =
  preProcess(
    df,
    #method = c("BoxCox","center","scale", "pca")
    method = c("BoxCox","center","scale")
  )

transformedPredictors <- predict(transformation, df)

transformedPredictors["price"] <- skip["price"]
transformedPredictors

write.csv(transformedPredictors, "diamonds_whole_pp_2.csv", row.names = FALSE)


