Description
===========

Configure and install the collectd[http://collectd.org/] monitoring daemon and plugins.

Requirements
============

This cookbook has only been tested on Ubuntu.

= ATTRIBUTES:

Attributes
==========

* `node['collectd']['name']` - The hostname of the node as reported in statistics. Defaults to `node['fqdn']`.
* `node['collectd']['interval']` - Time period in seconds to wait between data reads. Defaults to 10.
* `node['collectd']['read_threads']` - The number of threads performing data reads. Defaults to 5.

Usage
=====

There is one main recipes provided:

* `collectd::default` - Install a standalone daemon.
* `collectd::attribute_driven` - Install a standalone daemon.

Resources
=========

There is one resource provided to manage collectd configuration.

`collectd_plugin`
-----------------

The +collectd_plugin+ resource configures and enables standard collect plugins. Example:
    
    collectd_plugin "interface" do
      config :interface => "lo", :ignore_selected => true
    end

The options hash is converted to collectd-style settings automatically. Any symbol key will be converted to camel-case. In the above example :ignore_selected will be output as the key "IgnoreSelected". If the key is already a string, this conversion is skipped. If the value is an array, it will be output as a separate line for each element.

The `collectd_plugin` resource can also use templates for more complex configuration. Example:

    collectd_plugin "interface" do
      template "generic_jmx.conf.erb"
      cookbook "java-monitoring"
      config :host => "127.0.0.1", :port => 2020
    end

The `collectd_plugin` resource can also use content directly in recipe. Example:

    collectd_plugin "interface" do
      content 'LoadPlugin "foo"'
    end


Credits
=======

*Author*: Noah Kantrowitz (<nkantrowitz@crypticstudios.com>)
*Copyright*: 2010, Atari, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
