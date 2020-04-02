# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}

include:
  - {{ sls_config_file }}

# Install the NiFi Systemd service using the nifi service installer so it starts and stops with server properly.
nifi-install-systemdservice:
  cmd.run:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/bin/nifi.sh install && systemctl daemon-reload
    - onlyif: test -z "$(ls -A /etc/rc.d/init.d/nifi)"
    - require:
      - sls: {{ sls_config_file }}

# Check that the service is running, restart it if files are changed
nifi-service-running-service-running:
  service.running:
    - name: {{ nifi.service.name }}
    - enable: True
    - require:
      - sls: {{ sls_config_file }}
      - cmd: nifi-install-systemdservice
    - watch:
      - sls: {{ sls_config_file }}