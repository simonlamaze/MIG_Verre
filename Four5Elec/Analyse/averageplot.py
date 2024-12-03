#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 11 07:32:19 2024

@author: fpigeonneau
"""

# ---------------------------------
# Importation of the useful modules
# ---------------------------------

import numpy as np
import matplotlib.pyplot as plt

# Loading of the file .txt
A=np.loadtxt('averagedata.txt',skiprows=1)
N=np.size(A,0)
t=A[:,0]
MaxDT=A[:,1]
Tout=A[:,2]
PhiSurf=A[:,3]
PElec=A[:,13]

plt.figure()
plt.plot(t,Tout)
plt.xlabel(r'$t$ (s)')
plt.ylabel(r'$T$ (K)')

plt.figure()
plt.plot(t,PhiSurf)
plt.xlabel(r'$t$ (s)')
plt.ylabel(r'$\phi$ (W/m$^2$)')
plt.ylim((0,1e5))

plt.figure()
plt.plot(t[10:],MaxDT[10:])
plt.xlabel(r'$t$ (s)')
plt.ylabel(r'$||T^n-T^{n-1}||_{\infty}$ (K)')

plt.figure()
plt.plot(t,PElec)
plt.xlabel(r'$t$ (s)')
plt.ylabel(r'$P_{\mathrm{elec}}$ (K)')

plt.show()
