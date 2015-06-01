# Class: profile::eadp::edda::install
#
#
class profile::eadp::edda::install inherits profile::eadp::edda {
  exec { 'puppetlabs-java':
    path => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-java --force'
  }
  exec { 'puppetlabs-tomcat':
    path => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-tomcat --force'
  }
  package {
    'java-1.6.0-openjdk':
    ensure => 'present';
  }
}
