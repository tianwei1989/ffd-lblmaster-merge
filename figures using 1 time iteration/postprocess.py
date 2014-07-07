import os
import time
import shutil as sh
import psutil
import subprocess as sb
from threading import Thread
import datetime

def tec(exe):
    sb.call(exe)
cur_path=os.getcwd()
lev1=['double','single']
lev2=['RoomOnlyConstructionBoundary','RoomOnlyExteriorWallNoWindow','RoomOnlySurfaceBoundary','NaturalConvection','NaturalConvectionWithControl','ForcedConvection','MixedConvection','WindowWithoutShade','WindowWithShade']

for i in lev1:
    for j in lev2:
        dst=os.path.join(cur_path,i,j)
        src=os.path.join(cur_path,'process.mcr')
        sh.copy(src,dst)
print 'sucessfully copy mcr file'




t=[]
tecplot='C:/Program Files/Tecplot/Tec360 2013R1/bin/tec360.exe'

#extract data
for i in lev1:
    for j in lev2:
            os.chdir(os.path.join(cur_path,i,j,))
            filnam='process.mcr'
            dst=os.path.join(cur_path,i,j,filnam)
            print dst
            print 'cpu usage is'+str(psutil.cpu_percent(interval=0))
            exe=[tecplot,dst]
            t_new=Thread(target=tec,args=([tecplot,dst],))
            t_new.start()
            t.append(t_new)
            time.sleep(5)
            while(psutil.cpu_percent(interval=0)>90):
                print 'sleep 5s and check again'
                time.sleep(5)
ind=0
while(ind==0):
    time.sleep(5)
    print 'at least one thread is running '
    ind=1
    for i in t:
         if i.isAlive()==1:
             print i.getName()+'is still running'
             num=0
         elif i.isAlive()==0:
             print i.getName()+'ends'
             num=1
         else:
             print 'Error in judging thread alive'
         ind=ind*num
print 'sucessfully exists'
