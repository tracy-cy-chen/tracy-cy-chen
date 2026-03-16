# Target Packages description

- This folder contents the target package and depends packages for functional verification and validation.

- The state of each package should record in this document.


## Test BOX

1. Test V&V for SElinux and docker-ce on the platform of default ubuntu 22.04.05 server

2. Test V&V for SElinux and docker-ce on the platform of default ubuntu 22.04.06 desktop


## Package download source

Both Test BOX 1 and Test BOX 2 use Ubuntu 22.04.x (Jammy), so the package download sources are the same.

| Test BOX | Target package | Download source | Notes |
| --- | --- | --- | --- |
| BOX 1 | SELinux | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/selinux-basics | Main SELinux setup package for Ubuntu 22.04 server |
| BOX 1 | SELinux dependency | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/selinux-policy-default | Default SELinux policy package |
| BOX 1 | SELinux dependency | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/policycoreutils | SELinux policy management utilities |
| BOX 1 | docker-ce | Docker official Ubuntu APT repository: https://download.docker.com/linux/ubuntu | Official Docker CE package source |
| BOX 1 | docker-ce install guide | Docker official document: https://docs.docker.com/engine/install/ubuntu/ | Installation reference for Ubuntu 22.04 |
| BOX 2 | SELinux | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/selinux-basics | Main SELinux setup package for Ubuntu 22.04 desktop |
| BOX 2 | SELinux dependency | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/selinux-policy-default | Default SELinux policy package |
| BOX 2 | SELinux dependency | Ubuntu Jammy official package archive: https://packages.ubuntu.com/jammy/policycoreutils | SELinux policy management utilities |
| BOX 2 | docker-ce | Docker official Ubuntu APT repository: https://download.docker.com/linux/ubuntu | Official Docker CE package source |
| BOX 2 | docker-ce install guide | Docker official document: https://docs.docker.com/engine/install/ubuntu/ | Installation reference for Ubuntu 22.04 |


## Source remark

- Ubuntu 22.04.05 server and Ubuntu 22.04.06 desktop are both Ubuntu 22.04 LTS Jammy series, so they use the same upstream package sources.
- For docker-ce, the repository signing key is published by Docker at: https://download.docker.com/linux/ubuntu/gpg

