#=====================================================================
# COMMAND ALIASES
#=====================================================================

cmd_ip="/usr/sbin/ip"
cmd_ipt="/usr/sbin/iptables -w 60"
cmd_sysctl="/usr/sbin/sysctl -w"
#cmd_ipset="/sbin/ipset"

#=====================================================================
# FUNCTIONS
#=====================================================================

comment=""

load_modules() {
	modprobe ip_conntrack_ftp
	modprobe nf_conntrack_ftp
}

#-------------------------
# args: [ipset_tbl_name]*
#-------------------------
create_ipset_tables() {
	for i in $*; do
		echo Creating ipset table [$i]
		$cmd_ipset -N $i nethash >&/dev/null
	done
	echo "LIST IPSET"
	$cmd_ipset list
}

reset_iptables() {
	echo Resetting iptables

	# check if tables previously exists
	iptables -L -n | grep OUTPUT-2 >&/dev/null

	if [ "$?" == "0" ]; then
		echo "--> FIREWALL MODIFICATION"

		# delete jump to chain
		$cmd_ipt -t filter -D INPUT -j BADPACKETS
		$cmd_ipt -t filter -D INPUT -j INPUT-2
		$cmd_ipt -t filter -D FORWARD -j FORWARD-2
		$cmd_ipt -t filter -D OUTPUT -j OUTPUT-2
		$cmd_ipt -t nat -D PREROUTING -j PREROUTING-2
		$cmd_ipt -t nat -D POSTROUTING -j POSTROUTING-2
		$cmd_ipt -t nat -D OUTPUT -j NAT-OUTPUT-2

		# flush rules
		$cmd_ipt -t filter -F BADPACKETS
		$cmd_ipt -t filter -F INPUT-2
		$cmd_ipt -t filter -F FORWARD-2
		$cmd_ipt -t filter -F OUTPUT-2
		$cmd_ipt -t nat -F PREROUTING-2
		$cmd_ipt -t nat -F POSTROUTING-2
		$cmd_ipt -t nat -F NAT-OUTPUT-2

		# delete chain
		$cmd_ipt -t filter -X BADPACKETS
		$cmd_ipt -t filter -X INPUT-2
		$cmd_ipt -t filter -X FORWARD-2
		$cmd_ipt -t filter -X OUTPUT-2
		$cmd_ipt -t nat -X PREROUTING-2
		$cmd_ipt -t nat -X POSTROUTING-2
		$cmd_ipt -t nat -X NAT-OUTPUT-2

	else
		echo "--> INITIAL FIREWALL"
	fi

	# create chains
	$cmd_ipt -t filter -N BADPACKETS
	$cmd_ipt -t filter -N INPUT-2
	$cmd_ipt -t filter -N FORWARD-2
	$cmd_ipt -t filter -N OUTPUT-2
	$cmd_ipt -t nat -N PREROUTING-2
	$cmd_ipt -t nat -N POSTROUTING-2
	$cmd_ipt -t nat -N NAT-OUTPUT-2

	# create jump to chain
	$cmd_ipt -t filter -A INPUT -j BADPACKETS
	$cmd_ipt -t filter -A INPUT -j INPUT-2
	$cmd_ipt -t filter -A FORWARD -j FORWARD-2
	$cmd_ipt -t filter -A OUTPUT -j OUTPUT-2
	$cmd_ipt -t nat -A PREROUTING -j PREROUTING-2
	$cmd_ipt -t nat -A POSTROUTING -j POSTROUTING-2
	$cmd_ipt -t nat -A OUTPUT -j NAT-OUTPUT-2
}

setup_kernel_level_protection() {
	echo Setup kernel level protection

	# enable SYN flood protection
	$cmd_sysctl net.ipv4.tcp_syncookies="1" >&/dev/null

	# enable reverse path filter
	$cmd_sysctl net.ipv4.conf.all.rp_filter="1" >&/dev/null

	# protect about smurfs attack
	$cmd_sysctl net.ipv4.icmp_echo_ignore_broadcasts="1" >&/dev/null

	# disable icmp redirects
	$cmd_sysctl net.ipv4.conf.all.accept_redirects="0" >&/dev/null

	# allow secure icmp redirects
	$cmd_sysctl net.ipv4.conf.all.secure_redirects="1" >&/dev/null
}

set_iptables_policies() {
	echo Setting iptable default policies

	$cmd_ipt -P INPUT $policy_input
	$cmd_ipt -P OUTPUT $policy_output
	$cmd_ipt -P FORWARD $policy_forward
}

#----------------------------------------
# args : <table> <log name> [<args...>]*
#----------------------------------------
log() {
	$cmd_ipt -A $1 ${@:3} -j LOG --log-level info --log-prefix "${2} "
}

#---------------------------------
# args: <table> [<iptable-args>]*
#---------------------------------
accept() {
	if [ "x$comment" != "x" ]; then
		$cmd_ipt -A $1 ${@:2} -m comment --comment "$comment" -j ACCEPT
		comment=""
	else
		$cmd_ipt -A $1 ${@:2} -j ACCEPT
	fi
}

#---------------------------------
# args: <table> [<iptable-args>]*
#---------------------------------
drop() {
	if [ "x$comment" != "x" ]; then
		$cmd_ipt -A $1 ${@:2} -m comment --comment "$comment" -j DROP
		comment=""
	else
		$cmd_ipt -A $1 ${@:2} -j DROP
	fi
}

#---------------------------------
# args: <table> [<iptable-args>]*
#---------------------------------
accept_established() {
	accept $1 ${@:2} -m state --state ESTABLISHED,RELATED
}

#----------------------------------------------------
# args: <table> <chain-to-jump-to> [<iptable-args>]*
#----------------------------------------------------
jump() {
	$cmd_ipt -A $1 ${@:3} -j $2
}

#-------------------------
# args: [<iptable-args>]*
#-------------------------
pre_add() {
	if [ "x$comment" != "x" ]; then
		$cmd_ipt -t nat -A PREROUTING-2 -m comment --comment "$comment" $*
		comment=""
	else
		$cmd_ipt -t nat -A PREROUTING-2 $*
	fi
}

#-------------------------
# args: [<iptable-args>]*
#-------------------------
post_add() {
	if [ "x$comment" != "x" ]; then
		$cmd_ipt -t nat -A POSTROUTING-2 -m comment --comment "$comment" $*
		comment=""
	else
		$cmd_ipt -t nat -A POSTROUTING-2 $*
	fi
}

#-------------------------
# args: [<iptable-args>]*
#-------------------------
out_add() {
	if [ "x$comment" != "x" ]; then
		$cmd_ipt -t nat -A NAT-OUTPUT-2 -m comment --comment "$comment" $*
		comment=""
	else
		$cmd_ipt -t nat -A NAT-OUTPUT-2 $*
	fi
}

enable_ip_forward() {
	# enable ip forward
	$cmd_sysctl net.ipv4.ip_forward="1" >&/dev/null
}


#-------------------------
# args: servername serverip
#-------------------------
allow_basic() {
	comment="allow $1 go to inet http(s)"
    accept FORWARD-2 -s $2 -o $if_inet -p tcp -m multiport --dports $svc_http,$svc_https

    comment="allow $1 go to dns (udp)"
    accept FORWARD-2 -s $2 -d $ip_dns_dhcp -p udp --dport $svc_dns

    comment="allow $1 go to dns (tcp)"
    accept FORWARD-2 -s $2 -d $ip_dns_dhcp -p tcp --dport $svc_dns

    comment="allow $1 go to ntp (udp)"
    accept FORWARD-2 -s $2 -p udp --dport $svc_ntp

	comment="allow ping"
    accept FORWARD-2 -p ICMP --icmp-type 8
    accept FORWARD-2 -p ICMP --icmp-type 11	
}