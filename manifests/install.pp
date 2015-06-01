# Class: edda::install
#
#
class edda::install {
    exec { 'puppetlabs-java':
        path => '/bin:/usr/bin',
        command => '/usr/bin/puppet module install puppetlabs-java --force'
    }
    exec { 'puppetlabs-tomcat':
        path => '/bin:/usr/bin',
        command => '/usr/bin/puppet module install puppetlabs-tomcat --force'
    }
}
