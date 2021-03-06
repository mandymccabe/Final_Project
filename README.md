# Final_Project
## About the Topic
Our final project will be looking at the relationship between political views and trust in the media.  

### About the Data Source
The dataset looks at the responses of over 1,000 Americans to find out about their demographics, media usage, and trust in the media. 

This link goes to the raw dataset: [DataSet](https://github.com/mandymccabe/Final_Project/blob/main/Resources/all_responses_coded.csv)

This link explains what each column in the dataset corresponds to: [Response Codes](https://github.com/mandymccabe/Final_Project/blob/main/Resources/Question%20and%20Response%20Codes.pdf)

### Why did we select this topic?
We selected this topic because bias in the media is a common topic in current events.  We thought it would be interesting to see how different demographic inputs would affect media usage and political views.  

### What We Want to Answer
We would like to use the dataset to determine an individual's political stance based on their responses to the other questions in the survey (gender, age, income, preferred media outlets, etc).  We plan to use Postgres for our database, Tableau for our visualizations, and categorical supervised machine learning to predict our target value (political stance). 

## Technologies Used

### Data Cleaning and Analysis
We are using Pandas to clean the data and perform exploratory analysis. Python and the ScikitLearn module are being used for further analysis of the data and machine learning.

### Database Storage
We are using Postgres for our database.  The SQl queries for the tables and joins can be found at this [LINK](https://github.com/mandymccabe/Final_Project/blob/main/Database/FINALschema.sql).

The ERD for our database is as follows: 

![ERD](https://github.com/mandymccabe/Final_Project/blob/main/Images/ERD.png)

### Machine Learning
We are using the SciKitLearn library to test out different machine learning classifiers. We train, test, and split the data using random_state and create classification tables to determine which model is performing the best.  

## Data Exploration
### What did we look at?
- Number of rows of data- code in this [file](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/NeuralNetwork.ipynb)
- Check for any null values- code in this [file](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/NeuralNetwork.ipynb)
- Discuss machine learning options-need a categorical model
- Discuss ways to visualize the data

## Tools Utilized
- Data cleaning: Python, Pandas
- Machine Learning: SciKitLearn library, logistic regression classifier, RandomForestClassifier, Neural Network 
- Database: PostgreSQL
- Visualization: Tableau
- Communication: Slack group message, Microsoft Teams


## Analysis Phase
  
### Machine Learning
Determine which machine learning model gives us the best results
Models tried:
- Logistic Regression

	Benefits: This was a simple model that we all felt we understood well to test out initially
	
	Cons: Only able to predict two classes but our data need to predict 3-5 classes so not a good fit for our data 
	
- [Decision Tree Classifier](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/FinalProjectMachineLearning.ipynb)

	Benefits: Able to predict multiple output classes, easy to interpret, not sensitive to outliers
	
	Cons: Prone to overfitting
	
- [Random Forest Classifier](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/FinalProjectMachineLearning.ipynb)

	Benefits: Not sensitive to outliers, good for non linear data
	
	Cons: Less prone to overfitting than Decision Tree Classifiers but still a risk
	
- Neural Network
- 
	- [Neural Network with 5 Outputs](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/Archive/NeuralNetwork.ipynb)
	- 
	- [Neural Network with 3 Outputs](https://github.com/mandymccabe/Final_Project/blob/main/MachineLearningModelCode/Archive/NeuralNetworkReduced.ipynb)
	
	Benefits: effective at detecting nonlinear, complex relationships, higher tolerance for messy data
	
	Cons: Layers are complex and difficult to understand, prone to overfitting
	
### Preprocessing
The data was preprocessed by dropping column A21 from the database, which contained infrequent answers about news sources that the indivudal preferred. It was not felt to contain features that could accurately predict an individuals political leanings. Additionally, the start and end dates that the survey was taken in were not needed for the machine learning model and were not used in the database. 

Three database tables were created:
- One with all the response options marked with yes-1 or no-0): full_info 
- One that displayed the respondentid with the individuals political view in text form: political_views. 
These tables were joined to allow for a human-readable output for the machine learning model user.

### Data Split
Data was split into testing and training groups using the following code:

![splitcode](https://github.com/mandymccabe/Final_Project/blob/main/Images/split.png)

For of the machine learning models, the dataset was split 80% for training and 20% for testing. 

### Refinement
The accuracy of the machine learning model (decision tree classifier, random forest classifer, neural network) were not very high. Various methods were used to try to improve the accuracy of the models; boosting, undersampling, oversampling, and reducing the number of outputs from 5 to 3 by combining the classification of "Very Conservative" with "Conservative" and "Very Liberal" with "Liberal" and rejoining these classifications to the original dataframe (after dropping the original classifications). Unfortunately, none of the improvement techniques improved the accuracy above .69.

### Classifier Comparison

Decision Tree Classifier for 5 outputs

![DTC5outputs](https://user-images.githubusercontent.com/91269696/169591796-29380c57-02c4-47bd-8978-98460cb3837e.PNG)

Random Forest Classifier for 5 outputs

![RFC5outputs](https://user-images.githubusercontent.com/91269696/169591863-bd21889f-218d-4606-87a4-0dbfb1d85cc3.PNG)

Random Forest Classifier for 5 outputs with boosting

![RFC5outputsboosted](https://user-images.githubusercontent.com/91269696/169591965-bd14aa13-2f11-49d6-8fb3-bde459fc8809.PNG)

Decision Tree Classifier for 3 outputs

![DTC3outputs](https://user-images.githubusercontent.com/91269696/169591896-b85ae8c3-7082-4f6b-962e-ffb6bbfbb00d.PNG)

Random Forest Classifier for 3 outputs with boosting

![RFC3ouputsboosted](https://user-images.githubusercontent.com/91269696/169591990-898ac945-7d1e-48bd-ba92-b68dbacf4421.PNG)

Random Forest Classifier, 3 outputs, undersampled and boosted

![RFC3outputsUndersampleBoosted](https://user-images.githubusercontent.com/91269696/169592046-581f56e5-1023-42cc-bbd4-3caf777cdb41.PNG)

Random Forest Classifier, 3 outputs, oversampled and boosted

![RFC3outputsOversampleBoosted](https://user-images.githubusercontent.com/91269696/169592095-3266e6c5-5d4a-412e-90d7-2a04591c565b.PNG)

Neural Network Classifier, 5 outputs

![NN5](https://github.com/mandymccabe/Final_Project/blob/mandy_branch/NN5.png)

Neural Network Classifier, 3 outputs
![NN3](https://github.com/mandymccabe/Final_Project/blob/mandy_branch/nn3.png)

The Random Forest Classifier (with boosting and undersampling) model was chosen because of its superior recall in two categories, F1- score for the liberal category, and precision for the moderate category.  Although the neural network had the same number of categories that performed well, it did not have that big of an edge over the RFC model (only out performing by .1 of a point or less).![image](https://github.com/mandymccabe/Final_Project/blob/main/Images/ML_Comp.png)



### Feature Importance

![feature_importance](https://user-images.githubusercontent.com/91269696/169593653-3cf40650-05f7-43b2-ba9a-fd0508dd98f0.PNG)


The most important features for predicting political leanings were:
1. "Strongly Disapprove of the way Donald Trump is handling his job as president"
2. Respondents who chose "Fox News" as their choice for a news outlet that they trust when it comes to reporting the news fully, accurately and fairly
3. Respondents who chose "CNN" as their choice for a news outlet that they trust when it comes to reporting the news fully, accurately and fairly
4. Respondents in the 60+ age range
5. Respondents who use and iOS Phone/Tablet as their Device

### Further Refinement
Various updates were made to try to improve the machine learning model which appears to be overfitted to the training set (training accuaracy 99%, testing accuracy 59%). Options tried included:
- adjusting the n_estimator
- adjusting the size of the training and testing sets
- over sampling and undersampling

None of the adjustments made a significant change to the accuracy of the training or testing sets.  

The dataset used had just over 1000 rows of data which is not a large amount for machine learning.  Adding more data points could help to improve the model's performance.  Additionally, the responses for "very liberal" and "very conservative" comprised a very small portion of the dataset.  Getting more respondents from those political class could help to strengthen their classification. 


## Visualization
- Interactive Tableau Dashboard: 

	- Filter income
	
	- Pie charts of age and gender breakdown
		
	- A map of the US regions that acts as a filter for the bar charts
		
	- Interactive bar charts for political stance, trust in the media that filter each other based on selections
		
- Survey Question Visualization

	- Questions with the highest feature importance from machine learning compared to political stance
		
The visualizations are posted on Tableau Public following this [LINK](https://public.tableau.com/app/profile/amanda.mccabe/viz/Final_Project_16540997746330/FinalProject?publish=yes)
		
		
	
