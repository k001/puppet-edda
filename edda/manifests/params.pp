class edda::params {
  $service_name      = 'tomcat8'
  $catalina_home     = '/opt/www/tomcat8'
  $catalina_base     = '/opt/www/tomcat8'
  $start_command     = "${catalina_base}/bin/startup.sh"
  $stop_command      = "${catalina_base}/bin/shutdown.sh"
  $war_version       = '2.1'
  $war_name          =  "edda-$war_version.war"
  $war_source        = "http://s3.amazonaws.com/edda-bucket/dev/war/$war_name"
  $tomcat_url_source = 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz'
}
