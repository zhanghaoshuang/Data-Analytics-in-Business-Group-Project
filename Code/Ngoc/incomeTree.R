# Install packages
if(!require(caTools)) install.packages("caTools")
if(!require(tree)) install.packages("tree")

# Load packages
library(caTools)
library(tree)

# Read data from process_data.R
source("clean_data.R")

set.seed(1)

### Use dataset1

# Split data
sample1 <- sample.split(dataset1$income_above_limit, SplitRatio = .8)
train1 <- subset(dataset1, sample==TRUE)
test1 <- subset(dataset1, sample==FALSE)

# Fit a tree model with income_above_limit as the dependent variable 
# and the rest of the features as the independent variables
income.tree1 <- tree(income_above_limit ~ ., data = train1)

# Plot tree model
plot(income.tree1)
text(income.tree1, cex = .7)

# Print the summary
summary(income.tree1)
# Variables actually used in tree construction: wage_per_hour, age, and gender

'
Re-run the tree model with 
income_above_limit as the dependent variable and the rest of the features as the independent variables
'
income.tree1 <- tree(income_above_limit ~ education + age + gender, data = train1)

# Make a prediction
pred.tree1 <- predict(income.tree1, test1, type = 'class')
CF.tree1 <- table(Actual = test1$income_above_limit, Predict = pred.tree1)
CF.tree1

# precision
CF.tree1[2,2]/(CF.tree1[2,1] + CF.tree1[2,2])

# accuracy
sum(diag(CF.tree1))/sum(CF.tree1)


### Use dataset2

# Split data
sample2 <- sample.split(dataset2$income_above_limit, SplitRatio = .8)
train2 <- subset(dataset2, sample==TRUE)
test2 <- subset(dataset2, sample==FALSE)

# Fit a tree model with income_above_limit as the dependent variable 
# and the rest of the features as the independent variables
income.tree2 <- tree(income_above_limit ~ ., data = train2)

# Plot tree model
plot(income.tree2)
text(income.tree2, cex = .7)

# Print the summary
summary(income.tree2)
# Variables actually used in tree construction: wage_per_hour, age, and gender

'
Re-run the tree model with 
income_above_limit as the dependent variable and the rest of the features as the independent variables
'
income.tree2 <- tree(income_above_limit ~ education + age + gender, data = train2)

# Make a prediction
pred.tree2 <- predict(income.tree2, test2, type = 'class')
CF.tree2 <- table(Actual = test2$income_above_limit, Predict = pred.tree2)
CF.tree2

# precision
CF.tree2[2,2]/(CF.tree2[2,1] + CF.tree2[2,2])

# accuracy
sum(diag(CF.tree2))/sum(CF.tree2)


### Use dataset3 ###

# Split data
sample3 <- sample.split(dataset3$income_above_limit, SplitRatio = .8)
train3 <- subset(dataset3, sample==TRUE)
test3 <- subset(dataset3, sample==FALSE)

# Fit a tree model with income_above_limit as the dependent variable 
# and the rest of the features as the independent variables
income.tree3 <- tree(income_above_limit ~ ., data = train3)

# Plot tree model
plot(income.tree3)
text(income.tree3, cex = .7)

# Print the summary
summary(income.tree3)
# Variables actually used in tree construction: wage_per_hour, age, and gender

'
Re-run the tree model with 
income_above_limit as the dependent variable and the rest of the features as the independent variables
'
income.tree3 <- tree(income_above_limit ~ wage_per_hour, data = train3)

# Make a prediction
pred.tree3 <- predict(income.tree3, test3, type = 'class')
CF.tree3 <- table(Actual = test3$income_above_limit, Predict = pred.tree3)
CF.tree3

# precision
CF.tree3[2,2]/(CF.tree3[2,1] + CF.tree3[2,2])

# accuracy
sum(diag(CF.tree3))/sum(CF.tree3)
