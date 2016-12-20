require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/mongodb.conf') do
  it { should exist }
  it { should contain 'LoadPlugin python' }
  it { should contain 'Host "localhost"' }
  it { should contain 'Port "27017"' }
  it { should contain 'Database "admin", "foo", "bar", "baz"' }
end
