SRC_NAME=c-ares-1.13.0

CPPFLAGS += $(filter -D% -I%,$(CFLAGS))
CFLAGS := $(filter-out -D% -I%,$(CFLAGS))

all: config_test
	$(MAKE) -C $(SRC_NAME)

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) ; \
	./configure \
		--prefix=$(STAGEDIR) \
		--enable-static \
		--enable-shared \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) ; \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) distclean ; \
	fi ; \
	rm -f config_done

install:
	$(MAKE) -C $(SRC_NAME) install DESTDIR=""

romfs:
	cp -fP $(DESTDIR)/lib/libcares.so* $(ROMFSDIR)/lib/

