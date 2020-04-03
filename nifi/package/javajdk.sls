# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}

{%- if nifi.pkg.javajdk %}

{%- if grains['os'] == 'CentOS' %}
{%- if nifi.pkg.javajdkversion == '8' %} 
nifi-package-install-dependency-javajdk:
  pkg.installed:
    - name: java-1.{{ nifi.pkg.javajdkversion }}*-openjdk
{% endif %}
{%- if nifi.pkg.javajdkversion == '11' %} 
nifi-package-install-dependency-javajdk:
  pkg.installed:
    - name: java-11-openjdk
{% endif %}
{% endif %}

{%- if grains['os'] == 'Ubuntu' %}
{%- if nifi.pkg.javajdkversion == '8' %}
nifi-package-install-dependency-javajdk:
  pkg.installed:
    - name: openjdk-8-jdk
{% endif %}
{%- if nifi.pkg.javajdkversion == '11' %}
nifi-package-install-dependency-javajdk:
  pkg.installed:
    - name: default-jdk
{% endif %}
{% endif %}

{% endif %}
