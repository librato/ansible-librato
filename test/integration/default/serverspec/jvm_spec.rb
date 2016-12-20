require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/jvm.conf') do
  it { should exist }
  it { should contain 'LoadPlugin java' }
  it { should contain 'ServiceURL "service:jmx:rmi:///jndi/rmi://localhost:17264/jmxrmi"' }
  it { should contain 'Collect "foo"' }
  it { should contain '<MBean "foo">' }
end
