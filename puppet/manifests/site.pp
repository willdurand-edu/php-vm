import "fix"

node 'vm-licpro' {
  class { 'bazinga::roles::base':
    vagrant => true
  }

  include bazinga::apt
  include bazinga::roles::mysql
  include bazinga::roles::php_mysql
}
