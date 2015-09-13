class edda::params {
  $service_name      = 'ea-tomcat'
  $catalina_home     = '/opt/www/tomcat'
  $catalina_base     = '/opt/www/tomcat'
  $start_command     = "${catalina_base}/bin/startup.sh"
  $stop_command      = "${catalina_base}/bin/shutdown.sh"
  $war_name          =  "stratos.war"
  $war_source        = "s3://edda-bucket/dev/war/$war_name"
}

