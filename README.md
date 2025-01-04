# nvr

## Setup

1. Create `.env` (see `.env.example`)
1. Add cert and key to `volumes/nginx/config/keys/`
1. Update site name in `volumes/nginx/config/nginx/site-confs/default.conf`
1. Update cert paths in `volumes/nginx/config/nginx/ssl.conf`

### NAS storage

Ensure NAS is sharing media through NFS.

Mount NFS on client:

1. `sudo apt install nfs-common`
1. `sudo mkdir -p /mnt/nas-nvr-recordings`
1. `sudo mount nas_host_ip:/path/to/nvr-recordings /mnt/nas-nvr-recordings`

Mount the share at boot:

1. `sudo nano /etc/fstab`
1. add `host_ip:/path/to/nvr-recordings    /mnt/nas-nvr-recordings   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0`

Update docker service to await the mount before starting:

1. `sudo systemctl edit docker.service`
1. Add the following to the service file:

```
[Unit]
RequiresMountsFor=/mnt/nas-nvr-recordings
```

### NTP server for cameras

1. `sudo apt-get update`
1. `sudo apt-get install ntp`
1. Edit ntp conf if desired `sudo nano /etc/ntp.conf`
1. `sudo systemctl restart ntp`
1. `ntpq -p`

Cameras can then be configured to reference the host's NTP server.
