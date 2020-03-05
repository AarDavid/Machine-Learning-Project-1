#The following code is written with inspiration from kode provided in Rolands lectures

library(caret)
library(dplyr)

setwd("C:/IT/Machine Learning Course/Diamonds")
f = "diamonds_val_pp_1.csv"
colClasses = c("numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
               "numeric", "numeric", "numeric")
df <- read.csv(file = f, colClasses = colClasses, sep = ",")

keep <- select(df, "price")
drops <- c("price")
df_drop <- df[ , !(names(df) %in% drops)]
df_drop

transformation =
  preProcess(
    df_drop,
    method = c("BoxCox","center","scale", "pca")
    #method = c("BoxCox","center","scale")
    #method = c("BoxCox","center")
    
  )

transformedPredictors <- predict(transformation, df_drop)
transformedPredictors

transformedPredictors

test <- transformedPredictors
transformedPredictors["price"] <- keep["price"]
transformedPredictors

write.csv(transformedPredictors, "diamonds_val_pp_2_pca.csv", row.names = FALSE)
