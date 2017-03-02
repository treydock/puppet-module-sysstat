# Private class.
class sysstat::config {
  assert_private()

  file { $sysstat::config_path:
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  shellvar { "${sysstat::config_path}-HISTORY":
    target   => $sysstat::config_path,
    variable => 'HISTORY',
    value    => $sysstat::history,
  }

  shellvar { "${sysstat::config_path}-COMPRESSAFTER":
    target   => $sysstat::config_path,
    variable => 'COMPRESSAFTER',
    value    => $sysstat::compressafter,
  }

  shellvar { "${sysstat::config_path}-SADC_OPTIONS":
    target   => $sysstat::config_path,
    variable => 'SADC_OPTIONS',
    value    => $sysstat::sadc_options,
  }

  shellvar { "${sysstat::config_path}-ZIP":
    target   => $sysstat::config_path,
    variable => 'ZIP',
    value    => $sysstat::zip,
  }

}
