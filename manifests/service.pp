# Class: edda:service
#
#
class edda::service {
  include tomcat
  include java
  tomcat::service { 'default':
    catalina_base => '/usr/local/tomcat',
  }
}
