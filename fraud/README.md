# Fraud Detection 

## Overview  
Fraud detection is an important application of Machine Learning. It works on the basis of large, historical datasets that have been aggregated across many clients. The data serve as the training set and allow businesses to build efficient machine-learning-based fraud detection systems with optimized performance. Compared to standard predictive modeling problem, fraud detection is characterized with skewed class distribution, or class imbalance, since fraud is a relatively rare event. Therefore, one challenge of fraud detection with Machine Learning is to mitigate the class imbalance problem.  

The goal of this project is to build supervised classification model for fraud detection using preprocessed and anonymized credit card transaction data. The original dataset is highly skewed with the positive class only accounting for 0.172%. Therefore, the project explores approaches for dealing with class imbalance. Instead of using common metrics like accuracy, the precision-recall curve and the area under the curve (AUC) are used as the performance measure for the models. Algorithm level approach (i.e., adjusting class weight) and data rebalancing technique (SMOTE) are used to optimize the model performance. 

**Keywords:** classification model, class imbalance, class weight, SMOTE, precision-recall curve, AUC

## Libraries 
The project was done using **Python 3.5** with the following libraries: 
- numpy  
- pandas 
- matplotlib 
- seaborn 
- sklearn  
- imblearn 

## Data 
The dataset was from [Kaggle](https://www.kaggle.com/dalpozz/creditcardfraud). It contains transactions made by credit cards in September 2013 by european cardholders. It contains only numerical input variables, including 28 features which are the result of a PCA transformation, and 1 feature which has not been transformed with PCA, `'Amount'`. The original features and more background information about the data are not available due to confidentiality issues. The target variable for the dataset is `'Class'`. It takes value 1 in case of fraud and 0 otherwise. This dataset presents transactions that occurred in two days, where there are 492 frauds out of 284,807 transactions.