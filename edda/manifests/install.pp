class edda::install inherits edda {

  package { 'java-1.7.0-openjdk':
    ensure => installed,
  }
  package { 'ea-tomcat':
    ensure => installed,
  }

  if !defined(Class["java"]) {
    notice('Class has not been defined/installed')
    exec { 'puppetlabs-java':
      path    => '/bin:/usr/bin',
      command => '/usr/bin/puppet module install puppetlabs-java',
    }
  }

  if !defined(Class["tomcat"]) {
    notice('Class has not been defined/installed')
    exec { 'puppetlabs-tomcat':
      path    => '/bin:/usr/bin',
      command => '/usr/bin/puppet module install puppetlabs-tomcat',
    }
  }

  if !defined(Class['epel']) {
    notice('Class has not been defined/installed')
    exec { 'puppetlabs-epel':
      path    => '/bin:/usr/bin',
      command => '/usr/bin/puppet module install stahnma-epel',
    }
  }
}
