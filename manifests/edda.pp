import 'edda/*'

class profile::edda {
  anchor {'profile::edda::begin':}  ->
  class {'profile::edda::install':} ->
  class {'profile::edda::config':}  ->
  class {'profile::edda::service':} ->
  anchor {'profile::edda::end':}
}
