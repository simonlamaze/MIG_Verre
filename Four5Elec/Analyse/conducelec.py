#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 19 18:44:44 2024

@author: fpigeonneau
"""

import numpy as np
import matplotlib.pyplot as plt

A0=np.exp(7.605)
B0=7200.

A1=4.97737084978936e3
B1=8316.937355894494

T=np.linspace(1273,1873,200)

plt.figure()

plt.semilogy(T,A0*np.exp(-B0/T),'k',label='Choudahry (1986)')
plt.semilogy(T,A1*np.exp(-B1/T),'b',label='CEMEF')
plt.xlabel(r'$T$ (K)')
plt.ylabel(r'$\sigma$ (S/m)')
plt.legend(loc=0)
