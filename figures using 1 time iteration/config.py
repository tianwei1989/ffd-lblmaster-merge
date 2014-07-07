import os
import shutil as sh
import time
lev1=['double','single']
cur_path=os.getcwd()
for i in lev1:
    newpath=os.path.join(cur_path,i)
    #check if new path is existing
    if not os.path.isdir(newpath):
        try:
            os.makedirs (newpath)
        except OSError:
            pass
lev2=['RoomOnlyConstructionBoundary','RoomOnlyExteriorWallNoWindow','RoomOnlySurfaceBoundary','NaturalConvection','NaturalConvectionWithControl','ForcedConvection','MixedConvection','WindowWithoutShade','WindowWithShade']
for i in lev1:
    for j in lev2:
        newpath=os.path.join(cur_path,i,j)
        #check if new path is existing
        if not os.path.isdir(newpath):
            try:
                os.makedirs (newpath)
            except OSError:
                pass
sin_bl_path='C:/Users/Wei_Tian/Documents/GitHub/tianwei_merge/modelica-buildings/Buildings'
dou_bl_path='C:/Users/Wei_Tian/Documents/GitHub/tianwei/modelica-buildings/Buildings'
for i in lev2:
    ind=0
    while(ind==0):
        print 'start to search '+i+'.mat'
        sin_fil_path=sin_bl_path+'/'+i+'.mat'
        print sin_fil_path
        dou_fil_path=dou_bl_path+'/'+i+'.mat'
        print dou_fil_path
        if os.path.isfile(sin_fil_path) and os.path.isfile(dou_fil_path):
            print i+'exists ready to copy it to according folder'
            sh.copy(sin_fil_path, os.path.join(cur_path,'single',i))
            sh.copy(dou_fil_path, os.path.join(cur_path,'double',i))
            ind=1
        else:
             print 'wait since file doesnot exist'
             time.sleep(5)
            
