#!MC 1400
# Created by Tecplot 360 build 14.0.2.35002
$!VarSet |MFBD| = 'C:\Users\Wei_Tian\Documents'
$!READDATASET  '"C:\Users\Wei_Tian\Desktop\Figures for BL\RoomOnlyConstructionBoundary\result.plt" '
  READDATAOPTION = NEW
  RESETSTYLE = YES
  INCLUDETEXT = NO
  INCLUDEGEOM = NO
  INCLUDECUSTOMLABELS = NO
  VARLOADMODE = BYNAME
  ASSIGNSTRANDIDS = YES
  INITIALPLOTTYPE = CARTESIAN3D
  VARNAMELIST = '"X" "Y" "Z" "I" "J" "K" "U" "V" "W" "T" "Xi" "FlagP" "P"'
$!GLOBALTHREED SLICE{NORMAL{Y = 1}}
$!GLOBALTHREED SLICE{NORMAL{Z = 0}}
$!GLOBALTHREED SLICE{ORIGIN{Y = 0.5}}
$!CREATESLICEZONEFROMPLANE 
  SLICESOURCE = VOLUMEZONES
  FORCEEXTRACTIONTOSINGLEZONE = YES
  COPYCELLCENTEREDVALUES = NO
$!PLOTTYPE = CARTESIAN2D
$!GLOBALCONTOUR 1  VAR = 4
$!CONTOURLEVELS RESETTONICE
  CONTOURGROUP = 1
  APPROXNUMVALUES = 15
$!FIELDLAYERS SHOWCONTOUR = YES
$!GLOBALCONTOUR 1  VAR = 10
$!CONTOURLEVELS RESETTONICE
  CONTOURGROUP = 1
  APPROXNUMVALUES = 15
$!TWODAXIS YDETAIL{VARNUM = 3}
$!PICK ADDATPOSITION
  X = -1.55140186916
  Y = 0.773364485981
  CONSIDERSTYLE = YES
$!REDRAWALL 
$!Quit
$!RemoveVar |MFBD|