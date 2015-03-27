SSH Enabled CentOS container for Vagrant
========================================

Information
-----------
This image is only meant as a way of booting multiple machines with low overhead on your local machine using vagrant.

Build
-----
```
docker build --rm -t geogdog/ssh-enabled .
```

Run
---
```
docker run --rm -ti geogdog/ssh-enabled /bin/bash
```
