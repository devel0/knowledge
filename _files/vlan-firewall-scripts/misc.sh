#=====================================================================
# DEFAULT POLICIES
#=====================================================================

policy_input="DROP"
policy_output="DROP"
policy_forward="DROP"

#=====================================================================
# KNOWN NETWORK AND IPs
#=====================================================================

ip_lo='127.0.0.1'
ip_multicast='255.255.255.255'
#multicast_ping_ip='"224.0.0.1'
ip_llmnr='224.0.0.252'

iana_ephemeral_from=49152
iana_ephemeral_to=65535

net_priv_a='10.0.0.0/8'
net_priv_b='172.16.0.0/12'
net_priv_c='192.168.0.0/16'
net_priv_d='224.0.0.0/4'
net_priv_e='240.0.0.0/5'

#net_dockers=$net_priv_b

net_lo='127.0.0.1/8'
