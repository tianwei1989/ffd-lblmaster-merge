import os
import time
import shutil as sh
import psutil
import subprocess as sb
from threading import Thread
import datetime

lev2=['RoomOnlyConstructionBoundary','RoomOnlyExteriorWallNoWindow','RoomOnlySurfaceBoundary','NaturalConvection','NaturalConvectionWithControl','ForcedConvection','MixedConvection','WindowWithoutShade','WindowWithShade']
for i in lev2:
    os.makedirs(os.path.join(os.getcwd(),i))
