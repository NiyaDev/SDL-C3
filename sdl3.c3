
module sdl3;
import std::io;


const CONTEXT_PROFILE_CORE          = 0x00000001;
const CONTEXT_PROFILE_COMPATIBILITY = 0x00000002;
const CONTEXT_PROFILE_ES            = 0x00000004;

const INIT_AUDIO    = 0x00000010; /**< `SDL_INIT_AUDIO` implies `SDL_INIT_EVENTS` */
const INIT_VIDEO    = 0x00000020; /**< `SDL_INIT_VIDEO` implies `SDL_INIT_EVENTS`, should be initialized on the main thread */
const INIT_JOYSTICK = 0x00000200; /**< `SDL_INIT_JOYSTICK` implies `SDL_INIT_EVENTS` */
const INIT_HAPTIC   = 0x00001000;
const INIT_GAMEPAD  = 0x00002000; /**< `SDL_INIT_GAMEPAD` implies `SDL_INIT_JOYSTICK` */
const INIT_EVENTS   = 0x00004000;
const INIT_SENSOR   = 0x00008000; /**< `SDL_INIT_SENSOR` implies `SDL_INIT_EVENTS` */
const INIT_CAMERA   = 0x00010000; /**< `SDL_INIT_CAMERA` implies `SDL_INIT_EVENTS` */

const WINDOW_FULLSCREEN          = 0x0000000000000001;    /**< window is in fullscreen mode */
const WINDOW_OPENGL              = 0x0000000000000002;    /**< window usable with OpenGL context */
const WINDOW_OCCLUDED            = 0x0000000000000004;    /**< window is occluded */
const WINDOW_HIDDEN              = 0x0000000000000008;    /**< window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible */
const WINDOW_BORDERLESS          = 0x0000000000000010;    /**< no window decoration */
const WINDOW_RESIZABLE           = 0x0000000000000020;    /**< window can be resized */
const WINDOW_MINIMIZED           = 0x0000000000000040;    /**< window is minimized */
const WINDOW_MAXIMIZED           = 0x0000000000000080;    /**< window is maximized */
const WINDOW_MOUSE_GRABBED       = 0x0000000000000100;    /**< window has grabbed mouse input */
const WINDOW_INPUT_FOCUS         = 0x0000000000000200;    /**< window has input focus */
const WINDOW_MOUSE_FOCUS         = 0x0000000000000400;    /**< window has mouse focus */
const WINDOW_EXTERNAL            = 0x0000000000000800;    /**< window not created by SDL */
const WINDOW_MODAL               = 0x0000000000001000;    /**< window is modal */
const WINDOW_HIGH_PIXEL_DENSITY  = 0x0000000000002000;    /**< window uses high pixel density back buffer if possible */
const WINDOW_MOUSE_CAPTURE       = 0x0000000000004000;    /**< window has mouse captured (unrelated to MOUSE_GRABBED) */
const WINDOW_MOUSE_RELATIVE_MODE = 0x0000000000008000;    /**< window has relative mode enabled */
const WINDOW_ALWAYS_ON_TOP       = 0x0000000000010000;    /**< window should always be above others */
const WINDOW_UTILITY             = 0x0000000000020000;    /**< window should be treated as a utility window, not showing in the task bar and window list */
const WINDOW_TOOLTIP             = 0x0000000000040000;    /**< window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window */
const WINDOW_POPUP_MENU          = 0x0000000000080000;    /**< window should be treated as a popup menu, requires a parent window */
const WINDOW_KEYBOARD_GRABBED    = 0x0000000000100000;    /**< window has grabbed keyboard input */
const WINDOW_VULKAN              = 0x0000000010000000;    /**< window usable for Vulkan surface */
const WINDOW_METAL               = 0x0000000020000000;    /**< window usable for Metal view */
const WINDOW_TRANSPARENT         = 0x0000000040000000;    /**< window with transparent buffer */
const WINDOW_NOT_FOCUSABLE       = 0x0000000080000000;    /**< window should not be focusable */

const KMOD_NONE   = 0x0000; /**< no modifier is applicable. */
const KMOD_LSHIFT = 0x0001; /**< the left Shift key is down. */
const KMOD_RSHIFT = 0x0002; /**< the right Shift key is down. */
const KMOD_LEVEL5 = 0x0004; /**< the Level 5 Shift key is down. */
const KMOD_LCTRL  = 0x0040; /**< the left Ctrl (Control) key is down. */
const KMOD_RCTRL  = 0x0080; /**< the right Ctrl (Control) key is down. */
const KMOD_LALT   = 0x0100; /**< the left Alt key is down. */
const KMOD_RALT   = 0x0200; /**< the right Alt key is down. */
const KMOD_LGUI   = 0x0400; /**< the left GUI key (often the Windows key) is down. */
const KMOD_RGUI   = 0x0800; /**< the right GUI key (often the Windows key) is down. */
const KMOD_NUM    = 0x1000; /**< the Num Lock key (may be located on an extended keypad) is down. */
const KMOD_CAPS   = 0x2000; /**< the Caps Lock key is down. */
const KMOD_MODE   = 0x4000; /**< the !AltGr key is down. */
const KMOD_SCROLL = 0x8000; /**< the Scroll Lock key is down. */
const KMOD_CTRL   = (KMOD_LCTRL | KMOD_RCTRL);   /**< Any Ctrl key is down. */
const KMOD_SHIFT  = (KMOD_LSHIFT | KMOD_RSHIFT); /**< Any Shift key is down. */
const KMOD_ALT    = (KMOD_LALT | KMOD_RALT);     /**< Any Alt key is down. */
const KMOD_GUI    = (KMOD_LGUI | KMOD_RGUI);     /**< Any GUI key is down. */

const KEY_EXTENDED_MASK          = (1 << 29);
const KEY_SCANCODE_MASK          = (1 << 30);
const KEY_UNKNOWN                = 0x00000000; /**< 0 */
const KEY_RETURN                 = 0x0000000d; /**< '\r' */
const KEY_ESCAPE                 = 0x0000001b; /**< '\x1B' */
const KEY_BACKSPACE              = 0x00000008; /**< '\b' */
const KEY_TAB                    = 0x00000009; /**< '\t' */
const KEY_SPACE                  = 0x00000020; /**< ' ' */
const KEY_EXCLAIM                = 0x00000021; /**< '!' */
const KEY_DBLAPOSTROPHE          = 0x00000022; /**< '"' */
const KEY_HASH                   = 0x00000023; /**< '#' */
const KEY_DOLLAR                 = 0x00000024; /**< '$' */
const KEY_PERCENT                = 0x00000025; /**< '%' */
const KEY_AMPERSAND              = 0x00000026; /**< '&' */
const KEY_APOSTROPHE             = 0x00000027; /**< '\'' */
const KEY_LEFTPAREN              = 0x00000028; /**< '(' */
const KEY_RIGHTPAREN             = 0x00000029; /**< ')' */
const KEY_ASTERISK               = 0x0000002a; /**< '*' */
const KEY_PLUS                   = 0x0000002b; /**< '+' */
const KEY_COMMA                  = 0x0000002c; /**< ',' */
const KEY_MINUS                  = 0x0000002d; /**< '-' */
const KEY_PERIOD                 = 0x0000002e; /**< '.' */
const KEY_SLASH                  = 0x0000002f; /**< '/' */
const KEY_0                      = 0x00000030; /**< '0' */
const KEY_1                      = 0x00000031; /**< '1' */
const KEY_2                      = 0x00000032; /**< '2' */
const KEY_3                      = 0x00000033; /**< '3' */
const KEY_4                      = 0x00000034; /**< '4' */
const KEY_5                      = 0x00000035; /**< '5' */
const KEY_6                      = 0x00000036; /**< '6' */
const KEY_7                      = 0x00000037; /**< '7' */
const KEY_8                      = 0x00000038; /**< '8' */
const KEY_9                      = 0x00000039; /**< '9' */
const KEY_COLON                  = 0x0000003a; /**< ':' */
const KEY_SEMICOLON              = 0x0000003b; /**< ';' */
const KEY_LESS                   = 0x0000003c; /**< '<' */
const KEY_EQUALS                 = 0x0000003d; /**< '=' */
const KEY_GREATER                = 0x0000003e; /**< '>' */
const KEY_QUESTION               = 0x0000003f; /**< '?' */
const KEY_AT                     = 0x00000040; /**< '@' */
const KEY_LEFTBRACKET            = 0x0000005b; /**< '[' */
const KEY_BACKSLASH              = 0x0000005c; /**< '\\' */
const KEY_RIGHTBRACKET           = 0x0000005d; /**< ']' */
const KEY_CARET                  = 0x0000005e; /**< '^' */
const KEY_UNDERSCORE             = 0x0000005f; /**< '_' */
const KEY_GRAVE                  = 0x00000060; /**< '`' */
const KEY_A                      = 0x00000061; /**< 'a' */
const KEY_B                      = 0x00000062; /**< 'b' */
const KEY_C                      = 0x00000063; /**< 'c' */
const KEY_D                      = 0x00000064; /**< 'd' */
const KEY_E                      = 0x00000065; /**< 'e' */
const KEY_F                      = 0x00000066; /**< 'f' */
const KEY_G                      = 0x00000067; /**< 'g' */
const KEY_H                      = 0x00000068; /**< 'h' */
const KEY_I                      = 0x00000069; /**< 'i' */
const KEY_J                      = 0x0000006a; /**< 'j' */
const KEY_K                      = 0x0000006b; /**< 'k' */
const KEY_L                      = 0x0000006c; /**< 'l' */
const KEY_M                      = 0x0000006d; /**< 'm' */
const KEY_N                      = 0x0000006e; /**< 'n' */
const KEY_O                      = 0x0000006f; /**< 'o' */
const KEY_P                      = 0x00000070; /**< 'p' */
const KEY_Q                      = 0x00000071; /**< 'q' */
const KEY_R                      = 0x00000072; /**< 'r' */
const KEY_S                      = 0x00000073; /**< 's' */
const KEY_T                      = 0x00000074; /**< 't' */
const KEY_U                      = 0x00000075; /**< 'u' */
const KEY_V                      = 0x00000076; /**< 'v' */
const KEY_W                      = 0x00000077; /**< 'w' */
const KEY_X                      = 0x00000078; /**< 'x' */
const KEY_Y                      = 0x00000079; /**< 'y' */
const KEY_Z                      = 0x0000007a; /**< 'z' */
const KEY_LEFTBRACE              = 0x0000007b; /**< '{' */
const KEY_PIPE                   = 0x0000007c; /**< '|' */
const KEY_RIGHTBRACE             = 0x0000007d; /**< '}' */
const KEY_TILDE                  = 0x0000007e; /**< '~' */
const KEY_DELETE                 = 0x0000007f; /**< '\x7F' */
const KEY_PLUSMINUS              = 0x000000b1; /**< '\xB1' */
const KEY_CAPSLOCK               = 0x40000039; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CAPSLOCK) */
const KEY_F1                     = 0x4000003a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F1) */
const KEY_F2                     = 0x4000003b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F2) */
const KEY_F3                     = 0x4000003c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F3) */
const KEY_F4                     = 0x4000003d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F4) */
const KEY_F5                     = 0x4000003e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F5) */
const KEY_F6                     = 0x4000003f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F6) */
const KEY_F7                     = 0x40000040; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F7) */
const KEY_F8                     = 0x40000041; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F8) */
const KEY_F9                     = 0x40000042; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F9) */
const KEY_F10                    = 0x40000043; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F10) */
const KEY_F11                    = 0x40000044; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F11) */
const KEY_F12                    = 0x40000045; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F12) */
const KEY_PRINTSCREEN            = 0x40000046; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRINTSCREEN) */
const KEY_SCROLLLOCK             = 0x40000047; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SCROLLLOCK) */
const KEY_PAUSE                  = 0x40000048; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAUSE) */
const KEY_INSERT                 = 0x40000049; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_INSERT) */
const KEY_HOME                   = 0x4000004a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HOME) */
const KEY_PAGEUP                 = 0x4000004b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEUP) */
const KEY_END                    = 0x4000004d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_END) */
const KEY_PAGEDOWN               = 0x4000004e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEDOWN) */
const KEY_RIGHT                  = 0x4000004f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RIGHT) */
const KEY_LEFT                   = 0x40000050; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LEFT) */
const KEY_DOWN                   = 0x40000051; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DOWN) */
const KEY_UP                     = 0x40000052; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UP) */
const KEY_NUMLOCKCLEAR           = 0x40000053; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_NUMLOCKCLEAR) */
const KEY_KP_DIVIDE              = 0x40000054; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DIVIDE) */
const KEY_KP_MULTIPLY            = 0x40000055; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MULTIPLY) */
const KEY_KP_MINUS               = 0x40000056; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MINUS) */
const KEY_KP_PLUS                = 0x40000057; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUS) */
const KEY_KP_ENTER               = 0x40000058; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_ENTER) */
const KEY_KP_1                   = 0x40000059; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_1) */
const KEY_KP_2                   = 0x4000005a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_2) */
const KEY_KP_3                   = 0x4000005b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_3) */
const KEY_KP_4                   = 0x4000005c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_4) */
const KEY_KP_5                   = 0x4000005d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_5) */
const KEY_KP_6                   = 0x4000005e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_6) */
const KEY_KP_7                   = 0x4000005f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_7) */
const KEY_KP_8                   = 0x40000060; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_8) */
const KEY_KP_9                   = 0x40000061; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_9) */
const KEY_KP_0                   = 0x40000062; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_0) */
const KEY_KP_PERIOD              = 0x40000063; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERIOD) */
const KEY_APPLICATION            = 0x40000065; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APPLICATION) */
const KEY_POWER                  = 0x40000066; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_POWER) */
const KEY_KP_EQUALS              = 0x40000067; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALS) */
const KEY_F13                    = 0x40000068; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F13) */
const KEY_F14                    = 0x40000069; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F14) */
const KEY_F15                    = 0x4000006a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F15) */
const KEY_F16                    = 0x4000006b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F16) */
const KEY_F17                    = 0x4000006c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F17) */
const KEY_F18                    = 0x4000006d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F18) */
const KEY_F19                    = 0x4000006e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F19) */
const KEY_F20                    = 0x4000006f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F20) */
const KEY_F21                    = 0x40000070; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F21) */
const KEY_F22                    = 0x40000071; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F22) */
const KEY_F23                    = 0x40000072; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F23) */
const KEY_F24                    = 0x40000073; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F24) */
const KEY_EXECUTE                = 0x40000074; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXECUTE) */
const KEY_HELP                   = 0x40000075; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HELP) */
const KEY_MENU                   = 0x40000076; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MENU) */
const KEY_SELECT                 = 0x40000077; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SELECT) */
const KEY_STOP                   = 0x40000078; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_STOP) */
const KEY_AGAIN                  = 0x40000079; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AGAIN) */
const KEY_UNDO                   = 0x4000007a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UNDO) */
const KEY_CUT                    = 0x4000007b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CUT) */
const KEY_COPY                   = 0x4000007c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COPY) */
const KEY_PASTE                  = 0x4000007d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PASTE) */
const KEY_FIND                   = 0x4000007e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_FIND) */
const KEY_MUTE                   = 0x4000007f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MUTE) */
const KEY_VOLUMEUP               = 0x40000080; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEUP) */
const KEY_VOLUMEDOWN             = 0x40000081; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEDOWN) */
const KEY_KP_COMMA               = 0x40000085; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COMMA) */
const KEY_KP_EQUALSAS400         = 0x40000086; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALSAS400) */
const KEY_ALTERASE               = 0x40000099; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ALTERASE) */
const KEY_SYSREQ                 = 0x4000009a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SYSREQ) */
const KEY_CANCEL                 = 0x4000009b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CANCEL) */
const KEY_CLEAR                  = 0x4000009c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEAR) */
const KEY_PRIOR                  = 0x4000009d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRIOR) */
const KEY_RETURN2                = 0x4000009e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RETURN2) */
const KEY_SEPARATOR              = 0x4000009f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SEPARATOR) */
const KEY_OUT                    = 0x400000a0; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OUT) */
const KEY_OPER                   = 0x400000a1; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OPER) */
const KEY_CLEARAGAIN             = 0x400000a2; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEARAGAIN) */
const KEY_CRSEL                  = 0x400000a3; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CRSEL) */
const KEY_EXSEL                  = 0x400000a4; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXSEL) */
const KEY_KP_00                  = 0x400000b0; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_00) */
const KEY_KP_000                 = 0x400000b1; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_000) */
const KEY_THOUSANDSSEPARATOR     = 0x400000b2; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_THOUSANDSSEPARATOR) */
const KEY_DECIMALSEPARATOR       = 0x400000b3; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DECIMALSEPARATOR) */
const KEY_CURRENCYUNIT           = 0x400000b4; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYUNIT) */
const KEY_CURRENCYSUBUNIT        = 0x400000b5; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYSUBUNIT) */
const KEY_KP_LEFTPAREN           = 0x400000b6; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTPAREN) */
const KEY_KP_RIGHTPAREN          = 0x400000b7; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTPAREN) */
const KEY_KP_LEFTBRACE           = 0x400000b8; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTBRACE) */
const KEY_KP_RIGHTBRACE          = 0x400000b9; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTBRACE) */
const KEY_KP_TAB                 = 0x400000ba; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_TAB) */
const KEY_KP_BACKSPACE           = 0x400000bb; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BACKSPACE) */
const KEY_KP_A                   = 0x400000bc; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_A) */
const KEY_KP_B                   = 0x400000bd; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_B) */
const KEY_KP_C                   = 0x400000be; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_C) */
const KEY_KP_D                   = 0x400000bf; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_D) */
const KEY_KP_E                   = 0x400000c0; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_E) */
const KEY_KP_F                   = 0x400000c1; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_F) */
const KEY_KP_XOR                 = 0x400000c2; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_XOR) */
const KEY_KP_POWER               = 0x400000c3; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_POWER) */
const KEY_KP_PERCENT             = 0x400000c4; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERCENT) */
const KEY_KP_LESS                = 0x400000c5; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LESS) */
const KEY_KP_GREATER             = 0x400000c6; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_GREATER) */
const KEY_KP_AMPERSAND           = 0x400000c7; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AMPERSAND) */
const KEY_KP_DBLAMPERSAND        = 0x400000c8; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLAMPERSAND) */
const KEY_KP_VERTICALBAR         = 0x400000c9; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_VERTICALBAR) */
const KEY_KP_DBLVERTICALBAR      = 0x400000ca; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLVERTICALBAR) */
const KEY_KP_COLON               = 0x400000cb; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COLON) */
const KEY_KP_HASH                = 0x400000cc; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HASH) */
const KEY_KP_SPACE               = 0x400000cd; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_SPACE) */
const KEY_KP_AT                  = 0x400000ce; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AT) */
const KEY_KP_EXCLAM              = 0x400000cf; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EXCLAM) */
const KEY_KP_MEMSTORE            = 0x400000d0; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSTORE) */
const KEY_KP_MEMRECALL           = 0x400000d1; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMRECALL) */
const KEY_KP_MEMCLEAR            = 0x400000d2; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMCLEAR) */
const KEY_KP_MEMADD              = 0x400000d3; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMADD) */
const KEY_KP_MEMSUBTRACT         = 0x400000d4; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSUBTRACT) */
const KEY_KP_MEMMULTIPLY         = 0x400000d5; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMMULTIPLY) */
const KEY_KP_MEMDIVIDE           = 0x400000d6; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMDIVIDE) */
const KEY_KP_PLUSMINUS           = 0x400000d7; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUSMINUS) */
const KEY_KP_CLEAR               = 0x400000d8; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEAR) */
const KEY_KP_CLEARENTRY          = 0x400000d9; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEARENTRY) */
const KEY_KP_BINARY              = 0x400000da; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BINARY) */
const KEY_KP_OCTAL               = 0x400000db; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_OCTAL) */
const KEY_KP_DECIMAL             = 0x400000dc; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DECIMAL) */
const KEY_KP_HEXADECIMAL         = 0x400000dd; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HEXADECIMAL) */
const KEY_LCTRL                  = 0x400000e0; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LCTRL) */
const KEY_LSHIFT                 = 0x400000e1; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LSHIFT) */
const KEY_LALT                   = 0x400000e2; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LALT) */
const KEY_LGUI                   = 0x400000e3; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LGUI) */
const KEY_RCTRL                  = 0x400000e4; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RCTRL) */
const KEY_RSHIFT                 = 0x400000e5; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RSHIFT) */
const KEY_RALT                   = 0x400000e6; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RALT) */
const KEY_RGUI                   = 0x400000e7; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RGUI) */
const KEY_MODE                   = 0x40000101; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MODE) */
const KEY_SLEEP                  = 0x40000102; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SLEEP) */
const KEY_WAKE                   = 0x40000103; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_WAKE) */
const KEY_CHANNEL_INCREMENT      = 0x40000104; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CHANNEL_INCREMENT) */
const KEY_CHANNEL_DECREMENT      = 0x40000105; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CHANNEL_DECREMENT) */
const KEY_MEDIA_PLAY             = 0x40000106; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PLAY) */
const KEY_MEDIA_PAUSE            = 0x40000107; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PAUSE) */
const KEY_MEDIA_RECORD           = 0x40000108; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_RECORD) */
const KEY_MEDIA_FAST_FORWARD     = 0x40000109; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_FAST_FORWARD) */
const KEY_MEDIA_REWIND           = 0x4000010a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_REWIND) */
const KEY_MEDIA_NEXT_TRACK       = 0x4000010b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_NEXT_TRACK) */
const KEY_MEDIA_PREVIOUS_TRACK   = 0x4000010c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PREVIOUS_TRACK) */
const KEY_MEDIA_STOP             = 0x4000010d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_STOP) */
const KEY_MEDIA_EJECT            = 0x4000010e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_EJECT) */
const KEY_MEDIA_PLAY_PAUSE       = 0x4000010f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PLAY_PAUSE) */
const KEY_MEDIA_SELECT           = 0x40000110; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_SELECT) */
const KEY_AC_NEW                 = 0x40000111; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_NEW) */
const KEY_AC_OPEN                = 0x40000112; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_OPEN) */
const KEY_AC_CLOSE               = 0x40000113; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_CLOSE) */
const KEY_AC_EXIT                = 0x40000114; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_EXIT) */
const KEY_AC_SAVE                = 0x40000115; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SAVE) */
const KEY_AC_PRINT               = 0x40000116; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_PRINT) */
const KEY_AC_PROPERTIES          = 0x40000117; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_PROPERTIES) */
const KEY_AC_SEARCH              = 0x40000118; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SEARCH) */
const KEY_AC_HOME                = 0x40000119; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_HOME) */
const KEY_AC_BACK                = 0x4000011a; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BACK) */
const KEY_AC_FORWARD             = 0x4000011b; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_FORWARD) */
const KEY_AC_STOP                = 0x4000011c; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_STOP) */
const KEY_AC_REFRESH             = 0x4000011d; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_REFRESH) */
const KEY_AC_BOOKMARKS           = 0x4000011e; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BOOKMARKS) */
const KEY_SOFTLEFT               = 0x4000011f; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SOFTLEFT) */
const KEY_SOFTRIGHT              = 0x40000120; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SOFTRIGHT) */
const KEY_CALL                   = 0x40000121; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CALL) */
const KEY_ENDCALL                = 0x40000122; /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ENDCALL) */
const KEY_LEFT_TAB               = 0x20000001; /**< Extended key Left Tab */
const KEY_LEVEL5_SHIFT           = 0x20000002; /**< Extended key Level 5 Shift */
const KEY_MULTI_KEY_COMPOSE      = 0x20000003; /**< Extended key Multi-key Compose */
const KEY_LMETA                  = 0x20000004; /**< Extended key Left Meta */
const KEY_RMETA                  = 0x20000005; /**< Extended key Right Meta */
const KEY_LHYPER                 = 0x20000006; /**< Extended key Left Hyper */
const KEY_RHYPER                 = 0x20000007; /**< Extended key Right Hyper */

const MOUSE_LEFT   = 1;
const MOUSE_MIDDLE = 2;
const MOUSE_RIGHT  = 3;
const MOUSE_X1     = 4;
const MOUSE_X2     = 5;

enum GLAttr {
  RED_SIZE,                    /**< the minimum number of bits for the red channel of the color buffer; defaults to 8. */
  GREEN_SIZE,                  /**< the minimum number of bits for the green channel of the color buffer; defaults to 8. */
  BLUE_SIZE,                   /**< the minimum number of bits for the blue channel of the color buffer; defaults to 8. */
  ALPHA_SIZE,                  /**< the minimum number of bits for the alpha channel of the color buffer; defaults to 8. */
  BUFFER_SIZE,                 /**< the minimum number of bits for frame buffer size; defaults to 0. */
  DOUBLEBUFFER,                /**< whether the output is single or double buffered; defaults to double buffering on. */
  DEPTH_SIZE,                  /**< the minimum number of bits in the depth buffer; defaults to 16. */
  STENCIL_SIZE,                /**< the minimum number of bits in the stencil buffer; defaults to 0. */
  ACCUM_RED_SIZE,              /**< the minimum number of bits for the red channel of the accumulation buffer; defaults to 0. */
  ACCUM_GREEN_SIZE,            /**< the minimum number of bits for the green channel of the accumulation buffer; defaults to 0. */
  ACCUM_BLUE_SIZE,             /**< the minimum number of bits for the blue channel of the accumulation buffer; defaults to 0. */
  ACCUM_ALPHA_SIZE,            /**< the minimum number of bits for the alpha channel of the accumulation buffer; defaults to 0. */
  STEREO,                      /**< whether the output is stereo 3D; defaults to off. */
  MULTISAMPLEBUFFERS,          /**< the number of buffers used for multisample anti-aliasing; defaults to 0. */
  MULTISAMPLESAMPLES,          /**< the number of samples used around the current pixel used for multisample anti-aliasing. */
  ACCELERATED_VISUAL,          /**< set to 1 to require hardware acceleration, set to 0 to force software rendering; defaults to allow either. */
  RETAINED_BACKING,            /**< not used (deprecated). */
  CONTEXT_MAJOR_VERSION,       /**< OpenGL context major version. */
  CONTEXT_MINOR_VERSION,       /**< OpenGL context minor version. */
  CONTEXT_FLAGS,               /**< some combination of 0 or more of elements of the SDL_GLContextFlag enumeration; defaults to 0. */
  CONTEXT_PROFILE_MASK,        /**< type of GL context (Core, Compatibility, ES). See SDL_GLProfile; default value depends on platform. */
  SHARE_WITH_CURRENT_CONTEXT,  /**< OpenGL context sharing; defaults to 0. */
  FRAMEBUFFER_SRGB_CAPABLE,    /**< requests sRGB capable visual; defaults to 0. */
  CONTEXT_RELEASE_BEHAVIOR,    /**< sets context the release behavior. See SDL_GLContextReleaseFlag; defaults to FLUSH. */
  CONTEXT_RESET_NOTIFICATION,  /**< set context reset notification. See SDL_GLContextResetNotification; defaults to NO_NOTIFICATION. */
  CONTEXT_NO_ERROR,
  FLOATBUFFERS,
  EGL_PLATFORM,
}

struct Rect {
  int x,y;
  int w,h;
}

union SDL_Event {
  EventType type;

  SDL_KeyboardEvent key;
  SDL_MouseMotionEvent motion;
  SDL_MouseButtonEvent button;
  SDL_MouseWheelEvent wheel;
  
  char[128] padding;
}

enum EventType : const CInt {
  FIRSTEVENT                  = 0x000,

  // Application events
  QUIT                        = 0x100,
  TERMINATING                 = 0x101,
  LOW_MEMORY                  = 0x102,
  WILL_ENTER_BACKGROUND       = 0x103,
  DID_ENTER_BACKGROUND        = 0x104,
  WILL_ENTER_FOREGROUND       = 0x105,
  DID_ENTER_FOREGROUND        = 0x106,

  // Display events
  DISPLAY_ORIENTATION         = 0x150,
  DISPLAY_ADDED               = 0x151,
  DISPLAY_REMOVED             = 0x152,
  DISPLAY_MOVED               = 0x153,
  DISPLAY_DESKTOP_MODE_CHANGED  = 0x154,
  DISPLAY_CURRENT_MODE_CHANGED  = 0x155,
  DISPLAY_CONTENT_SCALE_CHANGED = 0x156,

  // Window events
  WINDOW_SHOWN                = 0x202,
  WINDOW_HIDDEN               = 0x203,
  WINDOW_EXPOSED              = 0x204,
  WINDOW_MOVED                = 0x205,
  WINDOW_RESIZED              = 0x206,
  WINDOW_PIXEL_SIZE_CHANGED   = 0x207,
  WINDOW_METAL_VIEW_RESIZED   = 0x208,
  WINDOW_MINIMIZED            = 0x209,
  WINDOW_MAXIMIZED            = 0x20A,
  WINDOW_RESTORED             = 0x20B,
  WINDOW_MOUSE_ENTER          = 0x20C,
  WINDOW_MOUSE_LEAVE          = 0x20D,
  WINDOW_FOCUS_GAINED         = 0x20E,
  WINDOW_FOCUS_LOST           = 0x20F,
  WINDOW_CLOSE_REQUESTED      = 0x210,
  WINDOW_HIT_TEST             = 0x211,
  WINDOW_ICCPROF_CHANGED      = 0x212,
  WINDOW_DISPLAY_CHANGED      = 0x213,
  WINDOW_DISPLAY_SCALE_CHANGED= 0x214,
  WINDOW_SAFE_AREA_CHANGED    = 0x215,
  WINDOW_OCCLUDED             = 0x216,
  WINDOW_ENTER_FULLSCREEN     = 0x217,
  WINDOW_LEAVE_FULLSCREEN     = 0x218,
  WINDOW_DESTROYED            = 0x219,
  WINDOW_HDR_STATE_CHANGED    = 0x21A,

  // Keyboard Events
  KEY_DOWN                    = 0x300,
  KEY_UP                      = 0x301,
  TEXT_EDITING                = 0x302,
  TEXT_INPUT                  = 0x303,
  KEYMAP_CHANGED              = 0x304,
  KEYBOARD_ADDED              = 0x305,
  KEYBOARD_REMOVED            = 0x306,
  TEXT_EDITING_CANDIDATE      = 0x307,

  // Mouse events
  MOUSE_MOTION                = 0x400,
  MOUSE_BUTTON_DOWN           = 0x401,
  MOUSE_BUTTON_UP             = 0x402,
  MOUSE_WHEEL                 = 0x403,
  MOUSE_ADDED                 = 0x404,
  MOUSE_REMOVED               = 0x405,

  // Joystick events
  JOYSTICK_AXIS_MOTION        = 0x600,
  JOYSTICK_BALL_MOTION        = 0x601,
  JOYSTICK_HAT_MOTION         = 0x602,
  JOYSTICK_BUTTON_DOWN        = 0x603,
  JOYSTICK_BUTTON_UP          = 0x604,
  JOYSTICK_ADDED              = 0x605,
  JOYSTICK_REMOVED            = 0x606,
  JOYSTICK_BATTERY_UPDATED    = 0x607,

  // Gamepad events
  GAMEPAD_AXIS_MOTION         = 0x650,
  GAMEPAD_BUTTON_DOWN         = 0x651,
  GAMEPAD_BUTTON_UP           = 0x652,
  GAMEPAD_ADDED               = 0x653,
  GAMEPAD_REMOVED             = 0x654,
  GAMEPAD_REMAPPED            = 0x655,
  GAMEPAD_TOUCHPAD_DOWN       = 0x656,
  GAMEPAD_TOUCHPAD_MOTION     = 0x657,
  GAMEPAD_TOUCHPAD_UP         = 0x658,
  GAMEPAD_SENSOR_UPDATE       = 0x659,
  GAMEPAD_UPDATE_COMPLETE     = 0x65A,

  // Touch events
  FINGER_DOWN                 = 0x700,
  FINGER_UP                   = 0x701,
  FINGER_MOTION               = 0x702,

  // Clipboard events
  CLIPBOARD_UPDATE            = 0x900,

  // Drop events
  DROP_FILE                   = 0x1000,
  DROP_TEXT                   = 0x1001,
  DROP_BEGIN                  = 0x1002,
  DROP_COMPLETE               = 0x1003,
  DROP_POSITION               = 0x1004,

  // Sensor events
  SENSOR_UPDATE               = 0x1100,

  // Render events
  RENDER_TARGETS_RESET        = 0x2000,
  RENDER_DEVICE_RESET         = 0x2001,

  // Audio events
  AUDIO_DEVICE_ADDED          = 0x2100,
  AUDIO_DEVICE_REMOVED        = 0x2101,
  AUDIO_DEVICE_FORMAT_CHANGED = 0x2102,

  // Pen events
  PEN_DOWN                    = 0x2200,
  PEN_UP                      = 0x2201,
  PEN_MOTION                  = 0x2202,
  PEN_AXIS                    = 0x2203,

  // Camera events
  CAMERA_DEVICE_ADDED         = 0x2300,
  CAMERA_DEVICE_REMOVED       = 0x2301,

  // Private / user events
  USER                        = 0x8000,
  LAST                        = 0xFFFF
}


// TODO:
// Controller events
// Touch events
// Touch device events
// Drag and drop events
// Clipboard events

struct SDL_KeyboardEvent {
  uint type;
  uint reserved;
  
  ulong timestamp;
  uint windowID;
  uint which;
  uint scancode; // Make enum? https://wiki.libsdl.org/SDL3/SDL_Scancode
  uint key;
  ushort mod;
  ushort raw;
  bool down;
  bool repeat;
}
fn void SDL_KeyboardEvent.print(&self) {
  io::printfn("(%d)\nw: %X\nk: %X\nscan: %X\nkey: %X\nmod: %X\nd:%b - r:%b",
    self.timestamp,
    self.windowID,
    self.which,
    self.scancode,
    self.key,
    self.mod,
    self.down, self.repeat,
  );
}

struct SDL_MouseWheelEvent {
  uint type;
  uint reserved;

  ulong timestamp;
  uint windowID;
  uint which;
  float x;
  float y;
  int direction;
  float mouse_x;
  float mouse_y;
  int int_x;
  int int_y;
}

struct SDL_MouseMotionEvent {
  uint type;
  uint reserved;

  ulong timestamp;
  uint windowID;
  uint which;
  uint state;
  float x, y;
  float xrel, yrel;
}

struct SDL_MouseButtonEvent {
  uint type;
  uint reserved;

  ulong timestamp;
  uint windowID;
  uint which;
  char button;
  bool down;
  char clicks;
  char padding;
  float x, y;
}

//struct SDL_ {}

alias DisplayID = uint;
alias PixelFormat = uint;
alias DisplayModeData = void;
struct DisplayMode {
  DisplayID displayID;
  PixelFormat format;
  int w,h;
  float pixelDensity;
  float refreshRate;
  int rrNumerator, rrDenominator;

  DisplayModeData* internal;
}

enum ProgressState {
  NONE,
  INDETERMINATE,
  NORMAL,
  PAUSED,
  ERROR,
}


alias SDL_Window = void;
alias SDL_Surface = void;
alias SDL_GLContext = void;

extern fn bool init(uint) @extern("SDL_Init");
extern fn SDL_Surface* create_surface(int, int, uint, void*, int) @extern("SDL_CreateSurface");
extern fn ulong get_ticks() @extern("SDL_GetTicks");
extern fn void quit() @extern("SDL_Quit");

extern fn char* get_error() @extern("SDL_GetError");

// OpenGL
extern fn SDL_GLContext* gl_create_context(SDL_Window*) @extern("SDL_GL_CreateContext");
extern fn bool gl_make_current(SDL_Window*, SDL_GLContext*) @extern("SDL_GL_MakeCurrent");
extern fn bool gl_destroy_context(SDL_GLContext* context) @extern("SDL_GL_DestroyContext");
extern fn bool gl_set_attribute(GLAttr, int) @extern("SDL_GL_SetAttribute");
extern fn bool gl_swap_window(SDL_Window*) @extern("SDL_GL_SwapWindow");

// Events
extern fn bool poll_event(SDL_Event*) @extern("SDL_PollEvent");
extern fn uint get_mouse_state(float* x, float* y) @extern("SDL_GetMouseState");


// Window management
extern fn SDL_Window* create_window(char* title, int w, int h, uint flags) @extern("SDL_CreateWindow");
extern fn void destroy_window(SDL_Window* window) @extern("SDL_DestroyWindow");
extern fn bool hide_window(SDL_Window* window) @extern("SDL_HideWindow");
extern fn bool maximize_window(SDL_Window* window) @extern("SDL_MaximizeWindow");
extern fn bool minimize_window(SDL_Window* window) @extern("SDL_MinimizeWindow");
extern fn bool focus_window(SDL_Window* window) @extern("SDL_RaiseWindow");
extern fn bool restore_window(SDL_Window* window) @extern("SDL_RestoreWindow");
extern fn bool get_bordered(SDL_Window* window) @extern("SDL_GetWindowBordered");
extern fn bool set_bordered(SDL_Window* window, bool bordered) @extern("SDL_SetWindowBordered");
extern fn bool get_focusable(SDL_Window* window) @extern("SDL_GetWindowFocusable");
extern fn bool set_focusable(SDL_Window* window, bool focusable) @extern("SDL_SetWindowFocusable");
extern fn bool get_fullscreen(SDL_Window* window) @extern("SDL_GetWindowFullscreen");
extern fn bool set_fullscreen(SDL_Window* window, bool fullscreen) @extern("SDL_SetWindowFullscreen");
extern fn DisplayMode* get_window_fullscreen_mode(SDL_Window* window) @extern("SDL_GetWindowFullscreenMode");
extern fn bool set_window_fullscreen_mode(SDL_Window* window, DisplayMode* mode) @extern("SDL_SetWindowFullscreenMode");
extern fn float get_opacity(SDL_Window* window) @extern("SDL_GetWindowOpacity");
extern fn bool set_opacity(SDL_Window* window, float opacity) @extern("SDL_SetWindowOpacity");
extern fn ProgressState get_progress_state(SDL_Window* window) @extern("SDL_GetWindowProgressState");
extern fn bool set_progress_state(SDL_Window* window, ProgressState state) @extern("SDL_SetWindowProgressState");
extern fn float get_progress_value(SDL_Window* window) @extern("SDL_GetWindowProgressValue");
extern fn bool set_progress_value(SDL_Window* window, float value) @extern("SDL_SetWindowProgressValue");
extern fn bool get_resizeable(SDL_Window* window) @extern("SDL_GetWindowResizable");
extern fn bool set_resizeable(SDL_Window* window, bool resizable) @extern("SDL_SetWindowResizable");
extern fn bool get_size(SDL_Window* window, int* w, int* h) @extern("SDL_GetWindowSize");
extern fn bool set_size(SDL_Window* window, int w, int h) @extern("SDL_SetWindowSize");
extern fn char* get_title(SDL_Window* window) @extern("SDL_GetWindowTitle");
extern fn bool set_title(SDL_Window* window, char* title) @extern("SDL_SetWindowTitle");
extern fn bool show_window(SDL_Window* window) @extern("SDL_ShowWindow");
extern fn bool show_system_menu(SDL_Window* window, int x, int y) @extern("SDL_ShowWindowSystemMenu");

// Display
extern fn DisplayID get_primary_display() @extern("SDL_GetPrimaryDisplay");
extern fn bool get_display_bounds(DisplayID displayID, Rect* rect) @extern("SDL_GetDisplayBounds");

