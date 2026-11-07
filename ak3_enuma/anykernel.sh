### AnyKernel3 Ramdisk Mod Script
## enuma (Xiaomi Pad 5 Pro 5G / kona) template for APTKernel builds
## derived from osm0sis AnyKernel3 template; packaging done by build_kernel.sh

### AnyKernel setup
properties() { '
kernel.string=APTKernel (enuma) + CIFS
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=enuma
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# stage the kernel built by build_kernel.sh (kernels/<os>/Image) into ak3 root
KDIR=$(ls -d $home/kernels/*/ 2>/dev/null | head -n1)
if [ -n "$KDIR" ] && [ -f "${KDIR}Image" ]; then
  cp -f "${KDIR}Image" $home/Image;
fi

# boot install: keep the existing ramdisk so Magisk/KernelSU patches survive
dump_boot;

write_boot;
## end boot install
