import 'fix'

node 'vm-licpro' {

  class { 'bazinga::roles::base':
    vagrant => true
  }

  include bazinga::apt
  include bazinga::roles::mysql
  include bazinga::roles::php_mysql
  include bazinga::roles::apache_fpm
  include bazinga::php::phpsh

  bazinga::apache_fpm::vhost { 'www':
    server_name  => 'www.33.33.33.10.xip.io',
    doc_root     => '/var/www',
    server_admin => 'root@vm-licpro',
    priority     => 1,
  }

  bazinga::apache_fpm::vhost { 'uframework':
    server_name  => 'uframework.33.33.33.10.xip.io',
    doc_root     => '/var/www/uframework/web',
    server_admin => 'root@vm-licpro',
  }

  bazinga::apache_fpm::vhost { 'uframework-backup':
    doc_root     => '/var/www/uframework/web',
    server_admin => 'root@vm-licpro',
    port         => 81,
  }

  bazinga::apache_fpm::vhost { 'project-php':
    server_name  => 'project-php.33.33.33.10.xip.io',
    doc_root     => '/var/www/project-php/web',
    server_admin => 'root@vm-licpro',
  }

  bazinga::apache_fpm::vhost { 'project-php-backup':
    doc_root     => '/var/www/project-php/web',
    server_admin => 'root@vm-licpro',
    port         => 82,
  }

  bazinga::php::set_var { 'display_errors':
    value    => 'On',
    file_ini => $php::params::fpm_ini,
  }

  mysql::db { 'uframework':
    user     => 'uframework',
    password => 'uframework123',
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
