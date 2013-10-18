# Lua Boilerplate

This project serves as boilerplate for a lua cli application. Your code goes in `src/` and `app.lua` is the entry point of the application.  It will be handed a table with the values being the command-line arguments, this variable will be named `arg`.

When you run `make` a binary will be placed in `bin/` named `app`, although you can change the name in the `Makefile` if you want. The created binary contains all of your lua code so you don't have to worry about packing your lua code with a binary.

By default this project uses `luac` but you can use `luajit` if you prefer.
