CC=gcc
OUT=app
LINC=/usr/include/lua5.2
LJIT=lua5.2

app: clean
	mkdir -p build
	ext/make_squishy src/app.lua
	mv squishy.new src/squishy
	echo '\nOutput "combined.lua"' >> src/squishy
	cd src && lua ../ext/squish.lua
	mv src/combined.lua build && rm src/squishy
	lua ext/genh.lua build/combined.lua > build/app.h
	cc -o bin/$(OUT) src/app.c -Wall -Wl,-E -I$(LINC) -l$(LJIT) -I build/

clean:
	rm -f bin/$(OUT)
	rm -rf build/*
