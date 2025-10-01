# See README.md for more details.
#
# @param package_ensure
# @param package_name
# @param service_name
# @param service_enable
# @param config_path
# @param history
# @param compressafter
# @param sadc_options
# @param zip
class sysstat (
  String $package_ensure        = 'present',
  String $package_name          = $sysstat::params::package_name,
  String $service_name          = $sysstat::params::service_name,
  Boolean $service_enable       = true,
  String $config_path           = $sysstat::params::config_path,
  Integer $history              = 28,
  Integer $compressafter        = 31,
  String $sadc_options          = '-S DISK',
  String $zip                   = 'bzip2',
) inherits sysstat::params {
  include sysstat::install
  include sysstat::config
  include sysstat::service

  Class['sysstat::install']
  ->Class['sysstat::config']
  ~>Class['sysstat::service']
}
