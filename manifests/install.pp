class gorilla::install {
# $server = $gorilla::server

# $key    = $gorilla::key

# $source = $gorilla::source

# $version  = $gorilla::version

# $install_dir = $gorilla::install_dir

# # TODO an Actual Config File.
  # Only Support Windows 10
  if versioncmp($facts['os']['release']['full'], '10') >= 0 {
    # Should Ensure Permissions on this are secure
    $install_dir = 'C:/ProgramData/gorilla'
    file { $install_dir:
      ensure => 'directory',
    }
    file { "${install_dir}/gorilla.exe":
      ensure => 'file',
      source => 'https://github.com/1dustindavis/gorilla/releases/download/v1.10.0/gorilla.exe'
    }
    file { "${install_dir}/config.yaml":
      ensure  => file,
      content => 'foo'
    }->win_scheduled_task::manage { 'gorilla':
      ensure      => present,
      file_source => 'puppet:///modules/gorilla/gorilla.xml',
    }
  }
}
