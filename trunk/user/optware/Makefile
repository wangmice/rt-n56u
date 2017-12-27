all:

romfs:
	mkdir -p $(INSTALLDIR)/etc_ro/opt
	mkdir -p $(INSTALLDIR)/etc_ro/init.d
	$(ROMFSINST) /etc_ro/ipkg.conf
	$(ROMFSINST) -p +x /usr/bin/ipkg.sh
	$(ROMFSINST) -p +x /usr/bin/opkg.sh
	$(ROMFSINST) -p +x /usr/bin/opt-start.sh
	$(ROMFSINST) -p +x /usr/bin/opt-mount.sh
	$(ROMFSINST) -p +x /usr/bin/opt-umount.sh
	$(ROMFSINST) -p +x /usr/bin/opt-ipkg-upd.sh
	$(ROMFSINST) -p +x /usr/bin/opt-opkg-upd.sh
	$(ROMFSINST) -p +x /usr/bin/opt-mkswap
ifeq ($(CONFIG_FIRMWARE_INCLUDE_SSWAN),y)
	$(ROMFSINST) -p +x /etc_ro/init.d/S15strongswan
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS),y)
	$(ROMFSINST) -p +x /etc_ro/init.d/S22shadowsocks
	$(ROMFSINST) -p +x /etc_ro/init.d/S23ss-redir
	$(ROMFSINST) -p +x /etc_ro/init.d/S30ss_server
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_PCAP_DNSPROXY),y)
	$(ROMFSINST) -p +x /etc_ro/init.d/S54pcap_dnsproxy
endif
	$(ROMFSINST) -p +x /etc_ro/init.d/S70openvpn
	$(ROMFSINST) -p +x /etc_ro/init.d/S21xl2tpd
	$(ROMFSINST) -p +x /etc_ro/init.d/S95openvpn
	$(ROMFSINST) -p +x /etc_ro/init.d/rc.func
	$(ROMFSINST) -p +x /etc_ro/init.d/rc.unslung


clean:

