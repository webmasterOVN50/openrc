# Rules for installing runlevels
# Copyright 2007-2008 Roy Marples <roy@marples.name> 

LEVELDIR=	${DESTDIR}/etc/runlevels
BOOTDIR=	${LEVELDIR}/boot
DEFAULTDIR=	${LEVELDIR}/default

INSTALL?=	install

all:

install:
	if ! test -d "${BOOTDIR}"; then \
		${INSTALL} -d ${BOOTDIR} || exit $$?; \
		for x in ${BOOT}; do ln -snf /etc/init.d/"$$x" ${BOOTDIR}/"$$x" || exit $$?; done \
	fi
	if ! test -d "${DEFAULTDIR}"; then \
		${INSTALL} -d ${DEFAULTDIR} || exit $$?; \
		for x in ${DEFAULT}; do ln -snf /etc/init.d/"$$x" ${DEFAULTDIR}/"$$x" || exit $$?; done \
	fi

clean:
