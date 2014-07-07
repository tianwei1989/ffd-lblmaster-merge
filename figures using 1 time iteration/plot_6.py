import os
import matplotlib.pyplot as plt
import numpy as np
from buildingspy.io.outputfile import Reader

cur_path=os.getcwd()
# ForcedConvection
sin_fil_path=os.path.join(cur_path,'single','ForcedConvection','ForcedConvection.mat')
dou_fil_path=os.path.join(cur_path,'double','ForcedConvection','ForcedConvection.mat')
r_sin=Reader(sin_fil_path,'dymola')
r_dou=Reader(dou_fil_path,'dymola')
#single value lists sin1--sin14

(t,sin2)=r_sin.values('roo.yCFD[2]')

#double value lists dou1--dou14

(t,dou2)=r_dou.values('roo.yCFD[2]')





#plot No.2
fig=plt.figure()
ax=fig.add_axes([0.2, 0.1, 0.7, 0.7])
ax.plot(t,sin2,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou2,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('yCFD[2]')
ax.legend(loc='upper right')
plt.savefig('./results/'+'ForcedConvection'+'_'+'CFD(2)')
plt.show()
plt.close


