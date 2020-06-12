<p>		This research aims at reevaluating public safety problem in Chicago, more specifically, identifying key features behind blocks with high crime rate and devising public policy solutions accordingly. In most social science literature, demographics are known to exhibit strong correlations with crime; yet, we believe demographics alone are not sufficient to explain this complex issue. Therefore alongside traditional demographics,we introduce two newgroups – infrastructure and traffic flow – to better capture neighborhood characteristics.. </p><br>

<p>		Three types of machine learning techniques are used in this research: unsupervised clustering, supervised regression, and synthetic control method. In unsupervised learning, we apply hierarchical clustering and K-means to select states shared similar demographic features with Illinois. Then, scope is narrowed down to Chicago in the supervised regression part in order to key factors behind its high crime rate. Lastly, we constructed a simulated Chicago using synthetic control method with data of real cities selected from unsupervised learning. This method helps us better understand results of a policy or project.</p>

## Data Source

In this project, we use three data sources:
1. Crime data: FBI, including 2010~2018
2. ACS data: Demographic features
3. Census tract boundaries: Census tract for Chicago
4. Property Value: https://www.experian.com/blogs/ask-experian/research/median-home-values-by-state/
5. State-County-City Match: From government website
6. Taxi Trips: From chicago data portal

## Directory
1. Data: This folder is where we store all the data. 
2. STATA: This folder include the do files showing the further statistical analysis for Bootstrapping and Synthetic Control Method. 
3. Excel: This folder include the xlsx files we use to draw our trends. 
4. Notebooks:
a) Descriptive_heatmap include the heatmap targeting at Homicide. 
b) Unsupervised_Cluster include two method Hierarchical Clustering And K-means, in 	order to select States with similar demographic features with Illinois.
c) Supervised_And_Synth include all the supervised model we have used, and synthetic control method. 
5. PDFs: Final presentation and Final report. 