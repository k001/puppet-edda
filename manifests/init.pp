class edda {
  class {'edda::install':}  ->
  class {'edda::config':}   ->
  class {'edda::service':}
}
class {'edda':}
