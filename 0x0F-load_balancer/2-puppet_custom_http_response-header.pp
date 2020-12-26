# Add a custom HTTP header with Puppet
$str="server {
        listen 80 default_server;
        listen [::]:80 default_server;
	
	root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
	
	error_page 404 /404.html;
        
	add_header X-Served-By $HOSTNAME always;
	
	location /redirect_me {
                error_page 404 =301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
}"

exec { 'update':
  command  => '/usr/bin/sudo apt-get update',
}

package { 'nginx':
   require => Exec['update'],
   ensure  => installed,
}

service { 'nginx':
    ensure => stopped,
}

file { '/etc/nginx/sites-available/default':
    require => Package['nginx'],
    content => $str,
}

file { '/var/www/html/index.nginx-debian.html':
    ensure  => present,
    content => 'Holberton School'
}

file { '/var/www/html/404.html':
    ensure  => present,
    content => "Ceci n'est pas une page",
}

exec { 'activate nginx':
    require  => File['/etc/nginx/sites-available/default'],
    command  => 'service nginx start',
    provider => shell,
}
