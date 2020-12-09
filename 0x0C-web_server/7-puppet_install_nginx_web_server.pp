# Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

file_line { '/etc/nginx/sites-available/default':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default'
  after  => 'listen 80 default_server;',
  line   => 'error_page 404 =301 https://www.youtube.com/watch?v=QH2-TGUlwu4',
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Holberton School',
}
