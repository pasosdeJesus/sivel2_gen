
valida: valida-js valida-ruby

valida-js:
	for i in `find app/assets/javascripts/ -name "*coffee"`; do \
	coffee -o /tmp/ $$i; \
	done

valida-ruby:
	find . -name "*\.rb" -exec ruby -w -W2 -c {} ';'

erd:
	(cd test/dummy; \
	bundle exec erd)
	mv test/dummy/erd.pdf doc/
	convert doc/erd.pdf doc/erd.png

