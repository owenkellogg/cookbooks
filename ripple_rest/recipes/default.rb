include_recipe "postgresql::client"
include_recipe "nodejs"
include_recipe "nginx"

git "/opt/ripple-rest" do
  repository "https://github.com/ripple/ripple-rest"
  revision "develop"
  action :sync
end

execute "cd /opt/ripple-rest && sudo npm install"

template "/etc/init/ripple_rest.conf" do
  source "ripple_rest.conf.erb"
  action :create
end

## still need to configure nginx

execute "sudo start ripple_rest"
