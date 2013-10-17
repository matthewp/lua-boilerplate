#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#include <stdlib.h>
#include <stdio.h>
#include <app.h>

void bail(lua_State *L, char *msg){
  fprintf(stderr, "\nFATAL ERROR:\n  %s: %s\n\n",
    msg, lua_tostring(L, -1));
  exit(1);
}

int main(int argc, char *argv[])
{
  lua_State *L;
  L = luaL_newstate();
  luaL_openlibs(L);


  if (luaL_loadbuffer(L,(const char*)B1,sizeof(B1),NULL)==1)
    bail(L, "luaL_loadbuffer() failed");

  lua_newtable(L);
  
  int i;
  for(i = 0; i < argc; i++) {
    lua_pushnumber(L, i + 1);
    lua_pushstring(L, argv[i]);
    lua_rawset(L, -3);
  }

  lua_setglobal(L, "args");

  if (lua_pcall(L, 0, 0, 0))
    bail(L, "lua_pcall() failed");

  lua_close(L);

  return 0;
}
