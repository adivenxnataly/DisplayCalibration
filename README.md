## Display Calibration
[![Releases](https://img.shields.io/github/v/release/adivenxnataly/DisplayCalibration?color=blue&label=Release&logo=github)](https://github.com/adivenxnataly/DisplayCalibration/releases) [![License](https://img.shields.io/github/license/adivenxnataly/DisplayCalibration?color=red&label=License)](https://github.com/adivenxnataly/DisplayCalibration/blob/main/LICENSE) [![Total](https://shields.io/github/downloads/adivenxnataly/DisplayCalibration/total?logo=Bookmeter&label=Counts&logoColor=yellow&color=yellow)](https://github.com/adivenxnataly/DisplayCalibration/releases)


![banner](https://github.com/adivenxnataly/DisplayCalibration/blob/main/files/banner2.png)

**Display Calibration** is a module that implements various features such as Enhance Color Saturation, Disable VSYNC & DynamicRange for universal Android devices.

> [!warning]
> I didn't combine them all because there was a bug when combining **DynamicRange** and **Disable VSYNC**, which resulted in a crash on the surfaceflinger resulting in a blank screen.

### Color Saturation
> [!NOTE]
> **1.x - 2.x** (non-suffix) version <br>
> [`default`](https://github.com/adivenxnataly/DisplayCalibration/releases/tag/2.0-000) version using surfaceflinger for color saturation & u can change the value manually from 1.0 - 2.0.

 service running, with terminal use `su` (superuser) access :
 
    service call SurfaceFlinger 1022 f 1.25
 
 persistent on boot (property) :
 
    resetprop -n persist.sys.sf.color_saturation 1.25

 > default value 1.0, maximum value 2.0

| types    | command                                              |      value     |
|:-------- |:-----------------------------------------------------|:---------------|
| property | resetprop -n persist.sys.sf.color_saturation <value> | 1.0 - 2.0      |
| command  | service call SurfaceFlinger 1022 f <value>           | 1.0 - 2.0      |

### Disable VSYNC
> [!note]
> **vx.x-200** (suffix) version <br>
> for this version [`x.x-200`](https://github.com/adivenxnataly/DisplayCalibration/releases/tag/2.0-200) using disable VSYNC for better experience. before you install this version, try to find out if the device you are using uses VSYNC, with the command:

    dumpsys SurfaceFlinger | grep -A 15 "DesiredDisplayModeSpecs"

 | output | VSYNC |
 |:-------|:------|
 | Idle   | disable |
 | Vsync  | enable |
 
 focus on `"app: state="` if the description is `Vsync` it means your device is using VSYNC, if the description is `Idle` then the device is using disable VSYNC.
 with the command:

    service call SurfaceFlinger 1036 i32 0

 > value: 0 for disable, 1 for enable.

> [!caution]
> If you have installed but the description remains `Vsync` instead of `Idle`, then you must restart the surfaceflinger with the following steps:
> - open terminal (adb, Termux, etc.) run with root access `su`
> - then, `stop surfaceflinger` (ur screen automatically goes blank) and reboot manually by pressing the power button.
> - done!

### DynamicRange
> [!note]
> **x.x-x10** (suffix) version <br>
> for this version [`xx-x10`](https://github.com/adivenxnataly/DisplayCalibration/releases/tag/1.25-010) using Color Matrix (RGBA) Dominan for increase DynamicRange (brightness and darkness).
 with this command:

     service call SurfaceFlinger 1015 i32 1 f 1.05 f 0 f 0 f 0 f 0 f 1.05 f 0 f 0 f 0 f 0 f 1.05

| Number | Float value      | Color     |
|:-------|:-----------------|:----------|
| 1      | `f 1.05` (first) | Red 🔴    |
| 6      | `f 1.05` (second)| Green 🟢  |
| 11     | `f 1.05` (third) | Blue 🔵   |

 > the configuration for f (float) values is like this: `R G B A R G B A R G B A` and change R G B in different places, so it's not directly `R G B A` like this `service call SurfaceFlinger 1015 i32 1 f 1.05 f 1.05 f 1.05` and not use value for alpha.

 > value: 0 - 1 (normal), but in this module used 1.05 to make it stronger (not recommended).

 • for disable ColorMatrix to restore to default:

     service call SurfaceFlinger 1015 i32 0

## The Result
 ![](https://github.com/adivenxnataly/DisplayCalibration/blob/main/files/compareimg.png)
 * this result is an illustration of the results using `v1.25-010 with DynamicRange`

## Requirement
> [!important]
> Android 7+ (API 24) <br>
> **doesn't cause softbrick or bootloop.**

this is module version so install using Magisk app:
 [Download from Release page](https://github.com/adivenxnataly/DisplayCalibration/releases)
 
## Tested on
  - Android 11 - MIUI 12.5
  - Android 12 - MIUI 13
  - Android 13 - MIUI 14
  - Android 14 - HyperOS 1.0
