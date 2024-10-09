install.packages("ggplot2")
install.packages("readr")

library(ggplot2)
library(readr)

url <- "https://api.worldbank.org/v2/en/indicator/SP.POP.TOTL?downloadformat=csv"
population_data <- read.csv(url)


population_data <- read.csv(file.choose(), header = TRUE, stringsAsFactors = TRUE)
population_data


head(population_data)


df_filtered <- population_data[, c("Year", "Country", "Population")]


gender_count <- table(df_filtered$gender_column)

ggplot(as.data.frame(gender_count), aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()


ggplot(df_filtered, aes(x = age_column)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Frequency") +
  theme_minimal()


df_filtered <- data.frame(gender_column = c("Male", "Female", "Male", "Female", "Male"))

gender_count <- table(df_filtered$gender_column)

ggplot(as.data.frame(gender_count), aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()



df_filtered <- data.frame(age_column = c(25, 34, 50, 19, 60, 44, 30))

ggplot(df_filtered, aes(x = age_column)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Frequency") +
  theme_minimal()
