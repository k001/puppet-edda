class edda::service inherits edda {
  $catalina_home = $edda::params::catalina_home
  $service_name  = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command

  exec { 'change_permission':
    command => "find $catalina_home/bin/ -maxdepth 1 -type f -iname \"*.sh\" -exec chmod 755 {} \\;",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  tomcat::service { 'default':
    use_jsvc       => false,
    use_init       => false,
    service_name   => $service_name,
    service_ensure => running,
    start_command  => $start_command,
    stop_command   => $stop_command,
  }
}
