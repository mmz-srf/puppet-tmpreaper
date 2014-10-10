class tmpreaper::install {
  package { '${::rkhunter::params::package_name}':
    ensure => 'installed',
  }
}