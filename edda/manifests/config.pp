class {'tomcat':}
class {'java':}

class edda::config inherits edda {
  $catalina_base = $edda::params::catalina_base
  $service_name       = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command
  $tomcat_source = $edda::params::tomcat_url_source

  tomcat::instance { $service_name:
    source_url          => $tomcat_url_source,
    catalina_base       => $catalina_base,
    install_from_source => true,
    package_name        => $service_name,
  }
}
