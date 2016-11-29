require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/varnish.conf') do
  it { should exist }
end
