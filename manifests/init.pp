class edda {
  anchor {'edda::begin':}   ->
  class {'edda::install':}  ->
  class {'edda::config':}   ->
  class {'edda::service':}  ->
  anchor {'edda::end':}
}
