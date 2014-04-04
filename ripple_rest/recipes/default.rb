include_recipe "postgresql::client"
include_recipe "nodejs"
include_recipe "nginx"

git "/opt/ripple-rest" do
  repository "https://github.com/ripple/ripple-rest"
  revision "develop"
  action :sync
end

## set database url for migrations

execute "cd /opt/ripple-rest && sudo npm install"

template "/etc/init.d/ripple-rest" do
  source "etc/init.d/ripple-rest.erb"
  action :create
end

## still need to configure nginx

execute "sudo start ripple_rest"
