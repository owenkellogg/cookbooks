package "ntp"
package "git"
package "build-essential"
package "libssl-dev"
package "libdb-dev"
package "libdb++-dev"
package "libboost-all-dev"
package "libqrencode-dev"

bash "install miniupnp" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
  curl -L http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.8.tar.gz |tar -xz
  cd miniupnpc-1.8/
  make
  make install
  cd ..
  EOH
end

git "/home/ubuntu/dogecoin" do
  repository "https://github.com/dogecoin/dogecoin"
  revision "master"
  action :sync
end


bash "compile dogecoind" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
  cd dogecoin/src
  make -f makefile.unix USE_UPNP=1 USE_QRCODE=1
  strip dogecoind
  EOH
end




