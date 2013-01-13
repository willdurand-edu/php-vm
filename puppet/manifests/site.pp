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
    doc_root     => '/var/www',
    server_admin => 'root@vm-licpro'
  }

  bazinga::apache_fpm::vhost { 'uframework':
    doc_root     => '/var/www/uframework/web',
    server_admin => 'root@vm-licpro',
    port         => 81,
  }

  package { 'nano':
    ensure => absent
  }
}
