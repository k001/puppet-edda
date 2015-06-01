class {'tomcat':}
class {'java':}

class profile::edda::service {
  tomcat::service { 'default':
    catalina_base => '/usr/local/tomcat',
  }
}
