#
# Copyright Peter Donald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "collectd"

execute "install collectd-write_graphite" do
  command <<CMD
cd /usr/src
rm -rf collectd-write_graphite
git clone git@github.com:jssjr/collectd-write_graphite.git collectd-write_graphite
cd collectd-write_graphite
make
make install
CMD
  creates "#{node[:collectd][:plugin_dir]}/write_graphite.so"
end
