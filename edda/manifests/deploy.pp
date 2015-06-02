class edda::deploy inherits edda {
  $war_source    = $edda::params::war_source
  $catalina_base = $edda::params::catalina_base
  $war_name      = $edda::params::war_name

  tomcat::war { $war_name:
    catalina_base => $catalina_base,
    war_source    => $war_source,
  }
}
