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

ensure_packages(['vim', 'links', 'netcat', 'curl', 'wget', 'git-core', 'build-essential', 'pkg-config'])

file { '/home/vagrant/apps':
  ensure => 'link',
  target => '/vagrant/apps'
}
include 'golang'

exec { 'Install nsenter':
  command => '/usr/bin/docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter',
  creates => '/usr/local/bin/nsenter'
}

