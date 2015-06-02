class {'tomcat':}
class {'java':}

class edda::config inherits edda {
  $catalina_home = $edda::params::catalina_home
  $service_name  = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command
  $tomcat_source = $edda::params::tomcat_url_source

  file{"$catalina_home":
    ensure => "directory",
    mode   => 750
  }->
  file {"setenv.sh":
    path    => "$catalina_home/bin/",
    content => template('templates/setenv.erb'),
    mode    => 0644,
    owner   => root,
    group   => root,
  }->
  tomcat::instance { $service_name:
    source_url          => $tomcat_url_source,
    catalina_home       => $catalina_home,
    catalina_base       => $catalina_home,
    install_from_source => true,
    package_name        => $service_name,
  }
}
