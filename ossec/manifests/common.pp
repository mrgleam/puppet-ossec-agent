class ossec::common {
  if (!defined(File['/opt'])) {
    file { "/opt":
      ensure => directory
    }
  }
  if (!defined(File['/opt/rpm'])) {
    file { "/opt/rpm":
      ensure => directory
    }
  }
}
