## Display Calibration 

Enhance Display Calibration for universal Android devices (this module using surfaceflinger, so u can change the value manually from 1.0 - 1.5).

 service running :
 
    service call SurfaceFlinger 1022 f 1.25
 
 persistent on boot :
 
    resetprop -n persist.sys.sf.color_saturation 1.25

 *default value 1.0, maximum value 1.5

 
## Requirement
 this is module version so install using Magisk app.

 *does not cause softbrick or bootloop.

## Tested on
  - Android 11 - MIUI 12.5
  - Android 12 - MIUI 13
  - Android 13 - MIUI 14
  - Android 14 - HyperOS 1.0
