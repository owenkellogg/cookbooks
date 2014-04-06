#include_recipe "harden"

execute "apt-get-update" do
  command "apt-get update"
end

package "pkg-config" do
  action :install
end

package "git" do
  action :install
end

package "scons" do
  action :install
end

package "libboost1.48-all-dev" do
  action :install
end

package "protobuf-compiler" do
  action :install
end

package "libprotobuf-dev" do
  action :install
end

include_recipe "nodejs"

git "/opt/rippled" do
  repository "https://github.com/ripple/rippled.git"
  revision  "master"
  action :sync
end
