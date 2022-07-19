## Practice plotting with your dataset
library(ggplot2)
books_data$Name[1:50]
ggplot(data = books_data, aes(x = Genre, y = User.Rating, color = Year)) +
  labs (title = "Amazon's Top 50 Bestselling Books 2009-2019") +
  geom_point()

ggplot(data = books_data, aes(x = Year, y = User.Rating, color = Genre)) +
  labs (title = "Amazon's Top 50 Bestselling Books 2009-2019") +
  geom_point()

## Practice sub-setting data
# use a combination of
# filter, select, mutate, arrange, summarize, group_by, sample, and/or slice
# create a visualization using your new subset of data

new_data <- filter(books_data, User.Rating >= 4.5, Price <= 10, Reviews >= 10000)
new_data
new_data2 <- filter(new_data, Genre %in% c("Fiction", "Non Fiction"))
new_data2

ggplot(data = new_data2, aes(x = Price, y = User.Rating, color = Genre)) +
  labs (title = "Amazon's Bestelling Fiction & Non Fiction Books Under $10") +
  geom_point()

books_small <- select(new_data2, Name, Author, User.Rating, Reviews, Price, Genre)
head(books_small)
books_small <- mutate(books_small, User.Rating_m = User.Rating * 2)
head(books_small)

ggplot(data = books_small, aes(x = Price, y = User.Rating_m, color = Genre)) +
  labs (title = "Amazon's Bestelling Fiction & Non Fiction Books Under $10") +
  geom_point()