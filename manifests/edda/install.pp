class {'tomcat':}
class {'java':}

class profile::edda::install inherits profile::edda {
  exec { 'puppetlabs-java':
    path => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-java --force'
  }
  exec { 'puppetlabs-tomcat':
    path => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-tomcat --force'
  }
  package {
    'java-1.7.0-openjdk':
    ensure => 'present';
  }
}
