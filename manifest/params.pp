class tmpreaper::params {
  case $::osfamily {
    debian: {
      $packages = ['tmpreaper']
    }
    redhat: {
      $packages = ['tmpwatch']
    }
    default: {
      fail("${::osfamily} is currently not supported")
    }
  }
}