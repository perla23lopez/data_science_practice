## load required libraries
library(dplyr)
library(ggplot2)

## Unsupervised learning: k-means clustering

iris_numerics <- select(iris, -Species) %>%
  scale()

iris_clusters <-  kmeans(iris_numerics, centers = 3)
iris_clusters # our results

iris_clusters$cluster # vector designating a cluster for each row
iris$cluster <- iris_clusters$cluster # add clusters to original dataset
head(iris)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = as.factor(cluster)))

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species))

## Try this on your own dataset! Use at least 2 numeric variables & make a plot!
books_numerics <- select(books_data, -Genre, -Author, -Name) %>%
  scale()

books_clusters <-  kmeans(books_numerics, centers = 3)
books_clusters # our results

books_clusters$cluster # vector designating a cluster for each row
books_data$cluster <- books_clusters$cluster # add clusters to original dataset
head(books_data)

View(books_data)
ggplot(books_data, aes(x = Price, y = User.Rating)) +
  geom_point(aes(color = Genre))