SRC_NAME=pcre-8.41

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
		--enable-utf8 \
		--enable-unicode-properties \
		--enable-pcre16 \
		--with-match-limit-recursion=16000 \
		--enable-cpp \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) ; \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) distclean ; \
	fi ; \
	rm -f config_done

install:
	$(MAKE) -C $(SRC_NAME) install DESTDIR="" ;
	# rm -f $(DESTDIR)/lib/libpcap.so* ;

romfs:
	cp -fP $(DESTDIR)/lib/libpcre*.so* $(ROMFSDIR)/lib/

