class {'tomcat':}
class {'java':}

class edda::config inherits edda {
  $catalina_home = $edda::params::catalina_home
  $service_name  = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command

  if !defined(Class["java"]) {
    notice('Class has not been defined/installed')
    exec { 'puppetlabs-java':
      path    => '/bin:/usr/bin',
      command => '/usr/bin/puppet module install puppetlabs-java',
    }
  }
  exec {'command when file not exists':
    command         => "ln -s /opt/ec2/bin/aws /bin/aws",
    user            => root,
    onlyif          => "test ! -f /bin/aws",
    path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
    notify          => Notify['/bin/aws not found'],         
  }
  notify {'/bin/aws not found': }
  if !defined(Class["tomcat"]) {
    notice('Class has not been defined/installed')
    exec { 'puppetlabs-tomcat':
      path    => '/bin:/usr/bin',
      command => '/usr/bin/puppet module install puppetlabs-tomcat',
    }
  }
  tomcat::instance { $service_name:
    install_from_source => false,
    package_name        => $service_name,
  }->
  file { '$catalina_home/lib':
    path     => "$catalina_home/lib",
    ensure   => directory,
    recurse  => remote,
    source   => 'file:///etc/puppet/modules/edda/files/lib',
  }->
  file { '$catalina_home/temp':
    path     => "$catalina_home/temp",
    ensure   =>  directory
  }->
  file { 'bootstrap.jar':
    path     => "$catalina_home/bin/bootstrap.jar",
    ensure   => "file",
    source   => 'file:///etc/puppet/modules/edda/files/bootstrap.jar'
  }->
  file { 'commons-daemon.jar':
    path     => "$catalina_home/bin/commons-daemon.jar",
    ensure   => "file",
    source   => 'file:///etc/puppet/modules/edda/files/commons-daemon.jar'
  }->
  file { 'tomcat-juli.jar':
    path     => "$catalina_home/bin/tomcat-juli.jar",
    ensure   => "file",
    source   => 'file:///etc/puppet/modules/edda/files/tomcat-juli.jar'
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
    content => template('edda/logging.properties.erb'),
    mode    => 0644,
    owner   => root,
    group   => root,
    replace => true,
  }->
  file { 'server.xml':
    path    => "$catalina_home/conf/server.xml",
    ensure  => "file" ,
    source  => "file:///etc/puppet/modules/edda/files/server.xml"
  }

}
