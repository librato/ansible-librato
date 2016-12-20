require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/zookeeper.conf') do
  it { should exist }
  it { should contain 'LoadPlugin zookeeper' }
  it { should contain 'Host "localhost"' }
  it { should contain 'Port "2181"' }
end
