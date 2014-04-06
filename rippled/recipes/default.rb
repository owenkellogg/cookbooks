# Ubuntu 13.10

execute "apt-get-update" do
  command "apt-get update"
end

package "build-essential"
package "pkg-config"
package "git"
package "ctags"
package "scons"
package "libssl-dev"
package "protobuf-compiler"
package "libprotobuf-dev"

git "/opt/rippled" do
  repository "https://github.com/ripple/rippled.git"
  revision  "master"
  action :sync
end

# http://www.linuxfromscratch.org/blfs/view/svn/general/boost.html
bash 'install_boost' do
  cwd '/home/ubuntu'
  code <<-EOH
    wget http://downloads.sourceforge.net/boost/boost_1_55_0.tar.bz2
    tar jxvf boost_1_55_0.tar.bz2
    cd boost_1_55_0
    ./bootstrap.sh --prefix=/usr &&
    ./b2 stage threading=multi link=shared
    ./b2 install threading=multi link=shared
    EOH
end

execute 'compile-rippled' do
  cwd '/opt/rippled'
  command 'scons'
end

# rippled.cfg template

# run rippled

