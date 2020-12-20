# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import nifi with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}
  - .sysctl

# Set Systemd limits recommended by NiFi software requirements.
nifi-limits-file-file-managed:
  file.managed:
    - name: /etc/systemd/system/{{ nifi.service.name }}.service.d/override.conf
    - source: {{ files_switch(['systemdlimits.tmpl.jinja'],
                              lookup='nifi-limits-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Main Properties File.
nifi-config-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/nifi.properties
    - source: {{ files_switch(['properties.tmpl.jinja'],
                              lookup='nifi-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Boostrap Settings File. Define how NiFi will run.
nifi-bootstrap-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/bootstrap.conf
    - source: {{ files_switch(['bootstrap.tmpl.jinja'],
                              lookup='nifi-bootstrap-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Boostrap Notification Settings File.
nifi-bootstrapnotifications-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/bootstrap-notification-services.xml
    - source: {{ files_switch(['bootstrapnotifications.tmpl.jinja'],
                              lookup='nifi-bootstrapnotifications-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# Sets the nifi-env.sh settings. Primarily to define the path to Java.
nifi-nifienv-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/bin/nifi-env.sh
    - source: {{ files_switch(['nifienv.tmpl.jinja'],
                              lookup='nifi-nifienv-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Authorizers File
nifi-authorizers-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/authorizers.xml
    - source: {{ files_switch(['authorizers.tmpl.jinja'],
                              lookup='nifi-authorizers-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Login Identity Providers File
nifi-loginprovider-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/login-identity-providers.xml
    - source: {{ files_switch(['loginidentityproviders.tmpl.jinja'],
                              lookup='nifi-loginprovider-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# NiFi Login Identity Providers File
nifi-statemanagement-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/state-management.xml
    - source: {{ files_switch(['statemanagement.tmpl.jinja'],
                              lookup='nifi-statemanagement-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# Configure an embedded zookeeper. Not recommended for production.
# If the embedded zookeeper is enabled deploy zookeepers.properties file.
{% if nifi.nifi['state.management.embedded.zookeeper.start'] != 'false' %}
nifi-zookeeper-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/conf/zookeeper.properties
    - source: {{ files_switch(['zookeeperproperties.tmpl.jinja'],
                              lookup='nifi-zookeeper-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}

# If the embedded zookeeper is enabled deploy the myid file.
nifi-zookeepermyid-file-file-managed:
  file.managed:
    - name: {{ nifi.pkg.installdir }}/nifi-{{ nifi.pkg.version }}/{{ nifi.zookeeperproperties.dataDir | regex_replace('[(.*?)]','') }}/myid
    - source: {{ files_switch(['zookeepermyid.tmpl.jinja'],
                              lookup='nifi-zookeepermyid-file-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ nifi.systemdconfig.user }}
    - group: {{ nifi.systemdconfig.group }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        nifi: {{ nifi | json }}
{% endif %}
