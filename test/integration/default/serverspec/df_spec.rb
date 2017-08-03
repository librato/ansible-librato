require 'serverspec'
set :backend, :exec

describe file('/opt/collectd/etc/collectd.conf.d/df.conf') do
  it { should exist }
  it { should contain 'LoadPlugin df' }
  it { should contain '<Plugin df>' }
  it { should contain 'FSType "ext2"' }
  it { should contain 'FSType "ext3"' }
  it { should contain 'FSType "ext4"' }
  it { should contain 'FSType "xfs"' }
  it { should contain 'FSType "jfs"' }
  it { should contain 'FSType "btrfs"' }
  it { should contain 'FSType "reiserfs"' }
  it { should contain 'FSType "vboxsf"' }
  it { should contain 'FSType "tmpfs"' }
  it { should contain 'ReportInodes false' }
  it { should contain 'ValuesAbsolute false' }
  it { should contain 'ValuesPercentage true' }
  it { should contain '</Plugin>' }
end
