= EDDA Puppet Module =

A puppet module for managing and configuring EDDA

= Versions =

tested with EDDA version 2.0.1

= Usage =

== Standard ==

Install, service running, start at boot, use default config settings

    class {'edda': }

Install, disable services

    class {'edda': 
      status => 'disabled',
    }
