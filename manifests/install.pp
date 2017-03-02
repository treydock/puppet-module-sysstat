# Private class.
class sysstat::install {
  assert_private()

  package { $sysstat::package_name:
    ensure => $sysstat::package_ensure,
  }

}
