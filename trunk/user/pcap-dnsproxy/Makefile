SRC_NAME=pcap-dnsproxy-0.4.9.5

PDP_CFLAGS  += -ffunction-sections -fdata-sections
PDP_CFLAGS  += -Os -Wall -fPIC -pthread
PDP_CFLAGS  += -I$(STAGEDIR)/include -L/$(STAGEDIR)/lib

PDP_LDFLAGS += -Wl,--gc-sections
PDP_LDFLAGS += -L$(STAGEDIR)/lib

THISDIR = $(shell pwd)

all: config_test
		CFLAGS="$(PDP_CFLAGS)" LDFLAGS="$(PDP_LDFLAGS)" LIBS="$(PDP_LIBS)" \
		$(MAKE) -C $(SRC_NAME)


config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) ; \
	CFLAGS="$(PDP_CFLAGS)" LDFLAGS="$(PDP_LDFLAGS)" LIBS="$(PDP_LIBS)" \
	cmake \
	-DPLATFORM_OPENWRT=ON \
	-DENABLE_LIBSODIUM=ON \
	-DENABLE_PCAP=ON \
	-DENABLE_TLS=ON \
	-DOPENSSL_CRYPTO_LIBRARY:FILEPATH=$(STAGEDIR)/lib/libcrypto.so \
	-DOPENSSL_SSL_LIBRARY:FILEPATH=$(STAGEDIR)/lib/libssl.so \
	. \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean || true; \
	fi ; \
	rm -f  $(SRC_NAME)/CMakeCache.txt; \
	rm -f  $(SRC_NAME)/Makefile; \
	rm -rf  $(SRC_NAME)/CMakeFiles; \
	rm -rf  $(SRC_NAME)/Source/Pcap_DNSProxy/CMakeFiles; \
	rm -f  $(SRC_NAME)/Source/Pcap_DNSProxy/Pcap_DNSProxy; \
	rm -f  $(SRC_NAME)/Source/Pcap_DNSProxy/Makefile; \
	rm -f  $(SRC_NAME)/Source/Pcap_DNSProxy/cmake_install.cmake; \
	rm -f  $(SRC_NAME)/cmake_install.cmake ; \
	rm -f config_done

romfs:
	$(ROMFSINST) $(THISDIR)/$(SRC_NAME)/Source/Pcap_DNSProxy/Pcap_DNSProxy /usr/bin/Pcap_DNSProxy

