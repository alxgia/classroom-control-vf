define users::managed_user (
  $username = $title,
  $homedir = "/home/${title}",
  $group = $title,
) {

  File {
    owner => $username,
    group => $username,
  }

  user { "user_${title}":
    ensure => present,
    name   => $username,
    home   => $homedir,
    gid    => $group,
    expiry => $expiry,
  }
  
  group { "user_group_${title}":
    ensure => present,
    name   => $group,
  }

  file { "home_${title}":
    ensure => directory,
    path   => $homedir,
  }

  file { "sshdir_${title}":
    ensure => directory,
    path   => "${homedir}/.ssh",
  }
}
