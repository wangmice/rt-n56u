SRC_NAME="shadowsocks-libev-3.1.1"

CFLAGS += -ffunction-sections -fdata-sections
LDFLAGS += -Wl,--gc-sections

all: config_test
ifeq ($(CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS),y)
	$(MAKE) -C $(SRC_NAME)
endif

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	elif [ "$(CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS)" = "y" ] ; then \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) && \
	if [ ! -f configure ];then autoreconf; fi; \
	./configure \
		--prefix=/ \
		--disable-documentation \
		--disable-silent-rules \
		--disable-assert \
		--disable-ssp \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) ; \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) distclean ; \
	fi; \
	rm -f ss-redir
	rm -f ss-tunnel
	rm -f ss-local
	rm -f ss-server

romfs:
ifeq ($(CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS),y)
	cp $(SRC_NAME)/src/ss-redir .
	cp $(SRC_NAME)/src/ss-tunnel .
	cp $(SRC_NAME)/src/ss-server .
	cp $(SRC_NAME)/src/ss-local .
	$(ROMFSINST) /usr/bin/ss-redir
	$(ROMFSINST) /usr/bin/ss-tunnel
	$(ROMFSINST) /usr/bin/ss-rules
	$(ROMFSINST) /usr/bin/ss-local
	$(ROMFSINST) /usr/bin/ss-server
endif
