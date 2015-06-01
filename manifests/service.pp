# Class: edda:service
#
#
class edda::service {
    include tomcat
    tomcat::service { 'default':
        catalina_base => '/usr/local/tomcat',
    }

}
