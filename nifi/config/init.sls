# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  {% if nifi.sysctl['configure'] != 'false' %}
  - .sysctl
  {% endif %}
  - .file