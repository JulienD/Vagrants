# Class: tools
#
#   This class installs other usefull packages.
#
class tools {
  $packages = [ "curl", "wget", "vim", "unzip", "htop" ]
  package { $packages:
    ensure => present,
  }
}