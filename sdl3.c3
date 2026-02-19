
module sdl3;
import std::io;


const INIT_AUDIO    = 0x00000010; /**< `SDL_INIT_AUDIO` implies `SDL_INIT_EVENTS` */
const INIT_VIDEO    = 0x00000020; /**< `SDL_INIT_VIDEO` implies `SDL_INIT_EVENTS`, should be initialized on the main thread */
const INIT_JOYSTICK = 0x00000200; /**< `SDL_INIT_JOYSTICK` implies `SDL_INIT_EVENTS` */
const INIT_HAPTIC   = 0x00001000;
const INIT_GAMEPAD  = 0x00002000; /**< `SDL_INIT_GAMEPAD` implies `SDL_INIT_JOYSTICK` */
const INIT_EVENTS   = 0x00004000;
const INIT_SENSOR   = 0x00008000; /**< `SDL_INIT_SENSOR` implies `SDL_INIT_EVENTS` */
const INIT_CAMERA   = 0x00010000; /**< `SDL_INIT_CAMERA` implies `SDL_INIT_EVENTS` */

const MOUSE_LEFT   = 1;
const MOUSE_MIDDLE = 2;
const MOUSE_RIGHT  = 3;
const MOUSE_X1     = 4;
const MOUSE_X2     = 5;

extern fn bool start_text_input(Window* window) @extern("SDL_StartTextInput");
extern fn bool stop_text_input(Window* window) @extern("SDL_StopTextInput");

alias FunctionPointer = fn void*();

extern fn ulong get_ticks() @extern("SDL_GetTicks");

// Events
extern fn uint get_mouse_state(float* x, float* y) @extern("SDL_GetMouseState");


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

