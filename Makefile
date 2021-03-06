CFLAGS	= -Wall -Wextra -g -O2
LDFLAGS	=

UNAME	:= $(shell uname)

ifeq ($(UNAME),Linux)
INCLUDE += faio-epoll.h
LDFLAGS += -lrt
endif

ifeq ($(UNAME),SunOS)
INCLUDE += faio-port.h
LDFLAGS += -lsocket -lnsl
endif

all:	bench.o
	$(CC) $^ -o bench $(LDFLAGS)

clean:
	rm -f bench.o bench

bench.o:	bench.c faio.h $(INCLUDE)

.PHONY:	all clean
