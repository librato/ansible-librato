require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/postgresql.conf') do
  it { should exist }
  it { should contain 'LoadPlugin postgresql' }
  it { should contain 'Database mydb' }
  it { should contain 'Database postgres' }
  it { should contain 'Instance "baz"' }
  it { should contain 'Host "/var/run/postgresql"' }
end
