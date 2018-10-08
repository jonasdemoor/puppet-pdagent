# 
# @summary This class sets up the needed package repositories
#
# @param $manage_repos
#   Install upstream PagerDuty repositories and GPG keys
#   Defaults to `true`
#
# @example
#   include pdagent::repos
class pdagent::repos(
  Boolean $manage_repos = $pdagent::manage_repos,
) {

  if $manage_repos {
    case $facts['os']['family'] {
      'Debian': {
        include pdagent::repo::debian
      }
      'RedHat': {
        include pdagent::repo::redhat
      }
      default: {
        fail("Unsupported operating system family '$facts['os']['family']'")
      }
    }
  }

}
