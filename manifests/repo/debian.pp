#
# @summary Sets up needed APT keys and respositories
#
# @example
#   include pdagent::repos::debian
class pdagent::repo::debian (
  String $location = 'https://packages.pagerduty.com/pdagent',
  String $repos    = '',
  String $release  = 'deb/',
  Hash $key        = {
    id     => '34241874978E85F344483D714037B2209E65C6CB',
    source => 'https://packages.pagerduty.com/GPG-KEY-pagerduty',
  },
) {

  include ::stdlib
  assert_private()

  include ::apt

  apt::key { 'pdagent_key':
    * => $key,
  }

  apt::source { 'pdagent_repo':
    comment  => 'APT repository for PagerDuty Agent',
    location => $location,
    repos    => $repos,
    release  => $release,
  }

}
