class tmpreaper::install {
  package { '${::tmpreaper::params::packages}':
    ensure => 'installed',
  }
}