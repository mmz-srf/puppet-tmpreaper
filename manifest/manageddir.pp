define tmpreaper::manageddir (
  $ensure       = "present"
  $logdeleted   = "false"
  $force        = "false"
  $delay        = "false"
  $runtime      = "false"
  $mtime        = "false"
  $ctime        = "false"
  $symlinks     = "false"
  $all          = "false"
  $protect      = "false" 

  $hour         = "*"
  $minute       = "*"
  $weekday      = "*"
  $user         = "root"
) {
  include ::tmpreaper::install
  $log_switch = ""
  $force_switch = ""
  $delay_switch = ""
  $runtime_switch = ""
  $mtime_switch = ""
  $ctime_switch = ""
  $symlinks_switch = ""
  $all_switch = ""
  $protect_switch = ""

  if $logdeleted != 'false' {
    $log_switch = "--showdeleted > ${logdeleted}"
  }
  
  if $force != 'false' {
    $force_switch = "--force"
  }

  if $delay != 'false' {
    $delay_switch = "--delay=${delay}"
  }

  if $runtime != 'false' {
    $runtime_switch = "--runtime=${runtime}"
  }

  if $mtime != 'false' {
    $mtime_switch = "--mtime"
  }

  if $ctime != 'false' {
    $ctime_switch = "--ctime"
  }

  if $symlinks != 'false' {
    $symlinks_switch = "--symlinks"
  }

  if $all != 'false' {
    $all_switch = "--all"
  }

  $cron_cmd = "${::tmpreaper::params::cmd} ${force_switch} ${dalay_switch} ${runtime_switch} ${mtime_switch} ${ctime_switch} ${symlinks_switch} ${all_switch} ${log_switch}"

  cron { "$name":
    ensure      => $ensure,
    command     => $cron_cmd,
    user        => $user,
    hour        => $hour,
    minute      => $minute,
    weekday     => $weekday,
    environment => [ 'PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin', "MAILTO=${email}" ],
  }

}
