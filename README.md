# Mouse Light Deploy Services
This repository manages the umbrella services for the various Mouse Light systems.  This currently includes a landing page
with links to specific system landing pages and direct links to those system services.

## NGINX Proxy
Custom log name in nginx.conf is set to /var/logs rather than /var/log because error.log gets touched before there is a
chance to change it leaving a dangling file.  Map /var/log on the host to /var/logs for the final output.
