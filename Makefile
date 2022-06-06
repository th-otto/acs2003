all clean::
	for i in src; do ${MAKE} -C $$i $@; done
