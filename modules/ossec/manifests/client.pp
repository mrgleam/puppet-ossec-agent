class ossec::client (
  $ossec_active_response=true,
  $ossec_server_ip
) {
    include ossec::common
    if ( ( $ossec_server_ip == undef ) ) {
      fail('must pass either $ossec_server_ip to Class[\'ossec::client\'].')
    }
    debug('Install Class determine OS for install ossec-agento')
    case $::operatingsystem {
      'RedHat', 'CentOS' : {
        case $::operatingsystemmajrelease {
          '6'  :  {
                    file { "/opt/rpm/geoipupdate-2.2.1-2.el6.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/geoipupdate-2.2.1-2.el6.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "geoipupdate":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/geoipupdate-2.2.1-2.el6.x86_64.rpm",
                      require => File["/opt/rpm/geoipupdate-2.2.1-2.el6.x86_64.rpm"]
                    }
                    file { "/opt/rpm/GeoIP-data-20090201-2.2.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/GeoIP-data-20090201-2.2.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    file { "/opt/rpm/GeoIP-1.6.5-1.el6.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/GeoIP-1.6.5-1.el6.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "GeoIP":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/GeoIP-*.rpm",
                      require => [File["/opt/rpm/GeoIP-1.6.5-1.el6.x86_64.rpm"],File["/opt/rpm/GeoIP-data-20090201-2.2.x86_64.rpm"],Package['geoipupdate']]
                    }
                    file { "/opt/rpm/inotify-tools-3.13-2.el6.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/inotify-tools-3.13-2.el6.art.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "inotify-tools":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/inotify-tools-3.13-2.el6.art.x86_64.rpm",
                      require => File["/opt/rpm/inotify-tools-3.13-2.el6.art.x86_64.rpm"]
                    }
                    file { "/opt/rpm/ossec-hids-2.9.0-1700.el6.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/ossec-hids-2.9.0-1700.el6.art.x86_64.rpm",
                      require => [File["/opt/rpm"],Package['inotify-tools']]
                    }
                    package { "ossec-hids":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/ossec-hids-2.9.0-1700.el6.art.x86_64.rpm",
                      require => File["/opt/rpm/ossec-hids-2.9.0-1700.el6.art.x86_64.rpm"]
                    }
                    file { "/opt/rpm/ossec-hids-agent-2.9.0-1700.el6.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/ossec-hids-agent-2.9.0-1700.el6.art.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "ossec-hids-agent":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/ossec-hids-agent-2.9.0-1700.el6.art.x86_64.rpm",
                      require => [File["/opt/rpm/ossec-hids-agent-2.9.0-1700.el6.art.x86_64.rpm"],Package['ossec-hids'],Package['GeoIP']]
                    }
                  }
          '7'  :  {
                    file { "/opt/rpm/inotify-tools-3.13-2.el7.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/inotify-tools-3.13-2.el7.art.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "inotify-tools":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/inotify-tools-3.13-2.el7.art.x86_64.rpm",
                      require => File["/opt/rpm/inotify-tools-3.13-2.el7.art.x86_64.rpm"]
                    }
                    file { "/opt/rpm/ossec-hids-2.9.1-1764.el7.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/ossec-hids-2.9.1-1764.el7.art.x86_64.rpm",
                      require => [File["/opt/rpm"],Package['inotify-tools']]
                    }
                    package { "ossec-hids":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/ossec-hids-2.9.1-1764.el7.art.x86_64.rpm",
                      require => File["/opt/rpm/ossec-hids-2.9.1-1764.el7.art.x86_64.rpm"]
                    }
                    file { "/opt/rpm/ossec-hids-agent-2.9.1-1764.el7.art.x86_64.rpm":
                      owner   => root,
                      group   => root,
                      mode    => "644",
                      ensure  => present,
                      source => "puppet:///modules/ossec/ossec-hids-agent-2.9.1-1764.el7.art.x86_64.rpm",
                      require => File["/opt/rpm"]
                    }
                    package { "ossec-hids-agent":
                      provider => rpm,
                      ensure => installed,
                      source => "/opt/rpm/ossec-hids-agent-2.9.1-1764.el7.art.x86_64.rpm",
                      require => [File["/opt/rpm/ossec-hids-agent-2.9.1-1764.el7.art.x86_64.rpm"],Package['ossec-hids']]
                    }
                  }
        }
      }
    }

    exec { 'agent-auth':
      command => "/var/ossec/bin/agent-auth -m ${ossec_server_ip} -A ${::fqdn}",
      creates => '/var/ossec/etc/client.keys',
      require => Package['ossec-hids-agent'],
    }

    service { "ossec-hids":
      ensure => running,
      enable => true,
      hasstatus => true,
      pattern => "ossec-hids",
      require => Package["ossec-hids"],
    }

    include concat::setup
    concat { '/var/ossec/etc/ossec.conf':
      owner => root,
      group => ossec,
      mode => "0440",
      require => Package["ossec-hids"],
      notify => Service["ossec-hids"]
    }

    concat::fragment { "ossec.conf_10" :
      target => '/var/ossec/etc/ossec.conf',
      content => template("ossec/10_ossec_agent.conf.erb"),
      order => "10",
      notify => Service["ossec-hids"]
    }
}



