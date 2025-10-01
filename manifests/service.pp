# Private class.
class sysstat::service {
  assert_private()

  service { $sysstat::service_name:
    ensure => undef,
    enable => $sysstat::service_enable,
  }
}
