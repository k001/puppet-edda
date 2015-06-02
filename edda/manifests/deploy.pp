class edda::deploy inherits edda {
  $war_source    = $edda::params::war_source
  $catalina_base = $edda::params::catalina_base

  tomcat::war { $war_version:
    catalina_base => $catalina_base,
    war_source    => "http://s3.amazonaws.com/edda-bucket/dev/war/edda-2.1.war",
  }
}
