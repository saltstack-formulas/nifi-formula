# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  {% if nifi.sysctl['configure'] != 'false' %}
  - .sysctl
  {% endif %}
  - .file