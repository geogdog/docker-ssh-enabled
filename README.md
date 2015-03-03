SSH Enabled CentOS container
============================

Information
-----------
This image is only meant as a way of booting multiple machines with low overhead on your local machine using vagrant.

Build
-----
```
docker build --rm -t geogdog/docker-ssh-enabled .
```

Run
---
```
docker run --rm -ti geogdog/docker-ssh-enabled /bin/bash
```
