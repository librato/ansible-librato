require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/mysql.conf') do
  it { should exist }
  it { should contain 'LoadPlugin mysql' }
  it { should contain 'Database "mydb"' }
  it { should contain 'User "foo"' }
  it { should contain 'Password "baz"' }
end
