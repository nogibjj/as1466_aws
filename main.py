#import pandas as pd
#df = pd.read_csv('bmi.csv')

#function to populate all descriptive statistics
def stats(df): 
  return df.describe()
#function  to return mean of a Series 
def mean(series):
  return series.mean()
#function to return median of Series 
def median(series): 
  return series.median()
#function to return standard deviation of statistics 
def std(series):
  return series.std()
  
#main script
import pandas as pd 
import matplotlib.pyplot as plt
import seaborn as sns 

#reading csv file
data = pd.read_csv('bmi.csv')

#generate summary statistics 
stats1 = stats(data)
#generate boxplot 
boxplots = sns.boxplot(data)
plt.savefig('boxplots.png')
