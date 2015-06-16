class {'tomcat':}
class {'java':}

class edda::config inherits edda {
  $catalina_home = $edda::params::catalina_home
  $service_name  = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command
  $tomcat_source = $edda::params::tomcat_url_source

  exec { 'puppetlabs-java':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-java --force',
  }->
  exec { 'puppetlabs-tomcat':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-tomcat --force',
    require => Exec['puppetlabs-java'],
  }->

  file { "$catalina_home":
    ensure => "directory",
    path   => $catalina_home,
    mode   => 750
  }->
  tomcat::instance { $service_name:
    source_url          => $tomcat_url_source,
    catalina_home       => $catalina_home,
    catalina_base       => $catalina_home,
    install_from_source => true,
    package_name        => $service_name,
  }->
  file { 'setenv.sh':
    path    => "$catalina_home/bin/setenv.sh",
    content => template('edda/setenv.erb'),
    mode    => 0644,
    owner   => root,
    group   => root,
    replace => true,
  }->
  file { 'logging.properties':
    path    => "$catalina_home/conf/logging.properties",
    content  => template('edda/logging.properties.erb'),
    mode    => 0644,
    owner   => root,
    group   => root,
    replace => true,
  }
}
