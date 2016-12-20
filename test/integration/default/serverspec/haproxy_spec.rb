require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/haproxy.conf') do
  it { should exist }
  it { should contain 'LoadPlugin python' }
  it { should contain 'Socket "/run/haproxy/admin.sock"' }
end
