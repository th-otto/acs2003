all clean::
	for i in src module; do ${MAKE} -C $$i $@ || exit 1; done
