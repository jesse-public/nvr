# nvr

## Additional setup

Ensure the machine is running an NTP server:

```
sudo apt-get update
sudo apt-get install ntp
sudo nano /etc/ntp.conf
sudo systemctl restart ntp
ntpq -p
```

Then configure the cameras are configured to refrence the NTP server.
