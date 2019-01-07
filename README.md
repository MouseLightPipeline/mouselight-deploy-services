# Mouse Light Deploy Services
This repository manages the umbrella services for the various Mouse Light systems.  This currently includes a landing page
with links to specific system landing pages and direct links to those system services.  It also includes the nginx instance
for that maps subpaths to services on specific ports (e.g., ml-ubuntu-test/nb/swc to ml-ubuntu-test:9653).

If ml-ubuntu-test changes IP address, `extra_hosts` for the nginx instance in the Compose file should be updated to 
reflect the change.  The hostname should not be changed however, even if the physical machine hostname changes.  That 
host name it used in the nginx configuration.  While it is set to match the current real physical machine hostname, that
is not a requirement - only the IP must map correctly.

Specific Mouse Light Systems (dashboard, pipeline, neuron browser, etc) have their own deployment compose files and are
managed independently.


    server {
        listen 80;
        server_name        pipeline pipeline.mouselight pipeline.mouselight.int.janelia.org;
        proxy_redirect     off;
        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $server_name;

        location / {
            return 302 $scheme://ml-ubuntu-test:7101;
        }
   }