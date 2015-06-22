# == Class: mr::vcsh
class mr::vcsh($url, $home) {
  include mr, vcsh
  exec {
    'mr init':
      command => "vcsh clone ${url} mr",
      creates => "${home}/.config/vcsh/repo.d/mr.git",
      require => [Class['vcsh']];
    'mr update':
      command     => "mr -d ${home} up",
      refreshonly => true,
      require     => [Class['mr'], Exec['mr init']];
  }
}
