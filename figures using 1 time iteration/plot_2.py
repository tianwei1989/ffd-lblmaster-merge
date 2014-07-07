import os
import matplotlib.pyplot as plt
import numpy as np
from buildingspy.io.outputfile import Reader

cur_path=os.getcwd()
# RoomOnlyExteriorWallNoWindow
sin_fil_path=os.path.join(cur_path,'single','RoomOnlyExteriorWallNoWindow','RoomOnlyExteriorWallNoWindow.mat')
dou_fil_path=os.path.join(cur_path,'double','RoomOnlyExteriorWallNoWindow','RoomOnlyExteriorWallNoWindow.mat')
r_sin=Reader(sin_fil_path,'dymola')
r_dou=Reader(dou_fil_path,'dymola')
#single value lists sin1--sin14
(t,sin1)=r_sin.values('roo.yCFD[1]')
print (t,sin1)
(t,sin2)=r_sin.values('roo.yCFD[2]')
(t,sin3)=r_sin.values('roo.air.conExt[1].Q_flow')
(t,sin4)=r_sin.values('roo.air.conExt[2].Q_flow')
(t,sin5)=r_sin.values('roo.air.conExt[3].Q_flow')
(t,sin6)=r_sin.values('roo.air.conExt[4].Q_flow')
(t,sin7)=r_sin.values('roo.air.conExt[5].Q_flow')
(t,sin8)=r_sin.values('roo.air.conExt[6].Q_flow')
(t,sin9)=r_sin.values('roo.air.conExt[1].T')
(t,sin10)=r_sin.values('roo.air.conExt[2].T')
(t,sin11)=r_sin.values('roo.air.conExt[3].T')
(t,sin12)=r_sin.values('roo.air.conExt[4].T')
(t,sin13)=r_sin.values('roo.air.conExt[5].T')
(t,sin14)=r_sin.values('roo.air.conExt[6].T')
#double value lists dou1--dou14
(t,dou1)=r_dou.values('roo.yCFD[1]')
(t,dou2)=r_dou.values('roo.yCFD[2]')
(t,dou3)=r_dou.values('roo.air.conExt[1].Q_flow')
(t,dou4)=r_dou.values('roo.air.conExt[2].Q_flow')
(t,dou5)=r_dou.values('roo.air.conExt[3].Q_flow')
(t,dou6)=r_dou.values('roo.air.conExt[4].Q_flow')
(t,dou7)=r_dou.values('roo.air.conExt[5].Q_flow')
(t,dou8)=r_dou.values('roo.air.conExt[6].Q_flow')
(t,dou9)=r_dou.values('roo.air.conExt[1].T')
(t,dou10)=r_dou.values('roo.air.conExt[2].T')
(t,dou11)=r_dou.values('roo.air.conExt[3].T')
(t,dou12)=r_dou.values('roo.air.conExt[4].T')
(t,dou13)=r_dou.values('roo.air.conExt[5].T')
(t,dou14)=r_dou.values('roo.air.conExt[6].T')
#print (t,dou14)

#plot No.1
fig=plt.figure()
ax=fig.add_axes([0.1, 0.1, 0.7, 0.7])
ax.plot(t,sin1,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou1,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('yCFD[1]')
ax.legend(loc='upper right')
plt.savefig('./results/'+'RoomOnlyExteriorWallNoWindow'+'_'+'CFD(1)')
plt.show()
plt.close

#plot No.2
fig=plt.figure()
ax=fig.add_axes([0.1, 0.1, 0.7, 0.7])
ax.plot(t,sin2,linewidth=1.5,linestyle="-",label="FFD_single")
ax.plot(t,dou2,linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
ax.set_xlabel('seconds')
ax.set_ylabel('yCFD[2]')
ax.legend(loc='upper right')
plt.savefig('./results/'+'RoomOnlyExteriorWallNoWindow'+'_'+'CFD(2)')
plt.show()
plt.close

T_sin=[sin9,sin10,sin11,sin12,sin13,sin14]
T_dou=[dou9,dou10,dou11,dou12,dou13,dou14]
Q_sin=[sin3,sin4,sin5,sin6,sin7,sin8]
Q_dou=[dou3,dou4,dou5,dou6,dou7,dou8]
#plot No.3-No.8 No.9-No.14
for i in range (6):

    fig=plt.figure()
    ax=fig.add_axes([0.1, 0.1, 0.7, 0.7])
    ax.plot(t,Q_sin[i],linewidth=1.5,linestyle="-",label="FFD_single")
    ax.plot(t,Q_sin[i],linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
    ax.set_xlabel('seconds')
    ax.set_ylabel('roo.air.conExt[%d].Q_flow' % (i+1))
    ax.legend(loc='upper right')
    plt.savefig('./results/'+'RoomOnlyExteriorWallNoWindow'+'_'+'Q('+str(i+1)+')')
    plt.show()
    plt.close()

    fig=plt.figure()
    ax=fig.add_axes([0.1, 0.1, 0.7, 0.7])
    ax.plot(t,T_sin[i],linewidth=1.5,linestyle="-",label="FFD_single")
    ax.plot(t,T_dou[i],linewidth=1.5,linestyle="--",marker='*',markevery=10,label="FFD_double")
    ax.set_xlabel('seconds')
    ax.set_ylabel('roo.air.conExt[%d].T' % (i+1))
    ax.legend(loc='upper right')
    plt.savefig('./results/'+'RoomOnlyExteriorWallNoWindow'+'_'+'T('+str(i+1)+')')
    plt.show()
    plt.close()

