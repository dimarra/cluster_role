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
}
