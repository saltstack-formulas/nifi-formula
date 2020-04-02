nifi-set-swappiness:
  sysctl.present:
    - name: vm.swappiness
    - value: 0

nifi-set-ipv4-port-range:
  sysctl.present: 
    - name: net.ipv4.ip_local_port_range
    - value: "10000 65000"