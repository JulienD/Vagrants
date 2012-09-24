import "settings.pp"

include boxes::lampboxe

# PONY PROJECT
apache::vhost { 
  'pony-club.local':
    port               => '80',
    docroot            => '/home/vagrant/public_html/pony-club',
    serveradmin        => 'ponymaster@example.com',
    logroot            => "/var/log/pony-club.local",
    configure_firewall => false;
}
mysql::db { 
  'poney-club':
    user     => 'pony',
    password => 'hay';
}
