train <- read.csv('train.csv')
test <- read.csv('test.csv')

################# Pre-processing #####################

train$datetime <- as.POSIXct(train$datetime) 
train$hour <- as.integer(format(train$datetime, '%H'))
train$weekday <- factor(weekdays(train$datetime))
train$year <- as.integer(format(train$datetime, '%Y'))
train$month <- as.integer(format(train$datetime, '%m'))
train$date <- as.integer(format(train$datetime, '%d'))
train$season <- factor(train$season)
train$holiday <- factor(train$holiday)
train$workingday <- factor(train$workingday)

test$datetime <- as.POSIXct(test$datetime) 
test$hour <- as.integer(format(test$datetime, '%H'))
test$weekday <- factor(weekdays(test$datetime))
test$year <- as.integer(format(test$datetime, '%Y'))
test$month <- as.integer(format(test$datetime, '%m'))
test$date <- as.integer(format(test$datetime, '%d'))
test$season <- factor(test$season)
test$holiday <- factor(test$holiday)
test$workingday <- factor(test$workingday)


################# Linear Regression #####################
    
PredictTestSubset_lm <- function(year, month) {
    test.Loc <- test[(test$year == year) & (test$month == month), ]
    train.Loc <- train[train$datetime <= min(test.Loc$datetime), ]
    linear.model <- lm(count ~ hour + weekday + temp + windspeed + humidity, 
                       train.Loc)
    pred.test.lm <- predict(linear.model, test.Loc)
    return(pred.test.lm)
}

pred.test.lm <- NULL
for (year in unique(test$year)) {
    for (month in unique(test$month)) {
        pred.test.lm <- append(pred.test.lm, PredictTestSubset_lm(year, month))
    }
}

# there are negative predicted counts 
to_zero <- function(x) {
    if (x < 0) {
        return(0)
    } else {
        return(x)
    }
}

submission <- data.frame(datetime = test$datetime, 
                         count = sapply(pred.test.lm, to_zero)) 
write.csv(submission, 'lm.csv', row.names = F)


################# Decision Tree #####################

PredictTestSubset_tree <- function(year, month) {
    test.Loc <- test[(test$year == year) & (test$month == month), ]
    train.Loc <- train[train$datetime <= min(test.Loc$datetime), ]
    tree.model <- rpart(formula = count ~ hour + weekday + temp + windspeed + humidity, 
                        data = train.Loc, method = 'anova')
    pred.test.tree <- predict(tree.model, test.Loc)
    return(pred.test.tree)
}

pred.test.tree <- NULL
for (year in unique(test$year)) {
    for (month in unique(test$month)) {
        pred.test.tree <- append(pred.test.tree, 
                          PredictTestSubset_tree(year, month))
    }
}

submission.tree <- data.frame(datetime = test$datetime, 
                         count = pred.test.tree) 
write.csv(submission.tree, 'tree.csv', row.names = F)


################# Random Forest #####################

PredictTestSubset_rf <- function(year, month) {
    test.Loc <- test[(test$year == year) & (test$month == month), ]
    train.Loc <- train[train$datetime <= min(test.Loc$datetime), ]
    feature <- c('hour', 'weekday', 'temp', 'humidity', 'windspeed')
    rf.model <- randomForest(train.Loc[, feature], train.Loc[, "count"], ntree = 100)
    pred.test.rf <- predict(rf.model, test.Loc)
    return(pred.test.rf)
}

pred.test.rf <- NULL
for (year in unique(test$year)) {
    for (month in unique(test$month)) {
        pred.test.rf <- append(pred.test.rf, PredictTestSubset_rf(year, month))
    }
}

submission.rf <- data.frame(datetime = test$datetime, 
                              count = pred.test.rf) 
write.csv(submission.rf, 'rf.csv', row.names = F)


############### Linear Regression + Decision Tree ##############

PredictTestSubset_lm <- function(year, month) {
    test.Loc <- test[(test$year == year) & (test$month == month), ]
    train.Loc <- train[train$datetime <= min(test.Loc$datetime), ]
    linear.model <- lm(casual ~ hour + weekday + temp + windspeed + humidity, train.Loc)
    pred.test.lm <- predict(linear.model, test.Loc)
    return(pred.test.lm)
}

pred.test.lm <- NULL
for (year in unique(test$year)) {
    for (month in unique(test$month)) {
        pred.test.lm <- append(pred.test.lm, PredictTestSubset_lm(year, month))
    }
}

PredictTestSubset_tree <- function(year, month) {
    test.Loc <- test[(test$year == year) & (test$month == month), ]
    train.Loc <- train[train$datetime <= min(test.Loc$datetime), ]
    tree.model <- rpart(formula = registered ~ hour + weekday + temp + windspeed + humidity, data = train.Loc, method = 'anova')
    pred.test.tree <- predict(tree.model, test.Loc)
    return(pred.test.tree)
}

pred.test.tree <- NULL
for (year in unique(test$year)) {
    for (month in unique(test$month)) {
        pred.test.tree <- append(pred.test.tree, PredictTestSubset_tree(year, month))
    }
}

count <- sapply(pred.test.lm, to_zero) + pred.test.tree
submission.combined <- data.frame(datetime = test$datetime, 
                            count = count) 
write.csv(submission.combined, 'combined.csv', row.names = F)
