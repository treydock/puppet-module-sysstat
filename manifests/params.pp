# Private class.
class sysstat::params {

  case $::osfamily {
    'RedHat': {
      $package_name       = 'sysstat'
      $service_name       = 'sysstat'
      $service_hasstatus  = true
      $service_hasrestart = true
      $config_path        = '/etc/sysconfig/sysstat'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
