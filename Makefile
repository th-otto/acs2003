all clean::
	for i in src module acsview; do ${MAKE} -C $$i $@ || exit 1; done
