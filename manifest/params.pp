class tmpreaper::params {
  case $::osfamily {
    debian: {
      $packages = ['tmpreaper']
      $cmd = "tmpreaper"
    }
    redhat: {
      $packages = ['tmpwatch']
      $cmd = "tmpwatch"
    }
    default: {
      fail("${::osfamily} is currently not supported")
    }
  }
}