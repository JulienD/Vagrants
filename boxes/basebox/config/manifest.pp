#import "settings.pp"

include boxes::lampboxe

# DRUSH
#include drush

# PROJECT
apache::vhost { 
  'poney-club.local':
    port               => '80',
    docroot            => '/home/vagrant/public_html/poney-club',
    serveradmin        => 'mail@me.org',
    logroot            => "/var/log/poney-club.local",
    configure_firewall => false;
}

#mysql::db { 
#  'poney-club':
#    user     => 'batman',
#    password => 'joker';
#  'dev.poney-club':
#    user     => 'robin',
#    password => 'catwoman';
#}
