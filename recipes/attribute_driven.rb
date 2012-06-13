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

include_recipe "collectd::default"

node['collectd']['plugins'].each_pair do |plugin_key, definition|
  collectd_plugin plugin_key.to_s do
    config definition['config'].to_hash if definition['config']
    template definition['template'].to_s if definition['template']
    cookbook definition['cookbook'].to_s if definition['cookbook']
    type definition['type'].to_s if definition['type']
  end
end

conf_dir = node['collectd']['conf_dir']
keys = node['collectd']['plugins'].keys.collect{|k| k.to_s}
::Dir.entries(conf_dir).each do |entry|
  conf_file = "#{conf_dir}/#{entry}"
  if ::File.file?(conf_file) && conf_file =~ /.*\.conf$/ && !keys.include?(File.basename(entry, ".conf"))
    file conf_file do
      action :delete
      backup false
      notifies :restart, resources(:service => "collectd"), :delayed
    end
  end
end if File.exist?(conf_dir)
