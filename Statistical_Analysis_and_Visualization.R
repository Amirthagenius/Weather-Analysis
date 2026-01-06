# Load the Data
data <- read.csv("Weather.csv", header = TRUE, sep = ",")
# View the first few rows
head(data)
# Check the structure and types of each column
str(data)
# Get a summary of each column
summary(data) 
# Check for missing values in each column
colSums(is.na(data))
# Remove rows with missing values
data <- na.omit(data)
# Remove Duplicates
data <- data[!duplicated(data), ]
# Convert all names to lowercase
names(data) <- tolower(names(data)) 
# Replace spaces with underscores
names(data) <- gsub(" ", "_", names(data))  
write.csv(data, "cleaned_data.csv", row.names = FALSE)

# Set the file path where you want to save the plot
png("avg_relative_humidity plot.png")
# Plot the histogram with density for avg_relative_humidity
hist(data$avg_relative_humidity, 
  probability = TRUE,               # Convert frequency to density
  main = "Histogram of Average Relative Humidity", 
  xlab = "Average Relative Humidity", 
  col = "lightblue", 
  border = "black")
# Add a density curve
lines(density(data$avg_relative_humidity, na.rm = TRUE), col = "red")
# Close the graphic device to save the plot
dev.off()

# Set the file path where you want to save the plot
png("max_wind_speed.png")
# Plot the histogram with density for max_wind_speed
hist(data$max_wind_speed, 
     probability = TRUE,              # Convert frequency to density
     main = "Histogram of Maximum Wind Speed", 
     xlab = "Maximum Wind Speed",
     col = "lightblue", 
     border = "black")
# Add a density curve
lines(density(data$max_wind_speed, na.rm = TRUE), col = "red")
# Close the graphic device to save the plot
dev.off()


install.packages("ggplot2")
library(ggplot2)

# Fit the linear model for avg_relative_humidity as a function of max_wind_speed.
model <- lm(avg_relative_humidity ~ max_wind_speed, data = data)

plot <- ggplot(data, aes(x = max_wind_speed, y = avg_relative_humidity)) +
  geom_point(color = "blue") +  # Scatter plot of data points
  geom_smooth(method = "lm", formula = y ~ x, color = "red", se = FALSE) +  
  # Add linear regression line
  ggtitle("Max Wind Speed vs Avg Relative Humidity") + 
  xlab("Max Wind Speed") + 
  ylab("Average Relative Humidity") +
  theme_minimal()

# Save the plot as a PNG file.
ggsave("linear_regression_plot.png", plot = plot, width = 8, height = 6)

# Pearson's correlation test between avg_relative_humidity and max_wind_speed.
cor.test(data$avg_relative_humidity, data$max_wind_speed, method = "pearson")
# end



