# Class: drush
#
#   This class installs drush.
#
# Requires:
#    class::php
#
class drush {
 
  exec { "drush_pear_discover":
    command => "pear channel-discover pear.drush.org",
    unless  => "pear list-channels | grep 'pear.drush.org'",
    require => Class["php::pear"],
  }

  exec { "pear-drush":
    command => "pear install drush/drush",
    unless  => "pear info drush/drush",
    require => Class["php::pear"],
  }

  exec { "pear-console_table":
    command => "pear install Console_Table",
    unless  => "pear info Console_Table",
    require => Class["php::pear"],
  }

}
