setup_rules() {

    #region ===== debug

    log_input="true"
    log_forward="true"
    log_output="true"

    # warning: log many packets if enabled debug
    debug_input="false"
    debug_forward="false"
    debug_output="false"

    if [ "$debug_input" == "true" ]; then
        log INPUT-2 "dbg [inp]"
    elif [ "$debug_input" != "false" ]; then # specific ip debugging
        log INPUT-2 "dbg [inp]" $debug_input
    fi

    if [ "$debug_output" == "true" ]; then
        log OUTPUT-2 "dbg [out]"
    elif [ "$debug_output" != "false" ]; then # specific ip debugging
        log OUTPUT-2 "dbg [out]" $debug_output
    fi

    if [ "$debug_forward" == "true" ]; then
        log FORWARD-2 "dbg [fwd]"
    elif [ "$debug_forward" != "false" ]; then # specific ip debugging
        log FORWARD-2 "dbg [fwd]" $debug_forward
    fi

    #endregion

    #region ===== badpackets

    # check if bad packets coming from internet

    drop BADPACKETS -p ALL -i $if_inet -s $ip_my_public
    drop BADPACKETS -p ALL -i $if_inet -s $net_priv_a
    drop BADPACKETS -p ALL -i $if_inet -s $net_priv_b
    drop BADPACKETS -p ALL -i $if_inet -s $net_priv_c
    drop BADPACKETS -p ALL -i $if_inet -s $net_priv_d
    drop BADPACKETS -p ALL -i $if_inet -s $net_priv_e

    drop BADPACKETS -p ALL -i $if_inet -m state --state INVALID
    drop BADPACKETS -p tcp -i $if_inet ! --syn -m state --state NEW
    drop BADPACKETS -p tcp -i $if_inet --tcp-flags ALL NONE
    drop BADPACKETS -p tcp -i $if_inet --tcp-flags ALL ALL
    drop BADPACKETS -p tcp -i $if_inet --tcp-flags ALL FIN,URG,PSH
    drop BADPACKETS -p tcp -i $if_inet --tcp-flags SYN,RST SYN,RST
    drop BADPACKETS -p tcp -i $if_inet --tcp-flags SYN,FIN SYN,FIN
    drop BADPACKETS -p ICMP -i $if_inet --fragment

    drop BADPACKETS -p UDP -i $if_inet -s 0/0 --destination-port 137
    drop BADPACKETS -p UDP -i $if_inet -s 0/0 --destination-port 138

    drop BADPACKETS -i $if_inet -m pkttype --pkt-type broadcast

    #endregion

    #region ----- established connections and loopback interface

    comment="established connections"
    accept_established INPUT-2 -p ALL
    accept_established OUTPUT-2 -p ALL
    accept_established FORWARD-2 -p ALL

    comment="accept loopback interface"
    accept INPUT-2 -i $if_lo

    comment="allow to loopback iface"
    accept OUTPUT-2 -o $if_lo

    #endregion

    #region ----- BARE METAL SERVER    

    comment="allow bare go to inet"
    accept FORWARD-2 -s $ip_bare -o $if_inet

    #endregion     

    #region ----- FIREWALL     

    comment="allow wg0 from inet"
    accept INPUT-2 -p udp --dport $svc_wireguard

    comment="allow firewall out to inet dns"
    accept OUTPUT-2 -o $if_inet -d $ip_google_dns1,$ip_google_dns2

    comment="allow firewall out to http(s)"
    accept OUTPUT-2 -o $if_inet -p tcp -m multiport --dports $svc_http,$svc_https

    comment="allow firewall go to dns (udp)"
    accept OUTPUT-2 -d $ip_dns_dhcp -p udp --dport $svc_dns

    comment="allow firewall go to dns (tcp)"
    accept OUTPUT-2 -d $ip_dns_dhcp -p tcp --dport $svc_dns

    comment="allow firewall go to ntp (udp)"
    accept OUTPUT-2 -p udp --dport $svc_ntp

    comment="accept rx ping"
    accept INPUT-2 -p ICMP --icmp-type 8
    accept INPUT-2 -p ICMP --icmp-type 11

    comment="allow tx ping"
    accept OUTPUT-2 -p ICMP --icmp-type 8
    accept OUTPUT-2 -p ICMP --icmp-type 11

    #endregion    

    #region ----- NGINX
    
    comment="redirect internet http(s) to nginx"
    pre_add -d $ip_fw_vlan10 -p tcp -m multiport --dports $svc_http,$svc_https -j DNAT --to $ip_nginx

    comment="allow forward to nginx http(s)"
    accept FORWARD-2 -d $ip_nginx -p tcp -m multiport --dports $svc_http,$svc_https

    comment="allow nginx go to http(s)"
    accept FORWARD-2 -s $ip_nginx -p tcp -m multiport --dports $svc_http,$svc_https
        
    comment="allow nginx go to dns (udp)"
    accept FORWARD-2 -s $ip_nginx -d $ip_dns_dhcp -p udp --dport $svc_dns

    comment="allow nginx go to dns (tcp)"
    accept FORWARD-2 -s $ip_nginx -d $ip_dns_dhcp -p tcp --dport $svc_dns

    comment="allow nginx go to ntp (udp)"
    accept FORWARD-2 -s $ip_nginx -p udp --dport $svc_ntp    

    comment="allow nginx go to wifi-home"
    accept FORWARD-2 -s $ip_nginx -d $ip_wifi_home -p tcp --dport $svc_http    

    #---

    comment="allow nginx go to dns-dhcp (dnsweb)"
    accept FORWARD-2 -s $ip_nginx -d $ip_dns_dhcp -p tcp --dport $svc_dnsweb

    comment="allow nginx go to modem (http)"
    accept FORWARD-2 -s $ip_nginx -d $ip_modem -p tcp --dport $svc_http

    comment="allow nginx go to switch (http)"
    accept FORWARD-2 -s $ip_nginx -d $ip_switch -p tcp --dport $svc_http

    #endregion

    #region ----- POWERUSER

    comment="allow poweruser input to firewall"
    accept INPUT-2 -i $if_lan -s $ip_tuf,$ip_tuf_wifi
    accept INPUT-2 -i $if_wg -s $ip_wgtuf

    comment="allow poweruser forward"
    accept FORWARD-2 -i $if_lan -s $ip_tuf,$ip_tuf_wifi
    accept FORWARD-2 -i $if_wg -s $ip_wgtuf

    #endregion

    #region ----- LAN        

    comment="allow lan go to inet"
    accept FORWARD-2 -i $if_lan -o $if_inet

    #endregion

    #region ===== drop policy and log

    if [[ "$policy_input" == "DROP" && "$log_input" == "true" ]]; then
        log INPUT-2 "DROP [inp]"
    fi

    if [[ "$policy_output" == "DROP" && "$log_output" == "true" ]]; then
        log OUTPUT-2 "DROP [out]"
    fi

    if [[ "$policy_forward" == "DROP" && "$log_forward" == "true" ]]; then
        log FORWARD-2 "DROP [fwd]"
    fi

    #endregion

    #region ===== masquerade

    post_add -o $if_inet -j MASQUERADE

    #endregion

}
