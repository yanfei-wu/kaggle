# Quora Question Pairs - A Kaggle Competition  

## Overview  
The [competition](https://www.kaggle.com/c/quora-question-pairs) was launched by Quroa in March 2017. Quora is a place to gain and share knowledge — about anything. It’s a platform to ask questions and connect with people who contribute unique insights and quality answers. Over 100 million people visit Quora every month, so it's no surprise that many people ask similarly worded questions. Multiple questions with the same intent can cause seekers to spend more time finding the best answer to their question, and make writers feel they need to answer multiple versions of the same question. So, the goal of this competition is to **classify whether question pairs are duplicates or not**. Doing so will make it easier to find high quality answers to questions resulting in an improved experience for Quora writers, seekers, and readers. 

This repo contains my attempts on this competition. It includes notebooks/codes of exploration analysis, feature generation, model building, tuning and evaluation.  

## Libraries 
This project was done using **Python 3.5** and the following Python libraries: 
- Numpy 
- Pandas 
- Matplotlib 
- Scikit-Learn  

## Data 
The dataset consists of about 400,000 training examples. Each row consists of two sentences and a binary label that indicates whether the two questions are the same or not. 

**Features** 
- `id`: the id of a training set question pair 
- `qid1`, `qid2`: unique ids of each question (only available in train.csv) 
- `question1`, `question2`: the full text of each question 

**Target Variable** 
- `is_duplicate`: the target variable (1 - duplicate, 0 - not duplicate). The labels have been supplied by human experts.  

