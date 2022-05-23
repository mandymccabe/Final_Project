# Final_Project
## Selected Topic
Our final project will be looking at the relationship between political views and trust in the media.  

## About the Data Source
The dataset looks at the responses of over 1,000 Americans to find out about their demographics, media usage, and trust in the media. 

This link goes to the raw dataset: [DataSet](https://github.com/mandymccabe/Final_Project/blob/main/Resources/all_responses_coded.csv)

This link explains what each column in the dataset corresponds to: [Response Codes](https://github.com/mandymccabe/Final_Project/blob/main/Resources/Question%20and%20Response%20Codes.pdf)

## Why did we select this topic?
We selected this topic because bias in the media is a common topic in current events.  We thought it would be interesting to see how different demographic inputs would affect media usage and political views.  

## What We Want to Answer
We would like to use the dataset to determine an individual's political stance based on their responses to the other questions in the survey (gender, age, income, preferred media outlets, etc).  We plan to use Postgres for our database, Tableau for our visualizations, and categorical supervised machine learning to predict our target value (political stance). 

## Communication Protocols
A group message was setup in Slack to easily share ideas and files amoungst the group members.  Additionally, Microsoft Teams will be used to setup ad hoc meetings to be able to have virtual discussions outside of class.  Phone numbers were also exchanged so that we will be able to call or text another team member in the event of an emergency. 

# Technologies Used

## Data Cleaning and Analysis
We will be utilizing Pandas to clean the data and perform exploratory analysis. We will then use Python for further analysis of the data.

## Database Storage
We are using Postgres for our database.

## Machine Learning
We are using the SciKitLearn library to create a logistic regression classifier. We train, test, and split the data using random_state and then test our accuracy score. 

## Dashboard
We intend to use Tableau to display our findings and present our data visualization dashboard to the class. 

# Data Exploration
## What did we look at?
- Number of rows of data
- Check for any null values
- Discuss machine learning options-need a categorical model
- Ways to visualize the data

## What tools do we want to use?
- Data cleaning: Python, Pandas
- Machine Learning: SciKitLearn library, logistic regression classifier, RandomForestClassifier, Neural Network (will experiment with all since we aren't sure what will give us the best results)
- Database: PostgreSQL
- Visualization: Tableau
- Communication: Slack group message, Microsoft Teams


# Analysis Phase
## Visualization
- Interactive Tableau Dashboard: 
		- Filters for different demographics
		-Interactive charts that filter each other based on selections
- Question Visualization
		- Most influentials questions for predicting political stance based on machine learning
    - Relationship between political stance and media trust
## Machine Learning
Determine which machine learning model gives us the best results
Models tried:
- [Logistic Regression](https://github.com/mandymccabe/Final_Project/blob/tracy_branch/Machine_Learning_Model.ipynb)- only able to predict two classes, not a good fit for our data 
- [Decision Tree Classifier](https://github.com/mandymccabe/Final_Project/blob/tracy_branch/FinalProjectMachineLearning.ipynb)
- [Random Forest Classifier](https://github.com/mandymccabe/Final_Project/blob/tracy_branch/FinalProjectMachineLearning.ipynb)
- [Neural Network](https://github.com/mandymccabe/Final_Project/blob/mandy_branch/NeuralNetwork.ipynb)

### Preprocessing
The data was preprocessed by dropping column A21 from the database, which contained infrequent answers about news sources that the indivudal preferred. It was not felt to contain features that could accurately predict an individuals political leanings. Additionally, the start and end dates were not needed for the machine learning model and were not used in the database. Two database tables were created (one with all the response options marked with yes-1 or no-0): full_info and the other table displayed the respondentid with the individuals political view in text form: political_views. These tables were combined to allow for a human-readable output for the machine learning model user.

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

The most Accurate Model with the best precision and recall is the Random Forest Classifier oversampling (not boosted)


## Feature Importance

![feature_importance](https://user-images.githubusercontent.com/91269696/169593653-3cf40650-05f7-43b2-ba9a-fd0508dd98f0.PNG)


The most important features for predicting political leanings were:
1. "Strongly Disapprove of the way Donald Trump is handling his job as president"
2. Respondents who chose "Fox News" as their choice for a news outlet that they trust when it comes to reporting the news fully, accurately and fairly
3. Respondents who chose "CNN" as their choice for a news outlet that they trust when it comes to reporting the news fully, accurately and fairly
4. Respondents in the 60+ age range
5. Respondents who use and iOS Phone/Tablet as their Device

## Further Refinement
Continued refinement of the Machine Learning Model could be done by creating a combined over/under sampling test. SMOTEENN combines the oversampling of SMOTE with the undersampling of Edited Nearest Neighbor to create a more refined and accurate machine learning model.
