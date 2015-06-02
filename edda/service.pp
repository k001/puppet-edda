class {'tomcat':}
class {'java':}

class edda::service {
  tomcat::service { 'default':
    catalina_base => '/usr/local/tomcat',
  }
}
