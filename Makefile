# st - simple terminal
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = st.c x.c
OBJ = $(SRC:.c=.o)

all: st

.c.o:
	$(CC) $(STCFLAGS) -c $<

$(OBJ): config.h config.mk

st: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STLDFLAGS)

clean:
	rm -f st $(OBJ) st-*.tar.gz

version:
	@echo ${VERSION}

dist: all
	tar --create --file=st-${VERSION}.tar --transform 's,^,bin/,' --mode='755' st
	tar --append --file=st-${VERSION}.tar --transform 's,^,share/man/man1/,' --mode='644' st.1
	tar --append --file=st-${VERSION}.tar --transform 's,^,share/licenses/st/,' --mode='644' LICENSE
	tar --append --file=st-${VERSION}.tar --transform 's,^,share/st/,' --mode='644' st.info
	gzip st-${VERSION}.tar

.PHONY: all clean dist
