class edda::deploy inherits edda {
  $war_source    = $edda::params::war_source
  $catalina_home = $edda::params::catalina_home
  $war_name      = $edda::params::war_name

  tomcat::war { $war_name:
    catalina_home => $catalina_home,
    war_source    => $war_source,
  }

  file{"$catalina_home":
    ensure => "directory",
    mode   => 750
  }
}
