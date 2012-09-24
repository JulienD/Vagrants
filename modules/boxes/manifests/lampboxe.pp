class boxes::lampboxe inherits boxes::baseboxe {
  
  # APACHE
  class {'apache':
    httpd_user  => 'vagrant',
    httpd_group => 'vagrant',
  }
  a2mod { 'rewrite': ensure => "present" }
  a2mod { 'expires': ensure => "present" }


  # PHP
  class {'php':}
  class {'php::apache2':
    memory_limit => '256M',
  }
  class {'php::pear':}
  class {'php::pecl':
    xdebug_remotehost => '192.168.33.1'
  }


  # MYSQL
  class { 'mysql': }
  class { 'mysql::server':
    config_hash => {'root_password' => $mysql_password}
  }
  class { 'mysql::php': }

  # PHPMYADMIN
  include phpmyadmin

  # GIT
  class { 'git': }
}