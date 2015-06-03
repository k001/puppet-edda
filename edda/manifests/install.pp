class edda::install inherits edda {
  $catalina_home = $edda::params::catalina_home

  package { 'java-1.7.0-openjdk':
    ensure => installed,
  }
  file { "$catalina_home":
    ensure => "absent",
    path   => $catalina_home,
    mode   => 750
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
