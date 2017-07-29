# Predict Zestimate Logerror 

## Overview   

Zillow's “Zestimates” are estimated home values based on 7.5 million statistical and machine learning models that analyze hundreds of data points on each property. A home is often the largest and most expensive purchase a person makes in his or her lifetime. Therefore, ensuring homeowners have a trusted way to monitor this asset is incredibly important. Zestimate was created to give consumers as much information as possible about homes and the housing market, marking the first time consumers had access to this type of home value information at no cost. And by continually improving the median margin of error (from 14% at the onset to 5% today), Zillow has since become established as one of the largest, most trusted marketplaces for real estate information in the U.S. and a leading example of impactful machine learning.  

The goal of this project is to makes predictions about the future sale prices of homes. The prediction results are evaluated on Mean Absolute Error between the predicted log error and the actual log error. The `logerror` (target variable) is defined as  

*logerror = log(Zestimate) - log(SalePrice)*

**Keywords:** regression model, model stacking

## Libraries 
The project was done using **Python 3.5** with the following libraries: 
- numpy  
- pandas 
- matplotlib 
- seaborn 
- sklearn  

## Data 
The dataset was from [Kaggle](https://www.kaggle.com/c/zillow-prize-1/data). It contains a full list of real estate properties in three counties (Los Angeles, Orange and Ventura, California) data in 2016. The train data has all the transactions before October 15, 2016, plus some of the transactions after October 15, 2016. The test data in the public leaderboard has the rest of the transactions between October 15 and December 31, 2016. The rest of the test data, which is used for calculating the private leaderboard, is all the properties in October 15, 2017, to December 15, 2017, which is called the "sales tracking period".

The task is to predict 6 time points for all properties: October 2016 (201610), November 2016 (201611), December 2016 (201612), October 2017 (201710), November 2017 (201711), and December 2017 (201712). 