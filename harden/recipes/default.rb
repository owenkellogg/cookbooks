
template "/etc/login.defs" do
  source "etc/login.defs.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/profile" do
  source "etc/profile.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/securetty" do
  source "etc/securetty.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/sysctl.conf" do
  source "etc/sysctl.conf.erb"
  mode "0400"
  owner "root"
  group "root"
  action :create
end

template "/etc/cron.d/rippled-debugging" do
  source "etc/cron.d/rippled-debugging.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/init.d/ssl" do
  source "etc/init.d/ssl.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/init.d/rc.local" do
  source "etc/init.d/rc.local.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/security/limits.conf" do
  source "etc/security/limits.conf.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

directory "/etc/skel/.ssh" do
  mode "0700"
  owner "root"
  group "root"
  action :create
end

file "/etc/skel/.ssh/authorized_files" do
  mode "0600"
  owner "root"
  group "root"
  action :create
end

template "/etc/ssh/sshd_config" do
  source "etc/ssh/sshd_config.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

template "/etc/ssh/ssh_config" do
  source "etc/ssh/ssh_config.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

