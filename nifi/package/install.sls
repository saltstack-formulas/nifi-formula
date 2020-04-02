# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}

nifi-package-install-dependency-tar:
  pkg.installed:
    - name: tar

nifi-package-install-pkg-installed:
  archive.extracted:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}
    - source: {{ nifi.pkg.downloadurl }}
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - if_missing: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}
    - skip_verify: True
    - keep_source: False
    - options: "--strip-components=1"
    - enforce_toplevel: False
    - require:
      - pkg: nifi-package-install-dependency-tar