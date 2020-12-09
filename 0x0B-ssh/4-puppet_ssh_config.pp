# Set up client SSH configuration file

file_line { 'puppet_ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  replace => true,
  line   => 'PasswordAuthentication no',
  match  => '^#   PasswordAuthentication yes$',
}


