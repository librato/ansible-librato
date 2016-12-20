require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/nginx_plus.conf') do
  it { should exist }
  it { should contain 'LoadPlugin python' }
  it { should contain 'URL "http://localhost/test-status"' }
end
