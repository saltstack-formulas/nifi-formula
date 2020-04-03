# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}

{%- if nifi.pkg.javajdk %}
nifi-package-install-dependency-javajdk:
  pkg.installed:
    - name: java-{{ nifi.pkg.javajdkversion }}-openjdk
{% endif %}
