class {'tomcat':}
class {'java':}

class edda::config inherits edda {
  $catalina_base = $edda::params::catalina_base
  $service       = $edda::params::service_name
  $start_command = $edda::params::start_command
  $stop_command  = $edda::params::stop_command

  tomcat::instance { 'test':
    source_url => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz',
    catalina_base => '/usr/local/tomcat',
  }->
  tomcat::service { 'default': }->
  tomcat::war { 'edda-2.1.war':
    catalina_base => '/usr/local/tomcat',
    war_source => 'http://s3.amazonaws.com/edda-bucket/dev/war/edda-2.1.war',
  }
}
