import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv ("data1.txt", sep='\s+')
df2 = pd.read_csv ("data2.txt", sep='\s+')
print(df2.head())

plt.subplot (2, 2, 1)
df1['PElec'].plot (logy=True)   
(df1['Ithermique']).plot (logy=True)
plt.title("Energie apportée par les électrodes et par combustion (log(W))")
plt.legend ()
plt.subplot (2, 2, 2)
df1['Toutlet'].plot ()
plt.title("Température de sortie")
plt.legend ()

plt.subplot (2, 2, 3)
df2['PElec'].plot (logy=True)
(df2['Ithermique']).plot (logy=True)
plt.title("Energie apportée par les électrodes et par combustion (log(W))")
plt.legend ()
plt.subplot (2, 2, 4)
df2['Toutlet'].plot ()
plt.title("Température de sortie")
plt.legend ()

plt.show ()