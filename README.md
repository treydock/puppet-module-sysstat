# puppet-module-sysstat

[![Build Status](https://travis-ci.org/treydock/puppet-module-sysstat.png)](https://travis-ci.org/treydock/puppet-module-sysstat)

####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#todo)
7. [Additional Information](#additional-information)

## Overview



## Usage

### sysstat

    class { 'sysstat': }

## Reference

### Classes

#### Public classes

* `sysstat`: Installs and configures sysstat.

#### Private classes

* `sysstat::install`: Installs sysstat packages.
* `sysstat::config`: Configures sysstat.
* `sysstat::service`: Manages the sysstat service.
* `sysstat::params`: Sets parameter defaults based on fact values.

### Parameters

#### sysstat

#####`foo`

## Limitations

This module has been tested on:

* CentOS 6 x86_64

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker

## TODO

## Further Information

*
