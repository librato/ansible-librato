require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/elasticsearch.conf') do
  it { should exist }
  it { should contain 'LoadPlugin "python"' }
  it { should contain 'Url "http://localhost:9200"' }
end
