#
# Cookbook Name:: collectd
# Attributes:: default
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

override['collectd']['version'] = "5.1.0"
override['collectd']['url'] = "http://collectd.org/files/collectd-#{node['collectd']['version']}.tar.gz"

override['collectd']['base_dir'] = "/opt/collectd"
override['collectd']['conf_dir'] = "/opt/collectd/etc/conf.d"
override['collectd']['plugin_dir'] = "/opt/collectd/lib/collectd"
override['collectd']['types_db'] = ["/opt/collectd/share/collectd/types.db"]

default['collectd']['interval'] = 10
default['collectd']['read_threads'] = 5
default['collectd']['name'] = node['fqdn']

default['collectd']['plugins'] = Mash.new
