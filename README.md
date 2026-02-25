
### SDL3.c3l

#### Info
- Functions are named like this: ```SDL_FunctionName``` -> ```sdl3::functionName``` or ```SDL_EGL_FunctionName``` -> ```sdl3::egl::functionName```.
- Typedefs, Structs, and Enums are translated as 1-to-1 as possible with Flag typedefs being converted to bitstructs where possible.
- Types from SDL_stdinc.h are included, functions are not.
- There are some functions/structures that use structures that are not defined within sdl. I've just commented them out for now.

#### Documentation
https://wiki.libsdl.org/SDL3/FrontPage
