#!/system/bin/sh
exec > /tmp/g62_touch.log 2>&1
i=0
while [ ! -d /sys/module/sensors_class ] && [ $i -lt 90 ]; do
  sleep 1
  i=$((i+1))
done
sleep 2
for m in wl2864c ocp2138 sm5350_bl leds_aw99703 nova_0flash_mmi; do
  if [ -f /lib/modules/$m.ko ]; then
    insmod /lib/modules/$m.ko
  else
    insmod /vendor_dlkm/lib/modules/$m.ko
  fi
  echo "$m: $?"
done
