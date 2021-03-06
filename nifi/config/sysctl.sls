{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

nifi-set-swappiness:
  sysctl.present:
    - name: vm.swappiness
    - value: {{ nifi.sysctl['vm.swappiness'] }}

nifi-set-ipv4-port-range:
  sysctl.present:
    - name: net.ipv4.ip_local_port_range
    - value: {{ nifi.sysctl['net.ipv4.ip_local_port_range'] }}

nifi-set-wmem:
  sysctl.present:
    - name: net.core.wmem_max
    - value: {{ nifi.sysctl['net.core.wmem_max'] }}

nifi-set-rmem:
  sysctl.present:
    - name: net.core.rmem_max
    - value: {{ nifi.sysctl['net.core.rmem_max'] }}