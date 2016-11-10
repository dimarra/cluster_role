# Class: cluster_role
#
# This module manages cluster_role
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class cluster_role (
  
    $cluster      = undef,
    $role         = undef,
    $timezone     = 'Australia/Melbourne',
  
) {
  
  file {[
    "/etc/puppetlabs/facter",
    "/etc/puppetlabs/facter/facts.d",
    ]: 
    ensure  => directory,
  }
  ->
  file { '/etc/puppetlabs/facter/facts.d/custom_facts.yaml':
    ensure  => file,
    content  => "cluster: $cluster \nrole: $role \n",
  }
  
  class { 'timezone':
    timezone => $timezone,
  }
  
  class { 'locales':
    default_locale  => 'en_AU.UTF-8',
    locales         => ['en_AU.UTF-8 UTF-8', 'en_GB.UTF-8 UTF-8'],
  }
}
