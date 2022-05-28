all clean::
	for i in src; do make -C $$i $@; done
