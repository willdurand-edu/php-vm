import 'fix'

node 'vm-licpro' {
  class { 'bazinga::roles::base':
    vagrant => true
  }

  include bazinga::apt
  include bazinga::roles::mysql
  include bazinga::roles::php_mysql
  include bazinga::roles::apache_fpm

  bazinga::apache_fpm::vhost { 'vagrant-projects':
    doc_root     => '/vagrant/projects',
    server_admin => 'root@vm-licpro'
  }
}
