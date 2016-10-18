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
  
) {
  
  file { '/tmp/licence.txt':
    ensure  => file,
    content  => "cluster: $cluster \nrole: $role \n",
  }
}
