
module sdl3;

// Types
alias EventFilter = fn bool(void* userdata, Event* event);

// Unions
union Event {
  EventType type;                     /**< Event type, shared with all events, Uint32 to cover user events which are not in the SDL_EventType enumeration */
  
  CommonEvent common;                 /**< Common event data */
  DisplayEvent display;               /**< Display event data */
  WindowEvent window;                 /**< Window event data */
  KeyboardDeviceEvent kdevice;        /**< Keyboard device change event data */
  KeyboardEvent key;                  /**< Keyboard event data */
  TextEditingEvent edit;              /**< Text editing event data */
  TextEditingCandidatesEvent edit_candidates; /**< Text editing candidates event data */
  TextInputEvent text;                /**< Text input event data */
  MouseDeviceEvent mdevice;           /**< Mouse device change event data */
  MouseMotionEvent motion;            /**< Mouse motion event data */
  MouseButtonEvent button;            /**< Mouse button event data */
  MouseWheelEvent wheel;              /**< Mouse wheel event data */
  JoyDeviceEvent jdevice;             /**< Joystick device change event data */
  JoyAxisEvent jaxis;                 /**< Joystick axis event data */
  JoyBallEvent jball;                 /**< Joystick ball event data */
  JoyHatEvent jhat;                   /**< Joystick hat event data */
  JoyButtonEvent jbutton;             /**< Joystick button event data */
  JoyBatteryEvent jbattery;           /**< Joystick battery event data */
  GamepadDeviceEvent gdevice;         /**< Gamepad device event data */
  GamepadAxisEvent gaxis;             /**< Gamepad axis event data */
  GamepadButtonEvent gbutton;         /**< Gamepad button event data */
  GamepadTouchpadEvent gtouchpad;     /**< Gamepad touchpad event data */
  GamepadSensorEvent gsensor;         /**< Gamepad sensor event data */
  AudioDeviceEvent adevice;           /**< Audio device event data */
  CameraDeviceEvent cdevice;          /**< Camera device event data */
  SensorEvent sensor;                 /**< Sensor event data */
  QuitEvent quit;                     /**< Quit request event data */
  UserEvent user;                     /**< Custom event data */
  TouchFingerEvent tfinger;           /**< Touch finger event data */
  PinchFingerEvent pinch;             /**< Pinch event data */
  PenProximityEvent pproximity;       /**< Pen proximity event data */
  PenTouchEvent ptouch;               /**< Pen tip touching event data */
  PenMotionEvent pmotion;             /**< Pen motion event data */
  PenButtonEvent pbutton;             /**< Pen button event data */
  PenAxisEvent paxis;                 /**< Pen axis event data */
  RenderEvent render;                 /**< Render event data */
  DropEvent drop;                     /**< Drag and drop event data */
  ClipboardEvent clipboard;           /**< Clipboard event data */

  char[128] padding;
}

// Structs
struct AudioDeviceEvent {
  /**< SDL_EVENT_AUDIO_DEVICE_ADDED,
    or SDL_EVENT_AUDIO_DEVICE_REMOVED,
    or SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED */
  EventType type;
    
  uint reserved;
  ulong timestamp;      /**< In nanoseconds, populated using SDL_GetTicksNS() */
  
  AudioDeviceID which;  /**< SDL_AudioDeviceID for the device being added or removed or changing */
  bool recording;       /**< false if a playback device, true if a recording device. */
  
  char padding1;
  char padding2;
  char padding3;
}
struct CameraDeviceEvent {
  /**< SDL_EVENT_CAMERA_DEVICE_ADDED,
       SDL_EVENT_CAMERA_DEVICE_REMOVED,
       SDL_EVENT_CAMERA_DEVICE_APPROVED,
       SDL_EVENT_CAMERA_DEVICE_DENIED */
  EventType type;  
  
  uint reserved;
  ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
  
  CameraID which;    /**< SDL_CameraID for the device being added or removed or changing */
}
struct ClipboardEvent {
  /**< SDL_EVENT_CLIPBOARD_UPDATE */
  EventType type; 

  uint reserved;
  ulong timestamp;    /**< In nanoseconds, populated using SDL_GetTicksNS() */

  bool owner;         /**< are we owning the clipboard (internal update) */
  int num_mime_types; /**< number of mime types */
  char** mime_types;  /**< current mime types */
}
struct CommonEvent {
  EventType type;  /**< Event type, shared with all events, Uint32 to cover user events which are not in the SDL_EventType enumeration */
    
  uint reserved;
  ulong timestamp; /**< In nanoseconds, populated using SDL_GetTicksNS() */
}
struct DisplayEvent {
  /**< SDL_EVENT_DISPLAY_* */
  EventType type;
  
  uint reserved;
  ulong timestamp;     /**< In nanoseconds, populated using SDL_GetTicksNS() */
  
  DisplayID displayID; /**< The associated display */
  int data1;           /**< event dependent data */
  int data2;           /**< event dependent data */
}
struct DropEvent {
  /**< SDL_EVENT_DROP_BEGIN,
       SDL_EVENT_DROP_FILE,
       SDL_EVENT_DROP_TEXT,
       SDL_EVENT_DROP_COMPLETE,
       SDL_EVENT_DROP_POSITION */
  EventType type; 
  
  uint reserved;
  ulong timestamp;    /**< In nanoseconds, populated using SDL_GetTicksNS() */
  
  WindowID windowID;  /**< The window that was dropped on, if any */
  float x;            /**< X coordinate, relative to window (not on begin) */
  float y;            /**< Y coordinate, relative to window (not on begin) */
  char* source;       /**< The source app that sent this drop event, or NULL if that isn't available */
    const char *data;   /**< The text for SDL_EVENT_DROP_TEXT and the file name for SDL_EVENT_DROP_FILE, NULL for other events */
}

// Enums
enum EventType : const CInt {
  FIRST                       = 0x000,

  // Application events
  QUIT                        = 0x100,
  TERMINATING                 = 0x101,
  LOW_MEMORY                  = 0x102,
  WILL_ENTER_BACKGROUND       = 0x103,
  DID_ENTER_BACKGROUND        = 0x104,
  WILL_ENTER_FOREGROUND       = 0x105,
  DID_ENTER_FOREGROUND        = 0x106,

  LOCALE_CHANGED              = 0x107,
  SYSTEM_THEME_CHANGED        = 0x108,

  // Display events
  DISPLAY_ORIENTATION           = 0x151,
  DISPLAY_ADDED                 = 0x152,
  DISPLAY_REMOVED               = 0x153,
  DISPLAY_MOVED                 = 0x154,
  DISPLAY_DESKTOP_MODE_CHANGED  = 0x155,
  DISPLAY_CURRENT_MODE_CHANGED  = 0x156,
  DISPLAY_CONTENT_SCALE_CHANGED = 0x157,
  DISPLAY_USABLE_BOUNDS_CHANGED = 0x158,
  DISPLAY_FIRST                 = DISPLAY_ORIENTATION,
  DISPLAY_LAST                  = DISPLAY_USABLE_BOUNDS_CHANGED,

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
  WINDOW_FIRST                = WINDOW_SHOWN,
  WINDOW_LAST                 = WINDOW_HDR_STATE_CHANGED,

  // Keyboard Events
  KEY_DOWN                    = 0x300,
  KEY_UP                      = 0x301,
  TEXT_EDITING                = 0x302,
  TEXT_INPUT                  = 0x303,
  KEYMAP_CHANGED              = 0x304,
  KEYBOARD_ADDED              = 0x305,
  KEYBOARD_REMOVED            = 0x306,
  TEXT_EDITING_CANDIDATES     = 0x307,
  SCREEN_KEYBOARD_SHOWN       = 0x308,
  SCREEN_KEYBOARD_HIDDEN      = 0x309,

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
  JOYSTICK_UPDATE_COMPLETE    = 0x608,

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
  GAMEPAD_STEAM_HANDLE_UPDATED= 0x65B,

  // Touch events
  FINGER_DOWN                 = 0x700,
  FINGER_UP                   = 0x701,
  FINGER_MOTION               = 0x702,
  FINGER_CANCELED             = 0x703,

  PINCH_BEGIN                 = 0x710,
  PINCH_UPDATE                = 0x711,
  PINCH_END                   = 0x712,

  // Clipboard events
  CLIPBOARD_UPDATE            = 0x900,

  // Drop events
  DROP_FILE                   = 0x1000,
  DROP_TEXT                   = 0x1001,
  DROP_BEGIN                  = 0x1002,
  DROP_COMPLETE               = 0x1003,
  DROP_POSITION               = 0x1004,

  // Audio device events
  AUDIO_DEVICE_ADDED          = 0x1100,
  AUDIO_DEVICE_REMOVED        = 0x1101,
  AUDIO_DEVICE_FORMAT_CHANGED = 0x1102,

  // Sensor events
  SENSOR_UPDATE               = 0x1200,

  // Pen events
  PEN_PROXIMITY_IN            = 0x1300,
  PEN_PROXIMITY_OUT           = 0x1301,
  PEN_DOWN                    = 0x1302,
  PEN_UP                      = 0x1303,
  PEN_BUTTON_DOWN             = 0x1304,
  PEN_BUTTON_UP               = 0x1305,
  PEN_MOTION                  = 0x1306,
  PEN_AXIS                    = 0x1307,

  // Camera hotplug events
  CAMERA_DEVICE_ADDED         = 0x1400,
  CAMERA_DEVICE_REMOVED       = 0x1401,
  CAMERA_DEVICE_APPROVED      = 0x1402,
  CAMERA_DEVICE_DENIED        = 0x1403,

  // Render events
  RENDER_TARGETS_RESET        = 0x2000,
  RENDER_DEVICE_RESET         = 0x2001,
  RENDER_DEVICE_LOST          = 0x2002,

  // Private / user events
  USER                        = 0x8000,
  LAST                        = 0xFFFF
}

// Functions

