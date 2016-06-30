class users::admins { 
users::managed_user { 'alex': } 
users::managed_user { 'king':
group => 'staff', 
}
users::managed_user { 'jay': 
group => 'staff',
}
group { 'staff':
ensure => present, 
  }
}
