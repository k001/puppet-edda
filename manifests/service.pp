# Class: edda:service
#
#
class edda:service {
    tomcat::service { 'default':
    catalina_base => '/usr/local/tomcat',
}
