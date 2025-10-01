# Private class.
class sysstat::params {
  case $facts['os']['family'] {
    'RedHat': {
      $package_name       = 'sysstat'
      $service_name       = 'sysstat'
      $service_hasstatus  = true
      $service_hasrestart = true
      $config_path        = '/etc/sysconfig/sysstat'
    }

    default: {
      fail("Unsupported osfamily: ${facts['os']['family']}, module ${module_name} only support osfamily RedHat")
    }
  }
}
