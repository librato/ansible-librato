require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/docker.conf') do
  it { should exist }
  it { should contain 'LoadPlugin exec' }
  it { should contain 'Exec "nobody" "/opt/collectd/share/collectd/collectd-docker.py" "http://localhost:2735"' }
end
