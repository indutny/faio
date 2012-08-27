CFLAGS	= -Wall -Wextra -g
LDFLAGS	= -lev

all:	main.o
	$(CC) $^ -o epollet $(LDFLAGS)

clean:
	rm -f main.o epollet

main.o:	main.c faio.h faio-epoll.h

.PHONY:	all clean
