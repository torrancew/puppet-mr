# == Class: mr
class mr {
  package { 'mr':
    ensure => installed,
    name   => $::operatingsystem ? {
      'Archlinux' => 'myrepos',
      default     => 'mr',
    },
  }
}
