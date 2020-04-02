# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}

nifi-service-clean-service-dead:
  service.dead:
    - name: {{ nifi.service.name }}
    - enable: False
