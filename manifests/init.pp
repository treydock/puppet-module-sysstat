# See README.md for more details.
class sysstat (
  String $package_ensure        = 'present',
  String $package_name          = $sysstat::params::package_name,
  String $service_name          = $sysstat::params::service_name,
  Boolean $service_enable       = true,
  Boolean $service_hasstatus    = $sysstat::params::service_hasstatus,
  Boolean $service_hasrestart   = $sysstat::params::service_hasrestart,
  String $config_path           = $sysstat::params::config_path,
  Integer $history              = 28,
  Integer $compressafter        = 31,
  String $sadc_options          = '-S DISK',
  String $zip                   = 'bzip2',
) inherits sysstat::params {

  include sysstat::install
  include sysstat::config
  include sysstat::service

  anchor { 'sysstat::start': }->
  Class['sysstat::install']->
  Class['sysstat::config']~>
  Class['sysstat::service']->
  anchor { 'sysstat::end': }

}
