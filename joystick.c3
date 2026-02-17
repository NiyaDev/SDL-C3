
module sdl3;

// Types
alias Joystick = void;
alias JoystickID = uint;

alias Update = fn void(void* userdata);
alias SetPlayerIndex = fn void(void* userdata, int player_index);
alias Rumble = fn bool(void* userdata, ushort low_frequency_rumble, ushort high_frequency_rumble);
alias RumbleTriggers = fn bool(void *userdata, ushort left_rumble, ushort right_rumble);
alias SetLED = fn bool(void* userdata, char red, char green, char blue);
alias SendEffect = fn bool(void* userdata, void* data, int size);
alias SetSensorsEnabled = fn bool(void* userdata, bool enabled);
alias Cleanup = fn void(void* userdata);

// Bitstructs
bitstruct JoystickHat : int {
  bool up:    0;
  bool right: 1;
  bool down:  2;
  bool up:    3;
}

// Structs
struct VirtualJoystickDesc {
  uint version;       /**< the version of this interface */
  ushort type;        /**< `SDL_JoystickType` */
  ushort padding;     /**< unused */
  ushort vendor_id;   /**< the USB vendor ID of this joystick */
  ushort product_id;  /**< the USB product ID of this joystick */
  ushort naxes;       /**< the number of axes on this joystick */
  ushort nbuttons;    /**< the number of buttons on this joystick */
  ushort nballs;      /**< the number of balls on this joystick */
  ushort nhats;       /**< the number of hats on this joystick */
  ushort ntouchpads;  /**< the number of touchpads on this joystick, requires `touchpads` to point at valid descriptions */
  ushort nsensors;    /**< the number of sensors on this joystick, requires `sensors` to point at valid descriptions */
  ushort[2] padding2; /**< unused */
  uint button_mask;   /**< A mask of which buttons are valid for this controller
                             e.g. (1 << SDL_GAMEPAD_BUTTON_SOUTH) */
  uint axis_mask;     /**< A mask of which axes are valid for this controller
                             e.g. (1 << SDL_GAMEPAD_AXIS_LEFTX) */
  char* name;   /**< the name of the joystick */
  VirtualJoystickTouchpadDesc* touchpads;   /**< A pointer to an array of touchpad descriptions, required if `ntouchpads` is > 0 */
  VirtualJoystickSensorDesc* sensors;       /**< A pointer to an array of sensor descriptions, required if `nsensors` is > 0 */

  void* userdata;     /**< User data pointer passed to callbacks */
}
struct VirtualJoystickSensorDesc {
  SensorType type;    /**< the type of this sensor */
  float rate;             /**< the update frequency of this sensor, may be 0.0f */
}
struct VirtualJoystickTouchpadDesc {
  ushort nfingers;    /**< the number of simultaneous fingers on this touchpad */
  ushort[3] padding;
}

// Enums
enum JoystickConnectionState : const CInt {
  INVALID  = -1,
  UNKNOWN  =  0,
  WIRED    =  1,
  WIRELESS =  2,
}

// Functions
extern fn JoystickID attachVirtualJoystick(VirtualJoystickDesc* desc) @extern("SDL_AttachVirtualJoystick");
extern fn void closeJoystick(Joystick* joystick) @extern("SDL_CloseJoystick");
extern fn bool detachVirtualJoystick(JoystickID instance_id) @extern("SDL_DetachVirtualJoystick");
extern fn short getJoystickAxis(Joystick* joystick, int axis) @extern("SDL_GetJoystickAxis");
extern fn bool getJoystickAxisInitialState(Joystick* joystick, int axis, short* state) @extern("SDL_GetJoystickAxisInitialState");
extern fn bool getJoystickBall(Joystick* joystick, int ball, int* dx, int* dy) @extern("SDL_GetJoystickBall");
extern fn bool getJoystickButton(Joystick* joystick, int button) @extern("SDL_GetJoystickButton");
extern fn JoystickConnectionState getJoystickConnectionState(Joystick* joystick) @extern("SDL_JoystickConnectionState");
extern fn ushort getJoystickFirmwareVersion(Joystick* joystick) @extern("SDL_GetJoystickFirmwareVersion");
extern fn Joystick* getJoystickFromID(JoystickID instance_id) @extern("SDL_GetJoystickFromID");
extern fn Joystick* getJoystickFromPlayerIndex(int player_index) @extern("SDL_GetJoystickFromPlayerIndex");
extern fn GuID getJoystickGUID(Joystick* joystick) @extern("SDL_GetJoystickGUID");
extern fn GuID getJoystickGUIDForID(JoystickID instance_id) @extern("SDL_GetJoystickGUIDForID");
extern fn void getJoystickGUIDInfo(GuID guid, ushort* vendor, ushort* product, ushort* version, ushort* crc16) @extern("SDL_GetJoystickGUIDInfo");
extern fn char getJoystickHat(Joystick* joystick, JoystickHat hat) @extern("SDL_GetJoystickHat");
extern fn JoystickID getJoystickID(Joystick* joystick) @extern("SDL_GetJoystickID");

