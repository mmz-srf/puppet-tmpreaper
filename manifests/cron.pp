define tmpreaper::cron (
  $ensure       = "present",
  $directories,
  $time,
  $logdeleted   = "false",
  $force        = "false",
  $delay        = "false",
  $runtime      = "false",
  $mtime        = "false",
  $ctime        = "false",
  $symlinks     = "false",
  $all          = "false",
  $protect      = "false",

  $hour         = "*",
  $minute       = "*",
  $weekday      = "*",
  $user         = "root",
  $email         = "root@localhost"

) {
  require ::tmpreaper::install

  if $logdeleted != 'false' {
    $log_switch = " --showdeleted"
    $logpath    = "> ${logdeleted}" 
  } else { 
    $log_switch = "" 
    $logpath    = "" 
  }
  
  if $force != 'false' {
    $force_switch = " --force"
  } else { $force_switch = "" }

  if $delay != 'false' {
    $delay_switch = " --delay=${delay}"
  } else { $delay_switch = "" }

  if $runtime != 'false' {
    $runtime_switch = " --runtime=${runtime}"
  } else { $runtime_switch = "" }

  if $mtime != 'false' {
    $mtime_switch = " --mtime"
  } else { $mtime_switch = "" }

  if $ctime != 'false' {
    $ctime_switch = " --ctime"
  } else { $ctime_switch = "" }

  if $symlinks != 'false' {
    $symlinks_switch = "--symlinks"
  } else { $symlinks_switch = "" }

  if $all != 'false' {
    $all_switch = " --all"
  } else { $all_switch = "" }

  $cron_cmd = "${::tmpreaper::params::cmd}${force_switch}${dalay_switch}${runtime_switch}${mtime_switch}${ctime_switch}${symlinks_switch}${all_switch}${log_switch} ${time} ${directories} ${logpath}"

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
