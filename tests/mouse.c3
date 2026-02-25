
import std::io;
import sdl3;


const uint SCREEN_WIDTH = 640;
const uint SCREEN_HEIGHT = 480;

Window* window;

struct Object {
  Object* next;
  float x1, y1, x2, y2;
  char r, g, b;
  bool isRect;
}

Object* active = null;
Object* objects = null;
uint buttons = 0;
bool isRect = false;

bool wheel_x_active = false;
bool wheel_y_active = false;
float wheel_x = (float)SCREEN_WIDTH * 0.5f;
float wheel_y = (float)SCREEN_HEIGHT * 0.5f;

struct MouseLoopData {
  bool done;
  Renderer* renderer;
}

fn void drawObject(Renderer* renderer, Object* object) {
  sdl3::setRenderDrawColor(renderer, object.r, object.g, object.b, 255);

  if (object.isRect) {
    FRect rect;

    if (object.x1 > object.x2) {
      rect.x = object.x2;
      rect.w = object.x1 - object.x2;
    } else {
      rect.x = object.x1;
      rect.w = object.x2 - object.x1;
    }
    
    if (object.y1 > object.y2) {
      rect.y = object.y2;
      rect.h = object.y1 - object.y2;
    } else {
      rect.y = object.y1;
      rect.h = object.y2 - object.y1;
    }

    sdl3::renderFillRect(renderer, &rect);
  } else { sdl3::renderLine(renderer, object.x1, object.y1, object.x2, object.y2); }
}

fn void drawObjects(Renderer* renderer) {
  Object* next = objects;
  while (next != null) {
    drawObject(renderer, next);
    next = next.next;
  }
}

fn void appendObject(Object* object) {
  if (objects != null) {
    Object* next = objects;
    while (next.next != null) {
      next = next.next;
    }
    next.next = object;
  } else {
    objects = object;
  }
}

fn void loop(void* arg) {
  MouseLoopData* loopData = (MouseLoopData*)arg;
  Event event;
  Renderer* renderer = loopData.renderer;
  float fx, fy;
  MouseButtonFlags flags;

  while(sdl3::pollEvent(&event)) {
    switch (event.type) {
      case MOUSE_WHEEL:
        if (event.wheel.direction == FLIPPED) {
          event.wheel.x *= -1;
          event.wheel.y *= -1;
        }
        if (event.wheel.x != 0) {
          wheel_x_active = true;
          wheel_x += event.wheel.x * 10;
        }
        if (event.wheel.y != 0) {
          wheel_y_active = true;
          wheel_y -= event.wheel.y * 10;
        }

      case MOUSE_MOTION:
        if (!active) break;

        active.x2 = event.motion.x;
        active.y2 = event.motion.y;

      case MOUSE_BUTTON_DOWN:
        if (active == null) {
          active = mem::new(Object);
          active.x1 = active.x2 = event.button.x;
          active.y1 = active.y2 = event.button.y;
          active.isRect = isRect;
        }

        switch (event.button.button) {
          case sdl3::BUTTON_LEFT:
            active.r = 255;
            buttons |= sdl3::BUTTON_LMASK;
          case sdl3::BUTTON_MIDDLE:
            active.g = 255;
            buttons |= sdl3::BUTTON_MMASK;
          case sdl3::BUTTON_RIGHT:
            active.b = 255;
            buttons |= sdl3::BUTTON_RMASK;
          case sdl3::BUTTON_X1:
            active.r = 255;
            active.b = 255;
            buttons |= sdl3::BUTTON_X1MASK;
          case sdl3::BUTTON_X2:
            active.r = 255;
            active.b = 255;
            buttons |= sdl3::BUTTON_X2MASK;
        }

      case MOUSE_BUTTON_UP:
        if (!active) break;
        io::printfn("(%f,%f)(%f,%f)", active.x1, active.y1, active.x2, active.y2);

        switch (event.button.button) {
          case sdl3::BUTTON_LEFT:
            buttons &= ~sdl3::BUTTON_LMASK;
          case sdl3::BUTTON_MIDDLE:
            buttons &= ~sdl3::BUTTON_MMASK;
          case sdl3::BUTTON_RIGHT:
            buttons &= ~sdl3::BUTTON_RMASK;
          case sdl3::BUTTON_X1:
            buttons &= ~sdl3::BUTTON_X1MASK;
          case sdl3::BUTTON_X2:
            buttons &= ~sdl3::BUTTON_X2MASK;
        }
        if (buttons == 0) {
          appendObject(active);
          active = null;
        }

      case KEY_DOWN:
        if (event.key.scancode == ESCAPE) loopData.done = true;
        if (event.key.key == sdl3::KEY_C) {
          int x, y, w, h;
          sdl3::getWindowPosition(window, &x, &y);
          sdl3::getWindowSize(window, &w, &h);
          w /= 2;
          h /= 2;

          if (event.key.mod & sdl3::KMOD_ALT)
            { sdl3::warpMouseGlobal((float)(x + w), (float)(y + h)); }
          else
            { sdl3::warpMouseInWindow(window, (float)w, (float)h); }
        }
        nextcase;

      case KEY_UP:
        switch (event.key.key) {
          case sdl3::KEY_LSHIFT:
            isRect = event.key.down;
            if (active) active.isRect = isRect;
          default: break;
        }

      case QUIT:
        loopData.done = true;

      default: break;
    }
  }

  sdl3::setRenderDrawColor(renderer, 0, 0, 0, 255);
  sdl3::renderClear(renderer);

  /* Mouse wheel */
  sdl3::setRenderDrawColor(renderer, 0, 255, 128, 255);
  if (wheel_x_active)
    { sdl3::renderLine(renderer, wheel_x, 0.0f, wheel_x, (float)SCREEN_HEIGHT); }
  if (wheel_y_active)
    { sdl3::renderLine(renderer, 0.0f, wheel_y, (float)SCREEN_WIDTH, wheel_y); }

  /* Objects from mouse clicks */
  drawObjects(renderer);
  if (active) drawObject(renderer, active);

  flags = sdl3::getGlobalMouseState(&fx, &fy);
  sdl3::setRenderDrawColor(renderer, 255, 255, 255, 255);
  sdl3::renderDebugTextFormat(renderer, 0, 0, "Global Mouse State: x=%f y=%f flags=%", fx, fy, flags);

  sdl3::renderPresent(renderer);
}

fn void mouse() @test {
  MouseLoopData loopData;
  PropertiesID props;

  assert(sdl3::init({.video = true}), "Couldn't initialize SDL: %s", sdl3::getError());
  window = sdl3::createWindow("Mouse Test", SCREEN_WIDTH, SCREEN_HEIGHT, {});
  assert(window != null, "Couldn't create window: %s", sdl3::getError());

  loopData.done = false;

  loopData.renderer = sdl3::createRenderer(window, null);
  assert(loopData.renderer != null, "Couldn't create renderer: %s", sdl3::getError());

  while (loopData.done == false) {
    loop(&loopData);
  }

  while (active != null) {
    Object* next = active.next;
    free(active);
    active = next;
  }
  sdl3::destroyRenderer(loopData.renderer);
  sdl3::destroyWindow(window);

  sdl3::quit();
  assert(false);
}
