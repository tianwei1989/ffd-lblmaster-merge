import os
import matplotlib.pyplot as plt
import numpy as np
from buildingspy.io.outputfile import Reader

cur_path=os.getcwd()
# MixedConvection
sin_fil_path=os.path.join(cur_path,'single','MixedConvection','MixedConvection.mat')
dou_fil_path=os.path.join(cur_path,'double','MixedConvection','MixedConvection.mat')
r_sin=Reader(sin_fil_path,'dymola')
r_dou=Reader(dou_fil_path,'dymola')
#single value lists sin1--sin14
(t,sin1)=r_sin.values('roo.yCFD[1]')
(t,sin2)=r_sin.values('roo.yCFD[2]')
(t,sin3)=r_sin.values('TFlo.port.Q_flow')
(t,sin4)=r_sin.values('TOthWal[1].port.Q_flow')
(t,sin5)=r_sin.values('TOthWal[1].port.Q_flow')
#double value lists dou1--dou14
(t,dou1)=r_dou.values('roo.yCFD[1]')
(t,dou2)=r_dou.values('roo.yCFD[2]')
(t,dou3)=r_dou.values('TFlo.port.Q_flow')
(t,dou4)=r_dou.values('TOthWal[1].port.Q_flow')
(t,dou5)=r_dou.values('TOthWal[1].port.Q_flow')


#plot No.1
fig=plt.figure()
ax=fig.add_axes([0.1, 0.1, 0.7, 0.7])
ax.plot(t,sin1,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou1,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('yCFD[1]')
ax.legend(loc='lower right')
plt.savefig('./results/'+'MixedConvection'+'_'+'CFD(1)')
plt.show()
plt.close

#plot No.2
fig=plt.figure()
ax=fig.add_axes([0.2, 0.1, 0.7, 0.7])
ax.plot(t,sin2,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou2,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('yCFD[2]')
ax.legend(loc='lower right')
plt.savefig('./results/'+'MixedConvection'+'_'+'CFD(2)')
plt.show()
plt.close


fig=plt.figure()
ax=fig.add_axes([0.2, 0.1, 0.7, 0.7])
ax.plot(t,sin3,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou3,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('TFlo.port.Q_flow')
ax.legend(loc='upper right')
plt.savefig('./results/'+'MixedConvection'+'_'+'TFlo_port_Q_flow')
plt.show()
plt.close

fig=plt.figure()
ax=fig.add_axes([0.2, 0.1, 0.7, 0.7])
ax.plot(t,sin4,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou4,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('TOthWal[1].port.Q_flow')
ax.legend(loc='upper right')
plt.savefig('./results/'+'MixedConvection'+'_'+'TOthWal[1]_port_Q_flow')
plt.show()
plt.close

fig=plt.figure()
ax=fig.add_axes([0.2, 0.1, 0.7, 0.7])
ax.plot(t,sin5,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou5,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('TOthWal[2].port.Q_flow')
ax.legend(loc='upper right')
plt.savefig('./results/'+'MixedConvection'+'_'+'TOthWal[2]_port_Q_flow')
plt.show()
plt.close
