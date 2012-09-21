class boxes::baseboxe {
  
  Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"] }

  File { owner => 'vagrant', group => 'vagrant' }

  group { "puppet": ensure => "present"}

  # Ensure that packages are up to date before beginning.
  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
  }

  Package {
    require => Exec["apt-get update"]
  }

  File {
    require => Exec["apt-get update"]
  }

  # NTP
  class { 'ntp': 
    servers => [ 'ntp.accelance.net'],
  }

  class time::localtime {
    file { "localtime":
      ensure => file,
      path => "/etc/localtime",
      source => "/usr/share/zoneinfo/UTC",
    }
  }

  # TOOLS
  include tools

}