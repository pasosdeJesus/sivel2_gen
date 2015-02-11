
valida:
	for i in `find app/assets/javascripts/ -name "*coffee"`; do \
	coffee -o /tmp/ $$i; \
	done
