# Load the Data .
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
# Step 8: Save the Cleaned Data 
write.csv(data, "cleaned_data.csv", row.names = FALSE)



