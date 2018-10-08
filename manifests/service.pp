#
# @summary Manages the PagerDuty Agent service
#
# @example
#   include pdagent::service
class pdagent::service {
  $service_enabled = $pdagent::service_enabled

  if $service_enabled {
    service { 'pdagent':
      ensure => 'running',
      enable => true,
    }
  }
}
