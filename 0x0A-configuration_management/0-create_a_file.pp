# Create a file using puppet

file { '/tmp/holberton':
  content => 'I love Puppet',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',}
