# Add a custom HTTP header with Puppet
package {'nginx':
ensure => present,
}
service {'nginx':
ensure  => running,
}
