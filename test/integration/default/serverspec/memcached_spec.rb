require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/memcached.conf') do
  it { should exist }
  it { should contain 'LoadPlugin memcached' }
  it { should contain 'Host "localhost"' }
  it { should contain 'Port "11211"' }
end
