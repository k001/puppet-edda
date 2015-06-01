# Class: profile::eadp::edda
#
#
class profile::eadp::edda {
  anchor {'profile::eadp::edda::begin':}  ->
  class {'profile::eadp::edda::install':} ->
  class {'profile::eadp::edda::config':}  ->
  class {'profile::eadp::edda::service':} ->
  anchor {'profile::eadp::edda::end':}
}
