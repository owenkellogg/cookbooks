
#include_recipe "harden"
include_recipe "nodejs"

package "pkg-config"
package "git"
package "scons"
package "ctags"
package "libboost1.48-all-dev"
package "protobuf-compiler"
package "libprotobuf-dev"

git "/opt/rippled" do
  repository "https://github.com/ripple/rippled.git"
  revision  "master"
  action :sync
end

