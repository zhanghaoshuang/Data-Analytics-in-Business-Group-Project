# Team-23
 Team 23's group project GitHub repository for MGT 6203 (Canvas) Spring of 2024 semester.

#### Purpose of Project
Wage inequality has been an issue for the past hundreds of years. Our team wanted to use analytics to better characterize which group experience the most inequality and come up with ideas to combat this wage gap. We use the income data from kaggle: https://www.kaggle.com/datasets/kamaumunyori/income-prediction-dataset-us-20th-century-data/data

#### Structure of Our Github
1. Code- contains all of our R markdown files 
2. Data- contains two csv files of the data we downloaded from kaggle. We only used the train.csv file 
3. Final Report- contains the pdf version of our final report 
4. Other Resources- empty folder
5. Progress Report- contains the pdf version of our progress report
6. Project Proposal- contains the pdf version of our project proposal
7. Visualizations- contains Excel file used to make visualization for RandomForest Model

#### How to Run Our Code
1. In the code folder, there are individual folders for each of our team members. These folders contain the preliminary code 
2. In the main code folder are our final R markdown files
3. Run `cleaning_script.Rmd` first and you will obtain temporary rds files in the temp_rds_files folder, the rest of our code will use these files. There will be six different files:  
   a. Cleaned original data for cross validation \
   b. Cleaned original data for testing \
   c. Cleaned oversampled data for cross validation \
   d. Cleaned oversampled data for testing \
   e. Cleaned undersampled data for cross validation \
   f. Cleaned undersampled data for testing
4. Run `RandomForestModel_CrossValidation.Rmd` to obtain the results of the Random Forest model on our data set 
5. Run `knn_model.Rmd` to obtain the results of the K Nearest Neighbor model on our data set, the results of the markdown file is in `knn_model.html` 
6. Run `boosting_model.Rmd` to obtain the reuslts of the XG Boosting Model
7. Run `create_logistic_cv_model.Rmd` to obtain the reuslts of the Logistic Regression Model, the results of the markdown file is in `create_logistic_cv_model.html`
