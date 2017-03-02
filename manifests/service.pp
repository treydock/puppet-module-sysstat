# Private class.
class sysstat::service {
  assert_private()

  service { $sysstat::service_name:
    ensure     => $sysstat::service_ensure,
    enable     => $sysstat::service_enable,
    hasstatus  => $sysstat::service_hasstatus,
    hasrestart => $sysstat::service_hasrestart,
  }

}
