include apt
apt::source { 'puppetlabs':
  location   => 'http://apt.puppetlabs.com',
  repos      => 'main dependencies',
  key        => '4BD6EC30',
  key_server => 'pgp.mit.edu',
}
include docker

docker::image { 'base': }
docker::image { 'ubuntu:precise': }
docker::image { 'progrium/buildstep': }
docker::image { 'bobtfish/synapse-etcd-amb': }
docker::image { 'bobtfish/nerve-etcd': }
docker::image { 'bobtfish/app-envshow': }

docker::image { 'coreos/etcd': } ->
docker::run { 'etcd':
  image    => 'coreos/etcd',
  use_name => true,
  command  => '';
}

ensure_packages(['vim', 'links', 'netcat', 'curl', 'wget', 'git-core'])

file { '/home/vagrant/apps':
  ensure => 'link',
  target => '/vagrant/apps'
}

