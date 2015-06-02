class edda::deploy inherits edda {
  tomcat::war { 'edda-2.1.war':
    catalina_base => '/opt/www/tomcat8',
    war_source    => 'http://s3.amazonaws.com/edda-bucket/dev/war/edda-2.1.war',
  }
}
