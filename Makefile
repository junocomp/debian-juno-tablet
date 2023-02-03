SHELL := /bin/bash
# Install Juno-Tablet

DESTDIR=debian/juno-tablet

install-core:
	install -dm755 $(DESTDIR)/usr/bin
	install -dm755 $(DESTDIR)/usr/sbin
	install -dm755 $(DESTDIR)/usr/share/suspend-then-hibernate
	install -dm755 $(DESTDIR)/usr/share/sounds/
	install -dm755 $(DESTDIR)/etc/xdg/autostart/
	install -dm755 $(DESTDIR)/etc/udev/rules.d/
	install -dm755 $(DESTDIR)/etc/udev/hwdb.d/
	install -dm755 $(DESTDIR)/etc/systemd/system
	install -dm755 $(DESTDIR)/etc/initramfs-tools
	install -dm755 $(DESTDIR)/usr/share/glib-2.0/schemas/
	install -dm755 $(DESTDIR)/etc/apt/sources.list.d/
	install -dm755 $(DESTDIR)/etc/profile.d/
	install -dm755 $(DESTDIR)/etc/apt/apt.conf.d
	install -dm755 $(DESTDIR)/etc/systemd/logind.conf.d
	install -dm755 $(DESTDIR)/etc/systemd/sleep.conf.d
	install -dm755 $(DESTDIR)/etc/pulse/default.pa.d/
	install -dm755 $(DESTDIR)/etc/apt/sources.list.d/
	install -dm755 $(DESTDIR)/etc/apt/preferences.d/
	cp -R librem5 $(DESTDIR)/usr/share/sounds/
	install -Dpm 0755 gaudible-deb.py $(DESTDIR)/usr/bin/gaudible-deb
	install -Dpm 0755 gaudible-flatpak.py $(DESTDIR)/usr/bin/gaudible-flatpak
	install -Dpm 0755 check-battery $(DESTDIR)/usr/bin/check-battery
	install -Dpm 0644 gaudible-deb.desktop $(DESTDIR)/etc/xdg/autostart/gaudible-deb.desktop
	install -Dpm 0644 gaudible-flatpak.desktop $(DESTDIR)/etc/xdg/autostart/gaudible-flatpak.desktop
	install -Dpm 0755 turbo/turbo-on $(DESTDIR)/usr/bin/turbo-on
	install -Dpm 0755 turbo/turbo-off $(DESTDIR)/usr/bin/turbo-off
	install -Dpm 0755 turbo/turbo-stat $(DESTDIR)/usr/bin/turbo-stat
	install -Dpm 0644 turbo/juno-turbo.rules $(DESTDIR)/etc/udev/rules.d/juno-turbo.rules
	install -Dpm 0644 rules/99-inverted-touchscreen.rules $(DESTDIR)/etc/udev/rules.d/99-inverted-touchscreen.rules
	install -Dpm 0644 rules/70-wifi-pm.rules $(DESTDIR)/etc/udev/rules.d/70-wifi-pm.rules
	install -Dpm 0755 alsa $(DESTDIR)/usr/bin/alsa
	#install -Dpm 0755 restore-alsa $(DESTDIR)/usr/bin/restore-alsa
	install -Dpm 0755 alsa-info $(DESTDIR)/usr/bin/alsa-info
	#install -Dpm 0755 restore-headphone-mic $(DESTDIR)/usr/bin/restore-headphone-mic
	#install -Dpm 0644 restore-alsa.desktop $(DESTDIR)/etc/xdg/autostart/restore-alsa.desktop
	install -Dpm 0644 resume $(DESTDIR)/etc/initramfs-tools/resume
	install -Dpm 0644 10_juno-debian-settings.gschema.override $(DESTDIR)/usr/share/glib-2.0/schemas/10_juno-debian-settings.gschema.override
	install -Dpm 0644 61-sensor-local.hwdb $(DESTDIR)/etc/udev/hwdb.d/61-sensor-local.hwdb
	install -Dpm 0755 alsa $(DESTDIR)/usr/sbin/alsa
	install -Dpm 0755 juno-profile.sh $(DESTDIR)/etc/profile.d/juno-profile.sh
	install -Dpm 0644 rules/power-profiles.rules $(DESTDIR)/etc/udev/rules.d/power-profiles.rules
	install -Dpm 0644 rules/powertop.rules $(DESTDIR)/etc/udev/rules.d/powertop.rules
	install -Dpm 0644 suspend-then-hibernate/90suspend-then-hibernate $(DESTDIR)/etc/apt/apt.conf.d/90suspend-then-hibernate
	install -Dpm 0755 suspend-then-hibernate/juno-suspend $(DESTDIR)/usr/share/suspend-then-hibernate/juno-suspend
	install -Dpm 0644 alsaucm/HiFi.conf $(DESTDIR)/usr/share/suspend-then-hibernate/HiFi.conf
	install -Dpm 0644 suspend-then-hibernate/juno-login.conf $(DESTDIR)/etc/systemd/logind.conf.d/juno-login.conf
	install -Dpm 0644 suspend-then-hibernate/juno-sleep.conf $(DESTDIR)/etc/systemd/sleep.conf.d/juno-sleep.conf
	install -Dpm 0755 powertop-usb-mouse $(DESTDIR)/usr/bin/powertop-usb-mouse
	install -Dpm 0644 powertop-usb-mouse.service $(DESTDIR)/etc/systemd/system/powertop-usb-mouse.service
	install -Dpm 0644 rules/squeekboard.rules $(DESTDIR)/etc/udev/rules.d/squeekboard.rules
	install -Dpm 0644 juno.pa $(DESTDIR)/etc/pulse/default.pa.d/juno.pa
	install -Dpm 0644 rules/external-display-power-profile.rules $(DESTDIR)/etc/udev/rules.d/external-display-power-profile.rules
	#install -Dpm 0644 juno-debian.list $(DESTDIR)/etc/apt/sources.list.d/juno-debian.list
	install -Dpm 0644 00-systemd-priority $(DESTDIR)/etc/apt/preferences.d/00-systemd-priority
	install -Dpm 0644 00-linux-juno $(DESTDIR)/etc/apt/preferences.d/00-linux-juno
	install -Dpm 0755 juno-pp $(DESTDIR)/usr/bin/juno-pp
	install -Dpm 0644 juno-pp.service $(DESTDIR)/etc/systemd/system/juno-pp.service
	install -Dpm 0755 juno-kd $(DESTDIR)/usr/bin/juno-kd
	install -Dpm 0644 juno-kd.service $(DESTDIR)/etc/systemd/system/juno-kd.service
	install -Dpm 0755 juno-monitor $(DESTDIR)/usr/bin/juno-monitor

install: install-core

uninstall:
	rm -f $(DESTDIR)/usr/bin/check-battery
	rm -R $(DESTDIR)/usr/share/sounds/librem5
	rm -f $(DESTDIR)/etc/xdg/autostart/gaudible-flatpak.desktop
	rm -f $(DESTDIR)/etc/xdg/autostart/gaudible-deb.desktop
	rm -f $(DESTDIR)/usr/bin/gaudible-deb
	rm -f $(DESTDIR)/usr/bin/gaudible-flatpak
	rm -f $(DESTDIR)/usr/bin/turbo-on
	rm -f $(DESTDIR)/usr/bin/turbo-off
	rm -f $(DESTDIR)/usr/bin/turbo-stat
	rm -f $(DESTDIR)/etc/udev/rules.d/juno-turbo.rules
	rm -f $(DESTDIR)/etc/udev/rules.d/99-inverted-touchscreen.rules
	rm -f $(DESTDIR)/etc/udev/rules.d/70-wifi-pm.rules
	#rm -f $(DESTDIR)/usr/bin/restore-alsa
	rm -f $(DESTDIR)/usr/bin/alsa
	#rm -f $(DESTDIR)/etc/xdg/autostart/restore-alsa.desktop
	rm -f $(DESTDIR)/etc/initramfs-tools/resume
	rm -f $(DESTDIR)/usr/share/glib-2.0/schemas/10_juno-debian-settings.gschema.override
	rm -f $(DESTDIR)/etc/apt/sources.list.d/debian-non-free.list
	rm -f $(DESTDIR)/etc/udev/hwdb.d/61-sensor-local.hwdb
	rm -f $(DESTDIR)/usr/sbin/alsa
	rm -f $(DESTDIR)/etc/profile.d/juno-profile.sh
	rm -f $(DESTDIR)/etc/udev/rules.d/powertop.rules
	rm -f $(DESTDIR)/etc/udev/rules.d/power-profiles.rules
	rm -f $(DESTDIR)/etc/apt/apt.conf.d/90suspend-then-hibernate
	rm -R $(DESTDIR)/usr/share/suspend-then-hibernate
	rm -f $(DESTDIR)/etc/systemd/logind.conf.d/juno-login.conf
	rm -f $(DESTDIR)/etc/systemd/sleep.conf.d/juno-sleep.conf
	rm -f $(DESTDIR)/usr/bin/powertop-usb-mouse
	rm -f $(DESTDIR)/etc/systemd/system/powertop-usb-mouse.service
	rm -f $(DESTDIR)/etc/udev/rules.d/squeekboard.rules
	rm -f $(DESTDIR)/etc/pulse/default.pa.d/juno.pa
	rm -f $(DESTDIR)/etc/udev/rules.d/external-display-power-profile.rules
	#rm -f $(DESTDIR)/usr/bin/restore-headphone-mic
	rm -f $(DESTDIR)/usr/bin/alsa-info
	#rm -f $(DESTDIR)/etc/apt/sources.list.d/juno-debian.list
	rm -f $(DESTDIR)/etc/apt/preferences.d/00-systemd-priority
	rm -f $(DESTDIR)/etc/apt/preferences.d/00-linux-juno
	rm -f $(DESTDIR)/usr/bin/juno-pp
	rm -f $(DESTDIR)/etc/systemd/system/juno-pp.service
	rm -f $(DESTDIR)/usr/bin/juno-kd
	rm -f $(DESTDIR)/etc/systemd/system/juno-kd.service
	rm -f $(DESTDIR)/usr/bin/juno-monitor
