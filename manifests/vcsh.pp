# == Class: mr::vcsh
class mr::vcsh($url, $home) {
  include mr, vcsh
  exec {
    'mr init':
      command => "vcsh clone ${url} mr",
      require => [Class['vcsh']];
    'mr update':
      command => "mr -d ${home} up",
      require => [Class['mr'], Exec['mr init']];
  }
}
