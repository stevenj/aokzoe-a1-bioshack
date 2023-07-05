# System Configuration <28W>
#setup_var.efi 0x16e 0x2 -s 0x1 -n AmdSetup

# System Configuration <30W>
setup_var.efi 0x16e 0x3 -s 0x1 -n AmdSetup

# Sustained Power Limit [3500]
setup_var.efi 0x16f 0xdac -s 0x4 -n AmdSetup

# PPT Control <Manual> (TDP Limit)
setup_var.efi 0x173 0x1 -s 0x1 -n AmdSetup

# Fast PPT Limit [50000]
setup_var.efi 0x174 0xc350 -s 0x4 -n AmdSetup

# Slow PPT Limit [50000]
setup_var.efi 0x178 0xc350 -s 0x4 -n AmdSetup

# Slow PPT Time Constant [50000]
setup_var.efi 0x17c 0xc350 -s 0x4 -n AmdSetup

# STAPM Control <Manual>
setup_var.efi 0x180 0x1 -s 0x1 -n AmdSetup

# System Temperature Tracking <0>
setup_var.efi 0x181 0x0 -s 0x1 -n AmdSetup

# STAPM Boost Override <1>
setup_var.efi 0x182 0x1 -s 0x1 -n AmdSetup

# STAPM Boost <1>
setup_var.efi 0x183 0x1 -s 0x1 -n AmdSetup

# Tskin Time Constant [0]
setup_var.efi 0x184 0x0 -s 0x4 -n AmdSetup

# Thermal Control <Manual>
setup_var.efi 0x188 0x1 -s 0x1 -n AmdSetup

# TjMax [95]
setup_var.efi 0x189 0x5f -s 0x4 -n AmdSetup

# TDC Control <Auto>
setup_var.efi 0x18d 0x0 -s 0x1 -n AmdSetup

# EDC Control <Auto>
setup_var.efi 0x19e 0x0 -s 0x1 -n AmdSetup

# PSI3 Control <Auto>
setup_var.efi 0x1ab 0x0 -s 0x1 -n AmdSetup

# PROCHOT Control <Auto>
setup_var.efi 0x1b4 0x0 -s 0x1 -n AmdSetup

# SST Control <Auto>
setup_var.efi 0x1b9 0x0 -s 0x1 -n AmdSetup

# Fan Control <Auto>
setup_var.efi 0x1d9 0x0 -s 0x1 -n AmdSetup

# VDPP Voltage Control <Auto>
setup_var.efi 0x1ff 0x0 -s 0x1 -n AmdSetup

# VDDM Voltage Control <Auto>
setup_var.efi 0x202 0x0 -s 0x1 -n AmdSetup

# SmartShift Control <Manual>
setup_var.efi 0x208 0x1 -s 0x1 -n AmdSetup

# SmartShift Enable <Enable>
setup_var.efi 0x209 0x1 -s 0x1 -n AmdSetup

# APU Only sPPT Limit [0]
setup_var.efi 0x20a 0x0 -s 0x4 -n AmdSetup

# Sustained PowerLimt [45000]
setup_var.efi 0x20e 0xafc8 -s 0x4 -n AmdSetup

# Fast PPT Limit [45000]
setup_var.efi 0x212 0xafc8 -s 0x4 -n AmdSetup

# Slow PPT Limit [45000]
setup_var.efi 0x216 0xafc8 -s 0x4 -n AmdSetup

# Zstates (Z9 and Z10) <Disabled>
setup_var.efi 0x207 0x0 -s 0x1 -n AmdSetup

# iGPU Configuration <UMA_SPECIFIED>
setup_var.efi 0x126 0x1 -s 0x1 -n AmdSetup

# UMA Version <Auto>
#setup_var.efi 0x127 0xf -s 0x1 -n AmdSetup

# UMA Version <Non-Legacy>
#setup_var.efi 0x127 0x1 -s 0x1 -n AmdSetup

# UMA Frame buffer Size <6G> (vRAM)
#setup_var.efi 0x128 0x1800 -s 0x4 -n AmdSetup

# GPU Host Translation Cache <Auto>
setup_var.efi 0x12c 0xf -s 0x1 -n AmdSetup

# If Memory is Auto,  the Maximum Memory Data Clock Speed setting does not apply.
# Active memory Timing Settings - Auto
#setup_var.efi 0xc2 0x1 -s 0xff -n AmdSetup

# Active memory Timing Settings - Manual - Needed to set Maximum Memory Data Clock Speed
setup_var.efi 0xc2 0x1 -s 0x1 -n AmdSetup

# Maximum Memory Data Clock Speed - 5500MT/s
setup_var.efi 0xc3 0x50 -s 0x1 -n AmdSetup

# Maximum Memory Data Clock Speed - 6400MT/s
#setup_var.efi 0xc3 0x59 -s 0x1 -n AmdSetup
