require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/nginx.conf') do
  it { should exist }
  it { should contain 'LoadPlugin nginx' }
  it { should contain 'URL "http://localhost/test-status"' }
end
