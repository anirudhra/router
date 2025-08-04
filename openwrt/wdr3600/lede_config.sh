#install GUI
opkg update && opkg install luci && opkg install luci-theme-material

#backup existing config files
mv /etc/config/sqm /etc/config/sqm_backup
mv /etc/config/adblock /etc/config/adblock_backup
mv /etc/adblock/adblock.whitelist /etc/adblock/adblock.whitelist_backup

#install sqm
opkg remove qos-scripts; opkg remove luci-app-qos; opkg install luci-app-sqm

#install USB fs support: ext4/fat32/exfat
opkg install kmod-fs-ext4
opkg install kmod-fs-vfat
opkg install kmod-fs-exfat && opkg install libblkid
opkg install block-mount

#install adblock
opkg install luci-app-adblock

#backup fresh config files and restore saved config files
#mv /etc/config/sqm /etc/config/sqm_new
#mv /etc/config/adblock /etc/config/adblock_new
#mv /etc/adblock/adblock.whitelist /etc/adblock/adblock.whitelist_new
cp /etc/config/sqm_backup /etc/config/sqm
cp /etc/config/adblock_backup /etc/config/adblock
cp /etc/adblock/adblock.whitelist_backup /etc/adblock/adblock.whitelist

#reboot
echo Router will now reboot...
sleep 5
reboot
