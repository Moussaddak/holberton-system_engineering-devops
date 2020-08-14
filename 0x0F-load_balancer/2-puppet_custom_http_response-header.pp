# Add a custom HTTP header with Puppet
package {'nginx':
ensure => present,
}
service {'nginx':
ensure  => running,
}
exec {'hostname=echo $HOSTNAME; sudo sed -i "0,/http {/{s/http {/http {\n\tadd_header X-Served-By \"$hostname\"/}" /etc/nginx/nginx.conf; sudo service nginx restart':
provider => 'shell',
}
