#!/usr/bin/env bash

#-------
# debug
#-------
# set -x

source /etc/environment

exdir=$(dirname $(readlink -f "$BASH_SOURCE"))

#=====================================================================
# CONSTANTS
#=====================================================================

source "$exdir"/config.sh
source "$exdir"/misc.sh
source "$exdir"/services.sh
source "$exdir"/commands.sh
source "$exdir"/rules.sh

iptprocs=$(pidof iptables)
if [ "x$iptprocs" != "x" ]; then
	echo "There are other processes using iptables at the moment:"
	echo "$iptprocs = $(ps -fp $iptprocs)"
	exit 1
fi

#=====================================================================
# MAIN
#=====================================================================

echo Setting firewall

load_modules

reset_iptables

setup_kernel_level_protection

set_iptables_policies

setup_rules

enable_ip_forward

set +x
