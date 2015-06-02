class edda::params {
  $service_name  = 'tomcat8'
  $catalina_base = '/opt/www/tomcat8'
  $start_command = "${catalina_base}/bin/startup.sh"
  $stop_command  = "${catalina_base}/bin/shutdown.sh"
}
