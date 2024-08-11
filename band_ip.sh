#/bin/bash
interfaces=enp3s0f1
for I in $(seq 34 62); 
 do nmcli con mod ${interfaces} +ipv4.addresses X.X.X.${I}; done; nmcli con up ${interfaces}
