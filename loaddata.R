rm(list=ls())
library(data.table)
library(stringr)
# Script to set up the betting data.

input.files <- c("data/games01_10.csv", "data/games11_20.csv",
                 "data/games21_30.csv", "data/games31_40.csv",
                 "data/games_qtr.csv")

bet.data <- data.frame()
for(inputfile in input.files) {
  print(inputfile)
  bet.data <- rbind(bet.data,
                    read.table(inputfile, header = TRUE,
                               sep = ",", strip.white = TRUE,
                               na.strings = c(""), nrows = 100))
}

# Rename the weird first column.
names(bet.data)[1] <- "BET_ID"


# Do some data clean up.
bet.data$INPLAY_BET <- bet.data$INPLAY_BET == "Y"

bet.data$BID_TYP <- factor(str_trim(bet.data$BID_TYP))
bet.data$STATUS_ID <- factor(str_trim(bet.data$STATUS_ID))

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

# Fix the dodgy profit column.
bet.data$CorrectedProfit <- NA
bet.data$CorrectedProfit <- ifelse(bet.data$PROFIT_LOSS > 0 & bet.data$BID_TYP == 'B', (bet.data$PRICE_TAKEN - 1.0) * bet.data$BET_SIZE, bet.data$CorrectedProfit)
bet.data$CorrectedProfit <- ifelse(bet.data$PROFIT_LOSS > 0 & bet.data$BID_TYP == 'L', bet.data$BET_SIZE, bet.data$CorrectedProfit)
bet.data$CorrectedProfit <- ifelse(bet.data$PROFIT_LOSS < 0 & bet.data$BID_TYP == 'L', (bet.data$PRICE_TAKEN -1.0) * -bet.data$BET_SIZE, bet.data$CorrectedProfit)
bet.data$CorrectedProfit <- ifelse(bet.data$PROFIT_LOSS < 0 & bet.data$BID_TYP == 'B', -bet.data$BET_SIZE, bet.data$CorrectedProfit)

write.csv(bet.data, file = "data/cleanedup_data.csv", row.names = FALSE)
