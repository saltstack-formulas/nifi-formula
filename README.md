# nifi-formula

A salt formula to deploy Apache NiFi

Configure Apache NiFi in 3 different configurations:
 * Standalone
 * Cluster with embedded Zookeeper
 * Cluster with external Zookeeper

Configures systemd and sysctl limits automatically. See the pillar.example for detailed list of pillars.

## Requirements

1. CentOS, Debian or Ubuntu
2. Cluster Configuraton requires that you have DNS/FQDN 
setup for your nodes. (FQDN is mapped in Salt)

## Usage

* Deploy the NiFi TAR file to servers with:  `nifi.package`
* Deploy the NiFI Config Files to servers with: `nifi.config`
* Setup the systemd service for nifi and start service with: `nifi.service`

## Sample Pillars

### Pillars - Standalone Node
By Default all of the settings will configure a standalone NiFi Node
```
nifi:
  pkg:
    name: nifi
    downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.4-bin.tar.gz
    version: 1.11.4
    installdir: /opt
    # If set to 'True' OpenJDK is installed. Version must match exact version in rpm/yum name.
    javajdk: java-1.8.0-openjdk
  nifi:
    cluster.is.node: 'false'
  systemdconfig:
    user: root
    group: root
    limitnofile: 50000
    limitnproc: 10000
```

### Pillars - 3 Node Cluster with Embedded Zookeeper

```
nifi:
  pkg:
    name: nifi
    downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.4-bin.tar.gz
    version: 1.11.4
    installdir: /opt
    # If set to 'True' OpenJDK is installed. Version must match exact version in rpm/yum name.
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
```

### Pillars - 3 Node Cluster with External Zookeeper Servers

```
nifi:
  pkg:
    name: nifi
    downloadurl: https://mirror.csclub.uwaterloo.ca/apache/nifi/1.11.4/nifi-1.11.3-bin.tar.gz
    version: 1.11.3
    installdir: /opt
    # If set to 'True' OpenJDK is installed. Version must match exact version in rpm/yum name.
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
```
