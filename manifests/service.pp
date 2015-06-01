# Class: profile::eadp::edda::service
#
#
class profile::eadp::edda::service inherits profile::eadp::edda {
  tomcat::service { 'default':
    catalina_base => '/usr/local/tomcat',
  }
}
