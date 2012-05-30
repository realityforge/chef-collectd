#
# Cookbook Name:: collectd
# Recipe:: default
#
# Copyright 2010, Atari, Inc
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

execute "install collectd" do
  filename = File.basename(node['collectd']['url'])
  dirname = File.basename(node['collectd']['url'], ".tar.gz")
  command <<CMD
cd /usr/src
rm -rf #{dirname}
wget #{node['collectd']['url']}
tar xzf #{filename}
cd #{dirname}
./configure
make
make install
CMD
  creates node['collectd']['base_dir']
end

template "/etc/init.d/collectd" do
  source "collectd.init.erb"
  owner "root"
  group "root"
  mode "755"
  notifies :restart, "service[collectd]", :delayed
end

service "collectd" do
  supports :restart => true, :status => true
end

directory node['collectd']['base_dir'] do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

directory node['collectd']['conf_dir'] do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

template "#{node['collectd']['base_dir']}/etc/collectd.conf" do
  source "collectd.conf.erb"
  owner "root"
  group "root"
  mode "644"
  notifies :restart, resources(:service => "collectd")
end

service "collectd" do
  action [:enable, :start]
end
