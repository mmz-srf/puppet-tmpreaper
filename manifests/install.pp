class tmpreaper::install inherits tmpreaper::params {
  package { "${::tmpreaper::params::packages}":
    ensure => 'installed',
  }
}