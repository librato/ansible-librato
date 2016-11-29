require 'serverspec'
set :backend, :exec

describe package('collectd-core') do
  it { should be_installed }
end

describe service('collectd') do
  it { should be_running }
end

describe file('/opt/collectd/etc/collectd.conf.d/librato.conf') do
  it { should exist }
  it { should contain 'User "foo@bar.baz"' }
  it { should contain 'Password "1234abcd"' }
end

describe file('/opt/collectd/var/log/collectd.log') do
  it { should exist }
  it { should contain 'Initialization complete' }
end

%w(cpu df disk swap memory load).each do |plugin|
  describe file("/opt/collectd/etc/collectd.conf.d/#{plugin}.conf") do
    it { should exist }
    it { should contain "LoadPlugin #{plugin}" }
  end
end
