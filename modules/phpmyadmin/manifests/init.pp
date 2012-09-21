# Class: phpmyadmin
#
#   This class installs phpmyadmin software.
#
class phpmyadmin {

  package { "phpmyadmin" :
    ensure => present,
    require => Class["php"],
  }

  file { "phpmyadmin_config":
    name    => "/etc/apache2/sites-enabled/phpmyadmin",
    ensure  => link,
    target  => "/etc/phpmyadmin/apache.conf",
    notify  => Service['httpd'],
    require => Package["phpmyadmin"],
  }

}
