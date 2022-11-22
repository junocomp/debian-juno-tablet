# debian-juno-tablet
Debian drivers for Juno Tablet

## Compile Manually

```debuild -us -uc```

## Install from Repo

```echo 'deb [trusted=yes] https://deb.junocomputers.com/ /' | sudo tee /etc/apt/sources.list.d/juno-debian.list```

```sudo apt update```

```sudo apt install juno-tablet```

Re run update and downgrade ```systemd``` to v251 otherwise ```Hibernate``` will not work.

```sudo apt update```

```sudo apt install systemd```
