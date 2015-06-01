class edda {
  include edda::install
  include edda::config
  include edda::service
}
class {'edda':}
