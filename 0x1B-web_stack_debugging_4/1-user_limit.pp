# 1. User limit

exec { 'debugging':
    command  => 'sudo echo "fs.file-max = 65536" >> /etc/sysctl.conf ; sudo sysctl -p',
    provider => shell,
}
