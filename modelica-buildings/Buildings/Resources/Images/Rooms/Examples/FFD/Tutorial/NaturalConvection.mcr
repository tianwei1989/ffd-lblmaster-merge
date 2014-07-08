#!MC 1400
# Created by Tecplot 360 build 14.0.2.35002
$!VarSet |MFBD| = '.'
$!READDATASET  '../../../../../result.plt'
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
$!GLOBALCONTOUR 1  VAR = 4
$!CONTOURLEVELS RESETTONICE
  CONTOURGROUP = 1
  APPROXNUMVALUES = 15
$!FIELDLAYERS SHOWCONTOUR = YES
$!GLOBALCONTOUR 1  VAR = 10
$!CONTOURLEVELS RESETTONICE
  CONTOURGROUP = 1
  APPROXNUMVALUES = 15
$!PLOTTYPE = CARTESIAN2D
$!TWODAXIS YDETAIL{VARNUM = 3}
$!REDRAWALL 
$!GLOBALTWODVECTOR UVAR = 7
$!GLOBALTWODVECTOR VVAR = 9
$!RESETVECTORLENGTH 
$!FIELDLAYERS SHOWVECTOR = YES
$!REDRAWALL 
$!EXPORTSETUP EXPORTFORMAT = PNG
$!EXPORTSETUP IMAGEWIDTH = 600
$!EXPORTSETUP EXPORTFNAME = '.\NaturalConvection.png'
$!EXPORT 
  EXPORTREGION = CURRENTFRAME
$!RemoveVar |MFBD|
$!QUIT
