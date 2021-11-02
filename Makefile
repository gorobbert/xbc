# xbc - x brightness control
# Set brightness from the command line

include config.mk

SRC = xbc.c
OBJ = ${SRC:.c=.o}

all: xbc

xbc: ${OBJ}
	${CC} -o $@ ${OBJ}

clean:
	rm -f xbc ${OBJ}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f xbc ${DESTDIR}${PREFIX}/bin
	cp -f xbc.sh ${DESTDIR}${PREFIX}/bin
	chmod 4755 ${DESTDIR}${PREFIX}/bin/xbc
	chmod 755 ${DESTDIR}${PREFIX}/bin/xbc.sh

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xbc\
	    ${DESTDIR}${PREFIX}/bin/xbc.sh\

.PHONY: all clean install uninstall
