name             "collectd"
maintainer       "Noan Kantrowitz"
maintainer_email "nkantrowitz@crypticstudios.com"
license          "Apache 2.0"
description      "Install and configure the collectd monitoring daemon and plugins"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.2.1"

supports         "ubuntu"
depends          "build-essential"
depends 'cutlery', '~> 0.1'
