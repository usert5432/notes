VERSION = 0.1.0

.PHONY : all install dist clean

NOTEDIR ?= .notes
PREFIX  ?= /usr/local
DATADIR ?= $(PREFIX)/share
MANDIR  ?= $(DATADIR)/man

all: ;

clean:
	rm -f notes-${VERSION}.tar.gz

dist: clean
	@echo Creating dist release notes-${VERSION}
	mkdir -p "notes-${VERSION}"
	cp Makefile LICENSE README.rst notes notes.1 "notes-${VERSION}/"
	tar -c -f notes-${VERSION}.tar "notes-${VERSION}/"
	rm -rf "notes-${VERSION}/"
	gzip notes-${VERSION}.tar

install: notes
	@echo "Installing $< to '${DESTDIR}$(PREFIX)/bin'"
	mkdir -p ${DESTDIR}$(PREFIX)/bin
	awk                                                 \
		-v version="$(VERSION)"                         \
		-v ndir="\"$(NOTEDIR)\""                        \
		'{                                              \
		    gsub(/@VERSION@/, version);                 \
		    gsub(/@NOTEDIR@/, ndir);                    \
		    print $$0;                                  \
		}'                                              \
		notes > ${DESTDIR}$(PREFIX)/bin/notes
	chmod 0755 ${DESTDIR}$(PREFIX)/bin/notes
	mkdir -p ${DESTDIR}$(MANDIR)/man1
	sed "s/VERSION/$(VERSION)/g" notes.1 > ${DESTDIR}$(MANDIR)/man1/notes.1
	chmod 0644 ${DESTDIR}$(MANDIR)/man1/notes.1

