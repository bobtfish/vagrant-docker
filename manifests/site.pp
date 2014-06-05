include apt
apt::source { 'puppetlabs':
  location   => 'http://apt.puppetlabs.com',
  repos      => 'main dependencies',
  key        => '4BD6EC30',
  key_server => 'pgp.mit.edu',
}
include docker
docker::image { 'base': }
docker::image { 'progrium/buildstep': }
docker::image { 'bobtfish/synapse-etcd-amb': }
docker::image { 'bobtfish/nerve-etcd': }
docker::image { 'bobtfish/app-envshow': }
docker::run { 'etcd':
  image    => 'coreos/etcd',
  use_name => true;
}
ensure_packages(['vim', 'links', 'netcat'])
file { '/home/vagrant/apps':
  ensure => 'link',
  target => '/vagrant/apps'
}

