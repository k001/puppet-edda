class {'java' :}
class edda {
  class {'edda::install': } ->
  class {'edda::config': }  ->
  class {'edda::deploy': }  ->
  class {'edda::service': }
}

class edda::config inherits edda {
  class {'tomcat': install_from_source => false, }
  tomcat::instance { 'tomcat8':
    source_url => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz',
    catalina_base => '/opt/www/tomcat',
    install_from_source => false,
    package_name => 'ea-tomcat',
  }
}

class edda::service inherits edda {
  tomcat::service { 'default':
    catalina_base  => '/opt/www/tomcat',
    use_jsvc       => false,
    use_init       => true,
    service_name   => 'tomcat',
    service_ensure => running,
    start_command  => '/opt/www/apache-tomcat-7.0.32/bin/startup.sh',
    stop_command   => '/opt/www/apache-tomcat-7.0.32/bin/shutdown.sh'
  }
}

class edda::deploy inherits edda {
  tomcat::war { 'edda-2.1.war':
    catalina_base => '/opt/www/tomcat',
    war_source    => 'http://s3.amazonaws.com/edda-bucket/dev/war/edda-2.1.war',
  }
}

class edda::install inherits edda {
  exec { 'puppetlabs-java':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-java --force',
  }
  exec { 'puppetlabs-tomcat':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install puppetlabs-tomcat --force',
  }
  exec { 'puppetlabs-epel':
    path    => '/bin:/usr/bin',
    command => '/usr/bin/puppet module install stahnma-epel --force',
  }

  package {
    'java-1.7.0-openjdk':
    ensure => 'present';
  }

}
