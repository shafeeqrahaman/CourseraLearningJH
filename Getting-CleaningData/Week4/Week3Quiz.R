# Week 3 
install.packages("jpeg")
install.packages("Hmisc")
library(jpeg)
library(Hmisc)
# Create a logical vector that identifies the households on greater than 10 acres who 
# sold more than $10,000 worth of agriculture products. Assign that logical vector to the 
# variable agricultureLogical. Apply the which() function like this to identify the rows of 
# the data frame where the logical vector is TRUE.

# Question 1
question1 <- read.csv("Week3Q1.csv", stringsAsFactors = FALSE)
View(question1)

agricultureLogical <- question1$ACR == 3 & question1$AGS == 6
which(agricultureLogical)

# Question 2
# install.packages("jpeg")
# library(jpeg)
img <- readJPEG("Week3Q2.jpg",native=TRUE)
head(img)
quantile(img,probs = c(0,0.3,0.8))

# Question 3
# Match the data based on the country shortcode. How many of the IDs match? Sort 
# the data frame in descending order by GDP rank (so United States is last). What
# is the 13th country in the resulting data frame?
gdp <- read.csv("Week3Q3GDP.csv", stringsAsFactors = FALSE)
country <- read.csv("Week3Q3Country.csv", stringsAsFactors = FALSE)
# Delete the empty rows
gdp <- gdp[-c(1:4),] 
# Convert factor to numeric
gdp$Gross.domestic.product.2012 <- as.numeric(gdp$Gross.domestic.product.2012)
# Merge gdp and country
mergedDf<- merge(gdp,country,by.x="X", by.y="CountryCode")
# Sort the ranking decreasing (To sort a dataframe use Order)
mergedDf <- mergedDf[order(mergedDf$Gross.domestic.product.2012, decreasing = TRUE, na.last = NA),]

# Question 4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
mergedDf %>% group_by(Income.Group) %>% summarise(mean(Gross.domestic.product.2012, na.rm=TRUE))

# Question 5
mergedDf <- mergedDf %>% mutate(gdp.quantile = cut2(Gross.domestic.product.2012,g-5))
table(mergedDf$Income.Group, mergedDf$grp.quantile)