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
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/ permanent;',
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Holberton School',
}
