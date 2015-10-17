# Visualisation.
library(ggplot2)
library(dplyr)

# Choose an event.id
event.id <- "Event here"

# Grab all taken bets for this match
filtered.data <- bet.data %>%
  filter(BID_TYP == "B" & EVENT_ID == event.id & STATUS_ID == "S",
         INPLAY_BET == TRUE) %>%
  group_by(SELECTION_NAME) %>%
  mutate()

# Make a histogram
g <- ggplot(filtered.data)
g <- g + geom_bar(aes(x = PRICE_TAKEN, y = ..count..))
print(g)

h <- ggplot(filtered.data)
h <- h + geom_point(aes(x = PRICE_TAKEN, y = BET_SIZE, colour = cluster),
                    size = 3.0, alpha = 0.4) + scale_x_log10() + scale_y_log10()
print(h)

# Calculate mean bet price and standard deviation?

# Look at how far a bet is from the mean price (in sd)?
