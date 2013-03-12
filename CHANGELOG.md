## v1.3.0:

* Change  : Replace the use of cutlery dependency with Chef 11's use_inline_resources method.

## v1.2.1:

Enhance   : Custom template for memcached_plugin

## v1.2.0:

* Change  : Use collectd v5.2.1.

## v1.1.5:

* Change  : Use default_action syntax to define the default action.

## v1.1.3:

* Bug     : Ensure that the service is terminated after $MAXWAIT time rather than allowing a hung process to continue.

## v1.1.2:

* Change  : In the `collectd::attribute_driven' recipe, remove plugin configurations from the disk if they
            have been removed from the configuration.

## v1.1.1:

* Change  : Update to conform to foodcritic style recommendations.

## v1.1.0:

* Change  : Make the name reported in the configuration configurable.
* Change  : Rewrite the plugin definition as a LWRP.
* Change  : Removed the redis plugin.
* Enhance : Merge the collectd_plugins cookbook into this cookbook. Named the plugin recipes with a _plugin suffix.

## v1.0.0:

* Initial release.
