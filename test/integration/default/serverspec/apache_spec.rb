require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/apache.conf') do
  it { should exist }
  it { should contain 'LoadPlugin "apache"' }
  it { should contain 'URL "http://localhost/test-status?auto"' }
end
