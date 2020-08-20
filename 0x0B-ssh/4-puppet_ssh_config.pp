# SSH client configuration via Puppet 
ssh-authorized_keys {'ubuntu@34.74.253.204'
user =>'ubuntu',
type => 'ssh-rsa',
key => '~/.ssh/holberton',
}
