# Final_Project
## Background
This machine learning model predicts the political leanings of individuals based on their responses to various questions about their trust in the media, their preferred news source, their apporval of Donald Trump, and their demographic information.  

## Preprocessing/Feature Selection
The data was preprocessed by dropping column A21 from the database, which contained infrequent answers about news sources that the indivudal preferred.  It was not felt to contain features that could accurately predict an individuals political leanings. Additionally, the start and end dates were not needed for the machine learning model and were not used in the database.  Two database tables were created (one with all the response options marked with yes-1 or no-0): full_info and the other table displayed the respondentid with the individuals political view in text form: political_views.  These tables were combined to allow for a human-readable output for the machine learning model user.

## Machine Learning Refinement
The accuracy of the machine learning model (decision tree classifier and random forest classifer) were not very high.  Various methods were used to try to improve the accuracy of the models; boosting, undersampling, oversampling, and reducing the number of outputs from 5 to 3 by combining the classification of "Very Conservative" with "Conservative" and "Very Liberal" with "Liberal" and rejoining these classifications to the original dataframe (after dropping the original classifications).  Unfortunately, none of the improvement techniques improved the accuracy above .69.


## Comparisons of classifier accuracy

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