SRC_NAME=pcap-dnsproxy-0.4.9.5

PDP_CFLAGS  += -ffunction-sections -fdata-sections -flto
PDP_CFLAGS  += -Os -Wall -fPIC
PDP_CFLAGS  += -I$(STAGEDIR)/include

PDP_LDFLAGS += -Wl,--gc-sections -Wl,-flto
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
	cmake \
	-DPLATFORM_OPENWRT=ON \
	-DENABLE_LIBSODIUM=ON \
	-DENABLE_PCAP=ON \
	. \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) distclean || true; \
	fi ; \
	rm -f  $(SRC_NAME)/CMakeCache.txt; \
	rm -f  $(SRC_NAME)/Makefile; \
	rm -rf  $(SRC_NAME)/CMakeFiles; \
	rm -rf  $(SRC_NAME)/Source/Pcap_DNSProxy/CMakeFiles; \
	rm -f  $(SRC_NAME)/Source/Pcap_DNSProxy/Pcap_DNSProxy; \
	rm -f config_done

romfs:
	$(ROMFSINST) $(THISDIR)/$(SRC_NAME)/Source/Pcap_DNSProxy/Pcap_DNSProxy /usr/bin/Pcap_DNSProxy

