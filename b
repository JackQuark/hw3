import math              as m 
import numpy             as np
import matplotlib.pyplot as plt
import sys

#use sys code to save user's choice.
t = int(sys.argv[1])

IVTl = []
IVTn = np.arange(1, t+1)

#use for loop to select .csv data from 00001 to 0000t.
for i in range(t):
    fo = open('/home/B12/b12209017/hw3/input/input_%05d.csv' %(i+1), 'r')
    
    #save line0(number of data) as n.
    n  = fo.readline()
    line1 = fo.readline()

    #reset the required variables and lists.
    IVTx,IVTy,IVT = 0., 0., 0.
    p, u, v, qv   = [], [], [], []

    #put input data(.csv) into four lists.
    for k in range(int(n)):
        line  = fo.readline()
        lines = line.split(',')
        p .append(float(lines[0])*100)
        qv.append(float(lines[1]))
        u .append(float(lines[2]))
        v .append(float(lines[3]))
        
    #calculate value of IVT and append it into a list(IVTl).
    for j in range(int(n)-1):
        IVTx = IVTx + (((u[j]*qv[j])+(u[j+1]*qv[j+1]))*0.5)*(p[j+1]-p[j])
        IVTy = IVTy + (((v[j]*qv[j])+(v[j+1]*qv[j+1]))*0.5)*(p[j+1]-p[j])
    IVTx = IVTx/-9.8
    IVTy = IVTy/-9.8

    IVT  = m.sqrt(IVTx**2 + IVTy**2)
    IVTl.append(float(IVT))
    
#set the range,ticks,label of x-axis and y-axis,
#and  draw a figure of unmber in x-axis and IVT in y-axis.
plt.plot(IVTn, IVTl, '-')
plt.xlim([1,int(t)])
plt.xticks(np.linspace(1,t,11))
plt.title('IVT Time Series (t=1~%d)' %(t))
plt.ylim([0,1000])
plt.yticks(np.linspace(0,1000,6))
plt.ylabel('kg/m/s')

#save figure as specified .png data.
plt.savefig('IVT_timeseries_%05d.png' %(t))
