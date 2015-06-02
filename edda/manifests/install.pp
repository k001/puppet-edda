class edda::install inherits edda {
  package { 'java-1.7.0-openjdk':
    ensure => installed,
  }

  exec { 'puppetlabs-java':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-java --force',
  }
  exec { 'puppetlabs-tomcat':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-tomcat --force',
  }
  exec { 'puppetlabs-epel':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install stahnma-epel --force',
  }
}
