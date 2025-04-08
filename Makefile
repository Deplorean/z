
MAKE = make
LIBZ_SOURCE = Sources/z

%:
	$(MAKE) -C $(LIBZ_SOURCE) $< -n
