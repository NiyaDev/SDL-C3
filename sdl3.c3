
module sdl3;
import std::io;


extern fn bool start_text_input(Window* window) @extern("SDL_StartTextInput");
extern fn bool stop_text_input(Window* window) @extern("SDL_StopTextInput");



// Window management
extern fn bool get_bordered(Window* window) @extern("SDL_GetWindowBordered");
extern fn bool get_focusable(Window* window) @extern("SDL_GetWindowFocusable");
extern fn bool get_fullscreen(Window* window) @extern("SDL_GetWindowFullscreen");
extern fn DisplayMode* get_window_fullscreen_mode(Window* window) @extern("SDL_GetWindowFullscreenMode");
extern fn float get_opacity(Window* window) @extern("SDL_GetWindowOpacity");
extern fn bool set_opacity(Window* window, float opacity) @extern("SDL_SetWindowOpacity");
extern fn bool get_resizeable(Window* window) @extern("SDL_GetWindowResizable");
extern fn bool get_size(Window* window, int* w, int* h) @extern("SDL_GetWindowSize");
extern fn char* get_title(Window* window) @extern("SDL_GetWindowTitle");
extern fn bool show_window(Window* window) @extern("SDL_ShowWindow");
extern fn bool show_system_menu(Window* window, int x, int y) @extern("SDL_ShowWindowSystemMenu");

// Display
extern fn DisplayID get_primary_display() @extern("SDL_GetPrimaryDisplay");
extern fn bool get_display_bounds(DisplayID displayID, Rect* rect) @extern("SDL_GetDisplayBounds");

