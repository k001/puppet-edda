class edda (
  $catalina_home = edda::params::catalina_home,
  $service_name  = edda::params::service_name,
  $start_command = edda::params::start_command,
  $stop_command  = edda::params::stop_command,
  ) inherits edda::params  {
  class {'edda::install': } ->
  class {'edda::config': }  ->
  class {'edda::deploy': }  ->
  class {'edda::service': }
}
