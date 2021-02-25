# 1. User limit

exec { 'debugging':
    command => 'sed -i "s/nofile 5/nofile 3000/; s/nofile 4/nofile 3000/" /etc/security/limits.conf',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
