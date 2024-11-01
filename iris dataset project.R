# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset (for demonstration, using the built-in iris dataset)
data("iris")
# View the structure and first few rows
str(iris)
head(iris)

# Summary statistics
summary(iris)
# Check for missing values
sum(is.na(iris))
# Histogram for Sepal Length
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.3, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sepal Length")

# Boxplot for Sepal Width by Species to spot outliers
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Width by Species")
# Scatter plot between Sepal Length and Sepal Width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  labs(title = "Scatter Plot of Sepal Length vs. Sepal Width")

# Pair plot for all numeric variables
pairs(iris[1:4], col = iris$Species)
# Calculating z-scores to detect outliers
z_scores <- as.data.frame(scale(iris[1:4]))
outliers <- which(rowSums(z_scores > 3 | z_scores < -3) > 0)
iris[outliers, ]
