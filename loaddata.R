rm(list=ls())
library(data.table)
# Script to load in the data

input.files <- c("data/games01_10.csv", "data/games11_20.csv",
                 "data/games21_30.csv", "data/games31_40.csv",
                 "data/games_qtr.csv")

bet.data <- data.frame()

colclasses <- c("numeric", "numeric", "numeric", "integer",
                "factor", "integer", "integer", "factor",
                "factor", "factor", "factor", "factor",
                "factor", "factor", "factor", "factor",
                "character", "factor", "factor", "numeric",
                "numeric", "factor", "numeric", "numeric")

for(inputfile in input.files) {
  print(inputfile)
  bet.data <- rbind(bet.data,
                    read.table(inputfile, header = TRUE,
                               sep = ",", strip.white = TRUE,
                               na.strings = c(""), nrows = 100))
}

# Do some data clean up.
bet.data$INPLAY_BET <- bet.data$INPLAY_BET == "Y"
bet.data$PLACED_DATE <- as.POSIXct(bet.data$PLACED_DATE,
                                format = "%d/%m/%Y %H:%M")
bet.data$TAKEN_DATE <- as.POSIXct(bet.data$TAKEN_DATE,
                              format = "%d/%m/%Y %H:%M")
bet.data$SETTLED_DATE <- as.POSIXct(bet.data$SETTLED_DATE,
                                format = "%d/%m/%Y %H:%M")
bet.data$CANCELLED_DATE <- as.POSIXct(bet.data$CANCELLED_DATE,
                                   format = "%d/%m/%Y %H:%M")
bet.data$EVENT_DT <- as.POSIXct(bet.data$EVENT_DT,
                             format = "%d/%m/%Y %H:%M")
bet.data$OFF_DT <- as.POSIXct(bet.data$OFF_DT,
                              format = "%d/%m/%Y %H:%M")

# Keep the data as a data.table
bet.data <- as.data.table(bet.data)
