# Bike Share Demand 

## Overview  
The dataset was from a [Kaggle competition]((https://www.kaggle.com/c/quora-question-pairs) ) launched in May 2014. The goal was to build a model using historical usage patterns with weather data in the Capital Bikeshare program in Washington, D.C. to forecast bike rental demand.  

This repo contains the exploratory analysis and data visualization I did with this data set, as well as basic regression model building.  

**Keywords:** R, data visualization, regression models  

## Libraries 
The project was done using **R** in Rstudio with the following R packages: 
- dplyr  
- tidyr 
- ggplot2 
- rpart 
- randomForest 

## Data 
The dataset includes historical usage patterns with weather data in the Capital Bikeshare program in Washington, D.C. The training set is comprised of the first 19 days of each month, while the test set is the 20th to the end of the month. 

**Features** 
- `datetime`: hourly date + timestamp   
- `season`: 1 = spring, 2 = summer, 3 = fall, 4 = winter  
- `holiday`: whether the day is considered a holiday 
- `workingday`: whether the day is neither a weekend nor holiday 
- `weather`: 1 - Clear, Few clouds, Partly cloudy, Partly cloudy; 2 - Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist; 3 - Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds; 4 - Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog  
- `temp`: temperature in Celsius 
- `atemp`: "feels like" temperature in Celsius 
- `humidity`: relative humidity 
- `windspeed`: wind speed 
- `casual`: number of non-registered user rentals initiated 
- `registered`: number of registered user rentals initiated 

**Target Variable** 
count - number of total rentals  