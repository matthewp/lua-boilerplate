CC=gcc
OUT=app
LINC=/usr/include/lua5.2
LJIT=lua5.2


app:
	mkdir -p build
	lua ext/genh.lua src/app.lua > build/app.h
	cc -o bin/$(OUT) src/app.c -Wall -Wl,-E -I$(LINC) -l$(LJIT) -I build/

clean:
	rm -f bin/$(OUT)

