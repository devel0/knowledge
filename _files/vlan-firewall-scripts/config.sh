#=====================================================================
# INTERFACES
#=====================================================================

if_lo="lo"
if_inet=vlan10
if_bare=vlan20
if_lan=vlan40
if_wg=wg0

#==============
# INTERNET IPs
#==============

ip_my_public='xxx.yyy.zzz.www' # REPLACE WITH YOUR OWN PUBLIC IP

ip_google_dns1='8.8.8.8'
ip_google_dns2='8.8.4.4'

#==============
# INTRANET IPs
#==============

#----------------
# vlan10 (modem)
#----------------

ip_fw_vlan10='10.10.0.1'
ip_modem='10.10.0.254'

#-----------------
# vlan20 (server)
#-----------------

ip_fw_vlan20='10.10.1.1'
ip_bare='10.10.1.10'
ip_nginx='10.10.1.30'
ip_switch='10.10.1.254'

#--------------
# vlan40 (lan)
#--------------

ip_fw_vlan40='10.10.4.1'
ip_dns_dhcp='10.10.4.11'
ip_tuf='10.10.4.200'
ip_tuf_wifi='10.10.4.201'
ip_wifi_home='10.10.4.254'

#----------
# wg (vpn)
#----------

ip_wgtuf='10.10.5.2'
