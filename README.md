odiobill/haproxy
================

Very light **HAProxy** installation fully based on the Debian packages.

By design, it will only run the **haproxy** executable, exposing the HTTP/HTTPS standard ports and exporting a volume for the *configuration* files.

You can execute it with something like:

    docker run -d -P --name haproxy odiobill/haproxy

To configure your services, you may want to run another (temporary) container that imports its volumes. Run it with:

    docker run -i -t --name config.haproxy --volumes-from haproxy odiobill/haproxy bash

