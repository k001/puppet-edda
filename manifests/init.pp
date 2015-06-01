include java
include tomcat

class edda {
  class {'edda::install':} ->
  class {'edda::config':}  ->
  class {'edda::service':} ->
  Class['edda']
}
