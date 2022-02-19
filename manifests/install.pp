class gorilla::install {
  $url = $gorilla::server
  $manifest = $gorilla::manifest
# $key    = $gorilla::key


# $version  = $gorilla::version

# $install_dir = $gorilla::install_dir

# # TODO an Actual Config File.

# Configure install source.
$install_dir = 'C:/ProgramData/Gorilla'

$source = $gorilla::source
if 'puppet:///modules/' in source {
    $package_source = "${source}/sal_scripts-${macos_version}.pkg"
} else {
  $package_source = "${source}/sal_scripts-${macos_version}.pkg"
}

$gorrilla_config_hash ={
  'url' => $url,
  'manifest' => $manifest,
  'app_data_path' => $install_dir,
  'catalog' => 'foo'
}

  # Only Support Windows 10
  if versioncmp($facts['os']['release']['full'], '10') >= 0 {
    # Should Ensure Permissions on this are secure
    file { $install_dir:
      ensure => 'directory',
    }
    file { "${install_dir}/gorilla.exe":
      ensure => 'file',
      source => 'https://github.com/1dustindavis/gorilla/releases/download/v1.10.0/gorilla.exe'
    }
    file { "${install_dir}/config.yaml":
      ensure  => file,
      content => epp('gorilla/gorilla_config.epp',$gorrilla_config_hash)
    }->win_scheduled_task::manage { 'gorilla':
      ensure      => present,
      file_source => 'puppet:///modules/gorilla/gorilla.xml',
    }
  }
}
