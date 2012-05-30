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
CUSTOM_TEMPLATES = [ "write_graphite" ]

def template_map(type)
   plugin_prefix = CUSTOM_TEMPLATES.include?(type.to_s) ? "#{type}_" : ""
  "#{plugin_prefix}plugin.conf.erb"
end

action :create do
  filename = "#{node['collectd']['conf_dir']}/#{new_resource.name}.conf"
  if new_resource.content
    file filename do
      owner "root"
      group "root"
      mode "644"
      action :create
      content new_resource.content
      notifies :restart, resources(:service => "collectd")
    end
  else
    type = new_resource.type || new_resource.name
    template = new_resource.template || template_map(type)
    template filename do
      owner "root"
      group "root"
      mode "644"
      source template
      cookbook new_resource.cookbook
      variables :type => type, :config => new_resource.config
      notifies :restart, resources(:service => "collectd")
    end
  end
end
