class edda::service inherits edda {
  $catalina_base = $edda::params::catalina_base
  $service_name       = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command

  file { "/opt/www/apache-tomcat-7.0.32/bin":
    mode => 0655,
  }

  exec { 'change_permission':
    command => "find $catalina_base/bin/ -maxdepth 1 -type f -iname \"*.sh\" -exec chmod 755 {} \\;",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  tomcat::service { 'default':
    catalina_base  => $catalina_base,
    use_jsvc       => false,
    use_init       => true,
    service_name   => $service_name,
    service_ensure => running,
    start_command  => $start_command,
    stop_command   => $stop_command,
  }
}
