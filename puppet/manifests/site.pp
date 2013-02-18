import 'fix'

node 'vm-licpro' {

  class { 'bazinga::roles::base':
    vagrant => true
  }

  include bazinga::apt
  include bazinga::roles::mysql
  include bazinga::roles::php_mysql
  class { 'bazinga::roles::apache_fpm':
    apache_user  => 'vagrant',
    apache_group => 'vagrant',
  }

  bazinga::apache_fpm::vhost { 'sf2':
    server_name   => 'sf2.33.33.33.10.xip.io',
    serveraliases => [ 'localhost' ],
    doc_root      => '/var/www/sf2/web',
    server_admin  => 'root@vm-licpro',
  }

  bazinga::php::set_var { 'display_errors':
    value    => 'On',
    file_ini => $php::params::fpm_ini,
  }

  mysql::db { 'sf2':
    user     => 'licweb',
    password => 'licweb',
    host     => 'localhost',
    grant    => [ 'all' ],
    require  => Class['bazinga::roles::mysql'],
  }

  package { 'nano':
    ensure => absent
  }

  package { 'tree':
    ensure => present
  }

  package { 'git-core':
    ensure => latest
  }

  php::module { 'sqlite':
    require => Class['bazinga::roles::php_mysql'],
  }

  php::conf { 'pdo_sqlite':
    source  => 'puppet:///modules/licpro/php/pdo_sqlite.ini',
    require => Php::Module['sqlite'],
    notify  => Class['php::fpm::service'],
  }

  file { [
    '/etc/php5/conf.d/20-sqlite3.ini',
    '/etc/php5/conf.d/20-pdo_sqlite.ini'
  ]:
    ensure  => absent,
    require => Php::Conf['pdo_sqlite'],
  }
}
