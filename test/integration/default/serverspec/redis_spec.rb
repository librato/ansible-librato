require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/redis.conf') do
  it { should exist }
  it { should contain 'LoadPlugin redis' }
  it { should contain 'Host "localhost"' }
  it { should contain 'Port "6379"' }
end
