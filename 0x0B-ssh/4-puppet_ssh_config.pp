ssh-authorized_keys {'ubuntu@34.74.253.204'
ensure => 'present',
user =>'ubuntu',
type => 'ssh-rsa',
key => '~/.ssh/holberton',
}
