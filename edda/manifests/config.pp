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
