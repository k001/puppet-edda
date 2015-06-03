#!/bin/bash
/bin/sudo su -
cd /root/
puppet module install puppetlabs-tomcat
puppet module install puppetlabs-java
ln -s /root/puppet-edda/edda /etc/puppet/modules
puppet apply -vd /etc/puppet/modules/edda/tests/init.pp
