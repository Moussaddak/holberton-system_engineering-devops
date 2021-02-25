#  0-the_sky_is_the_limit_not
exec { 'debugging':
    command => "sudo sed -i 's/ULIMIT=/#ULIMIT=/g' /etc/default/nginx; sudo service nginx restart",
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
