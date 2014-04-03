
include_recipe "nodejs"

apt_repository "rippled" do
  uri "http://ppa.launchpad.net/jaesharp/ripple/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "573EB78E"
end

package "rippled" do
  action :install  
end

## Hardening

template "/etc/login.defs" do
  source "login.defs.erb"
  mode 0644
  owner "root"
  group "root"
  action :create
end


