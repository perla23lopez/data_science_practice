#### Load in csv file ####
books_data <- read.csv("data/amazonbestsellers.csv")
View(books_data)

## Practice plotting with your dataset
library(ggplot2)
books_data$Name[1:50]
ggplot(data = books_data, aes(x = Genre, y = User.Rating, color = Year)) +
  labs (title = "Amazon's Top 50 Bestselling Books 2009-2019") +
  geom_point()

ggplot(data = books_data, aes(x = Year, y = User.Rating, color = Genre)) +
  labs (title = "Amazon's Top 50 Bestselling Books 2009-2019") +
  geom_point()