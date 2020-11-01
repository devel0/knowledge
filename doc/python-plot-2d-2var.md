# python plot 2d 2var

## code

```py
import numpy as np
from numpy import exp,arange,meshgrid,linspace
import matplotlib.pyplot as plt
from matplotlib.pyplot import title,imshow,cm,show,colorbar,axis
from matplotlib import colors

def di_func(T,HR):
    return T-(0.55-0.0055*HR)*(T-14.5);

n=1000
T = np.linspace(0,40,n)
HR = np.linspace(0,100,n)
T,HR = meshgrid(T, HR)
DI = di_func(T, HR)

cmap = colors.ListedColormap(['#95cc2d', '#c7ffce', '#ffffa0', '#ff992b', '#ff6623'])
bounds=[0,21,27,29,32,100]
norm = colors.BoundaryNorm(bounds, cmap.N)

plt.xlabel('T')
plt.ylabel('HR')
plt.grid(which='major', axis='both', linestyle=':', color='k', linewidth=0.5)

im = imshow(DI,interpolation='nearest',origin='lower',cmap=cmap, norm=norm, aspect='auto', extent=(0,40,0,100))

colorbar(im)
title('Discomfort Index\nDI = T - (0.55 - 0.0055*HR) * (T - 14.5)')
show()
```

## result

![](/_files/discomfort-index.png)
