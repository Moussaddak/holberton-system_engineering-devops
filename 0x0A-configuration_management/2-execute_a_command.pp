# kill process
exec { 'kill process':
    path => '/usr/bin',
    command => 'pkill killmenow',
    provider => 'shell',
    returns  => [0, 1],
}
