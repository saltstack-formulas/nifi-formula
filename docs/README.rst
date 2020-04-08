.. _readme:

nifi-formula
================

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/nifi-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/nifi-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

A salt formula to deploy Apache NiFi

Configure Apache NiFi in 3 different configurations:

* Standalone
* Cluster with embedded Zookeeper
* Cluster with external Zookeeper

Configures systemd and sysctl limits automatically. See the
pillar.example for detailed list of pillars.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please pay attention to the ``pillar.example`` file and/or `Special notes`_ section.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Special notes
-------------

Requirements
^^^^^^^^^^^^^^

* CentOS, Ubuntu, Debian
* Cluster configurations require hosts setup with FQDN and DNS.

Sample Pillars
^^^^^^^^^^^^^^

Pillars - Standalone Node
~~~~~~~~~~~~~~~~~~~~~~~~~

By Default all of the settings will configure a standalone NiFi Node

::

    nifi:
      pkg:
        name: nifi
        downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.4-bin.tar.gz
        version: 1.11.4
        installdir: /opt
        # JDK Package to install. Leave empty to not install.
        javajdk: java-1.8.0-openjdk
      nifi:
        cluster.is.node: 'false'
      systemdconfig:
        user: root
        group: root
        limitnofile: 50000
        limitnproc: 10000

Pillars - 3 Node Cluster with Embedded Zookeeper
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    nifi:
      pkg:
        name: nifi
        downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.4-bin.tar.gz
        version: 1.11.4
        installdir: /opt
        # JDK Package to install. Leave empty to not install.
        javajdk: java-1.8.0-openjdk
      systemdconfig:
        user: root
        group: root
        limitnofile: 50000
        limitnproc: 10000
      nifi:
        # cluster node properties (only configure for cluster nodes) #
        cluster.is.node: 'true'
        cluster.node.address: {{ grains['fqdn'] }}
        cluster.node.protocol.port: '1111'
        cluster.flow.election.max.wait.time: '1 mins'
        zookeeper.connect.string: 'nifi-1.localdomain:2181,nifi-2.localdomain:2181,nifi-3.localdomain:2181'
        state.management.embedded.zookeeper.start: 'true'
        web.http.host: {{ grains['fqdn'] }}
      zookeeperproperties:
        # To configure Zookeeper.properties set 'state.management.embedded.zookeeper.start' to 'true' above, and then define your Embedded Zookeeper servers here.
        customservers:
          Node1:
            hostname: nifi-1.localdomain
            zookeeper_myid: 1
            zookeeper_clientPort: 2181
            zookeeper_peerPorts: '2888:3888'
          Node2:
            hostname: nifi-2.localdomain
            zookeeper_myid: 2
            zookeeper_clientPort: 2181
            zookeeper_peerPorts: '2888:3888'
          Node3:
            hostname: nifi-3.localdomain
            zookeeper_myid: 3
            zookeeper_clientPort: 2181
            zookeeper_peerPorts: '2888:3888'

Pillars - 3 Node Cluster with External Zookeeper Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    nifi:
      pkg:
        name: nifi
        downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.3-bin.tar.gz
        version: 1.11.3
        installdir: /opt
        # JDK Package to install. Leave empty to not install.
        javajdk: java-1.8.0-openjdk
      systemdconfig:
        user: root
        group: root
        limitnofile: 50000
        limitnproc: 10000
      nifi:
        # cluster node properties (only configure for cluster nodes) #
        cluster.is.node: 'true'
        cluster.node.address: {{ grains['fqdn'] }}
        cluster.node.protocol.port: '1111'
        cluster.flow.election.max.wait.time: '1 mins'
        zookeeper.connect.string: 'nifi-1.localdomain:2181,nifi-2.localdomain:2181,nifi-3.localdomain:2181'
        state.management.embedded.zookeeper.start: 'true'
        web.http.host: {{ grains['fqdn'] }}


Available states
----------------

.. contents::
   :local:

``nifi``
^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs the nifi package,
manages the nifi configuration file and then
starts the associated nifi service.

``nifi.package``
^^^^^^^^^^^^^^^^^^^^

This state will install the nifi package only. This downloads the tar.gz file from the downloadurl and deploys it to servers.

``nifi.config``
^^^^^^^^^^^^^^^^^^^

This state will configure the nifi service and has a dependency on ``nifi.install``
via include list.

``nifi.service``
^^^^^^^^^^^^^^^^^^^^

This state will start the nifi service and has a dependency on ``nifi.config``
via include list.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``nifi`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

