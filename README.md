# puppet-pdagent

Puppet module for installing and configuring the [PagerDuty](https://www.pagerduty.com/) Agent.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pdagent](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pdagent](#beginning-with-pdagent)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module sets up the required repositories (optional), packages and services for using the PagerDuty Agent.

## Setup

### Setup Requirements

puppet-pdagent has dependencies on the Puppetlabs [stdlib]() and [apt]() modules.

### Beginning with pdagent

In order to install the PagerDuty Agent and integrations, simply include the module:

```puppet
include ::pdagent
```

This will set up the required repositories for you. For more advanced examples, please refer to the [Usage](#usage) section below.

## Usage

If you don't want to use the upstream repositories (for example, you manage your own internal repositories), you can use the following snippet.

In Puppet:
```puppet
class { '::pdagent':
  manage_repos => false,
}
```

In Hiera + Puppet:
```puppet
include ::pdagent
```
```yaml
pdagent::manage_repos: false
```

## Limitations

This module has only been tested on the following operating systems. It may (or may not) work on other versions and/or derivatives.

* Linux
  * Debian 9
  * CentOS 7

## Development

Contributions are greatly appreciated. See CONTRIBUTING.md for details.
