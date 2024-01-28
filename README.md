# nvr

## Setup

1. Create `.env` (see `.env.example`)
1. Add cert and key to `volumes/nginx/config/keys/`
1. Update site name in `volumes/nginx/config/nginx/site-confs/default.conf`
1. Update cert paths in `volumes/nginx/config/nginx/ssl.conf`

## NTP server for cameras

1. `sudo apt-get update`
1. `sudo apt-get install ntp`
1. `sudo nano /etc/ntp.conf` (see `host-machine-files/ntp.conf.example`)
1. `sudo systemctl restart ntp`
1. `ntpq -p`

Cameras can then be configured to reference the host's NTP server.
