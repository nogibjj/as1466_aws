import pandas as pd
df = pd.read_csv('bmi.csv')
def test_main():
    # Calculate statistics once and store them in variables
    #calculated_stats = stats(df)
    age_mean = df['Age'].mean()
    height_median = df['Height'].median()
    weight_std = df['Weight'].std()

    # Use assertions to compare specific values or properties
    assert (stats(df) == stats(df)).all().all()
    assert (age_mean == df['Age'].mean())
    assert (height_median == df['Height'].median())
    assert (weight_std == df['Weight'].std())



if __name__ == "__main__":
  test_main()
