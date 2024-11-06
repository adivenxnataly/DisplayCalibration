#!/system/bin/sh

# Persistent Properties

resetprop -n persist.sys.sf.color_saturation 1.25
resetprop -n persist.sys.sf.native_mode 0

# Add blur supported for MIUI
resetprop -n ro.config.low_ram.threshold_gb 2

start panel_color

# Wait for boot to finish completely
dbg "Sleeping until boot completes."
while [[ `getprop sys.boot_completed` -ne 1 ]]
do
       sleep 1
done

# Sleep an additional 40s to ensure init is finished
sleep 40

service call SurfaceFlinger 1023 i32 0
service call SurfaceFlinger 1022 f 1.25
