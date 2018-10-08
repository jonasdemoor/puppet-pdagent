# 
# @summary Puppet module for installing and setting up PagerDuty Agent
#
# @param $manage_repos
#   Install upstream PagerDuty repositories and GPG keys
#   Defaults to `true`
# @param $service_enabled
#   Start and enable the PagerDuty Agent service
#   Defaults to true
# 
# @example
#   include pdagent
#
class pdagent(
  Boolean $manage_repos      = true,
  Boolean $service_enabled   = true,
) {

  stage { 'first':
    before => Stage['main']
  }

  class { 'pdagent::repos':
    stage => first,
  }

  include pdagent::install
  include pdagent::service

}
