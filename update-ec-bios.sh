# RUN THIS AS ROOT.
echo U | dd bs=1 count=1 seek=109 of=/sys/bus/nvmem/devices/cmos_nvram0/nvmem
echo "Reboot NOW."