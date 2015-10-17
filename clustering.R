# Cluster the transactions

filtmatrix <- as.matrix(filtered.data[c("PRICE_TAKEN", "BET_SIZE")])

# H clustering is a bit too memory intensive! Use K-means.
# hclust(dist(filtmatrix))
cluster <- kmeans(log(filtmatrix), 10)

filtered.data$cluster <- cluster$cluster

