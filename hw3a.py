import math              as m 
import numpy             as np
import matplotlib.pyplot as plt
import sys

#use sys code to save user's choice.
ts = int(sys.argv[1])
fo = open('/home/B12/b12209017/hw3/input/input_%05d.csv' %(ts), 'r')

#save line0(number of data) as n.
n  = fo.readline()
line1 = fo.readline()

#declare the required variables and lists.
IVTx,IVTy,IVT = 0., 0., 0.
p, u, v, qv   = [], [], [], []

#put input data(.csv) into four lists.
for i in range(int(n)):
    line  = fo.readline()
    lines = line.split(',')
    p .append(float(lines[0]))
    qv.append(float(lines[1])*1000) #kg/kg to g/kg
    u .append(float(lines[2]))
    v .append(float(lines[3]))
    
#draw a figure and split it into two parts as ax[0],ax[1],
#and share the same y-axis.
f, ax = plt.subplots(1,2, sharey='row', figsize=(8,6))

#sets of ax[0].
ax[0].  plot(qv,p, 'k-o')
ax[0].  set_title('Qv [g/kg] @t='+str(ts))
ax[0].  set_xlim([0,20])
ax[0].  set_xticks(np.linspace(0,20,5))
ax[0].  set_ylabel('Pressure [hPa]')
ax[0].  set_ylim([1000,100])
ax[0].  set_yscale('log')
#set ticks and let '' replace tick of 300.
ax[0].  set_yticks([100,200,300,400,600,800,1000])
ax[0].  set_yticklabels(['100','200','','400','600','800','1000'])

#sets of ax[1].
ax[1].  plot(u ,p, 'r-d')
ax[1].  plot(v ,p, 'b--')
ax[1].  set_title('U/V [m/s] @t='+str(ts))
ax[1].  set_xlim([0,20])
ax[1].  set_xticks(np.linspace(-20,20,5))
ax[1].  legend(['u-wind','v-wind'], fontsize=10)

#save figure as specified .png data.
plt.savefig('profile_%05d.png' %(ts)) 
