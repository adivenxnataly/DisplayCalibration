## Display Calibration 

![banner](https://github.com/adivenxnataly/DisplayCalibration/blob/main/files/banner2.png)

Enhance Color Saturation for universal Android devices.
>this module using surfaceflinger, for color saturation  u can change the value manually from 1.0 - 2.0.

 service running, with terminal use `su` (superuser) access :
 
    service call SurfaceFlinger 1022 f 1.25
 
 persistent on boot (property) :
 
    resetprop -n persist.sys.sf.color_saturation 1.25

 > default value 1.0, maximum value 2.0

**New Version** x.x-200 :

for new version `x.x-200` using disable VSYNC for better experience. before you install this version, try to find out if the device you are using uses VSYNC, with the command:

    dumpsys SurfaceFlinger | grep -A 15 "DesiredDisplayModeSpecs"

 focus on `"app: state="` if the description is `Vsync` it means your device is using VSYNC, if the description is `Idle` then the device is using disable VSYNC. with the command:

    service call SurfaceFlinger 1036 i32 0

 > value: 0 for disable, 1 for enable.

 If you have installed but the description remains `Vsync` instead of `Idle`, then you must restart the surfaceflinger with the following steps:
 - open terminal (adb, Termux, etc.) run with root access `su`
 - then, `stop surfaceflinger` and reboot manually by pressing the power button.
 - done!

 **New Version** x.x-x10 :

 for new version `xx-x10` using Color Matrix (RGBA) Dominan for increase DynamicRange (brightness and darkness).
 with this command:

     service call SurfaceFlinger 1015 i32 1 f 1.05 f 0 f 0 f 0 f 0 f 1.05 f 0 f 0 f 0 f 0 f 1.05

 `f 1.05` (first) for Red 🔴, `f 1.05` (second) for Green 🟢, `f 1.05` (third) for Blue 🔵, and last for Alpha ⚪.
 > the configuration for f values is like this: `R G B A R G B A R G B A` and change R G B in different places, so it's not directly `R G B A`: `service call SurfaceFlinger 1015 i32 1 f 1.05 f 1.05 f 1.05` and not use value for alpha.

 > value: 0 - 1 (normal), but in this module used 1.05 to make it stronger (not recommended).

 • for disable ColorMatrix to restore to default:

     service call SurfaceFlinger 1015 i32 0

## The Result
 ![](https://github.com/adivenxnataly/DisplayCalibration/blob/main/files/compareimg.png)
 
## Requirement
 this is module version so install using Magisk app:
 [Download from Release page](https://github.com/adivenxnataly/DisplayCalibration/releases)
 
 *does not cause softbrick or bootloop.
 
## Warning!
 *do not downgrade the module, change the value manually in the root directory:

    /data/adb/modules/DisCal/service.sh

  open the manual file with a text editor (with root/superuser permission), change the values, save, then reboot, done!
  
## Tested on
  - Android 11 - MIUI 12.5
  - Android 12 - MIUI 13
  - Android 13 - MIUI 14
  - Android 14 - HyperOS 1.0
