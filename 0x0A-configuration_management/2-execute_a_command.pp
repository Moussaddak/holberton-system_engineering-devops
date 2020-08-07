# kill process
exec { 'killmenow':
      path     => '/usr/bin',
      command  => 'pkill killmenow',
      provider => 'shell',
}
