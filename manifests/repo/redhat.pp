#
# @summary Sets up needed Yum keys and repositories
#
# @example
#   include pdagent::repos::redhat
class pdagent::repo::redhat(
  String $baseurl      = 'https://packages.pagerduty.com/pdagent/rpm',
  Boolean $enable_repo = true,
  Boolean $gpgcheck    = true,
  String $gpgkey       = 'https://packages.pagerduty.com/GPG-KEY-RPM-pagerduty',
){

  include ::stdlib
  assert_private()

  yumrepo { 'PDAgent':
    ensure   => present,
    baseurl  => $baseurl,
    enabled  => $enable_repo,
    gpgcheck => $gpgcheck,
    gpgkey   => $gpgkey,
  }
}
