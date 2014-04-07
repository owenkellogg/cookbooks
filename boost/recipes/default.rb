
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

