#
# @summary Install the PagerDuty Agent and integrations
#
# @example
#   include pdagent::install
class pdagent::install(
  String $agent_package        = 'pdagent',
  String $integrations_package = 'pdagent-integrations',
) {

  package { $agent_package:
    ensure => present,
  }

  package { $integrations_package:
    ensure => present,
  }
}
