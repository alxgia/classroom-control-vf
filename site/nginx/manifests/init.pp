class nginx { package { 'nginx':
ensure => present, }
file { '/var/www': ensure => directory, owner => 'root', group => 'root', mode => '0775',
}
file { '/var/www/index.html':
ensure => file,
owner => 'root',
group => 'root',
mode => '0664',
source => 'puppet:///modules/nginx/index.html',
}
file { '/etc/nginx/nginx.conf':
ensure => file,
  owner
group
mode
source => 'puppet:///modules/nginx/nginx.conf', require => Package['nginx'],
=> 'root', => 'root',
=> '0664',
notify => Service['nginx'],
}