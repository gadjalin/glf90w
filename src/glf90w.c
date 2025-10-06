// -----------------
//
// GLF90W (for GLFW 3.4) - https://github.com/gadjalin/glf90w
// Fortran 2008+ bindings for GLFW
//
// -----------------
// glf90w.c
// 17 Mar 2024
// Gaétan J.A.M. Jalin
// See end of file for complete licence description
// -----------------
#include "glf90w.h"

#include <stdint.h>

#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

int const glf90w_version_major                = GLFW_VERSION_MAJOR;
int const glf90w_version_minor                = GLFW_VERSION_MINOR;
int const glf90w_version_revision             = GLFW_VERSION_REVISION;
int const glf90w_true                         = GLFW_TRUE;
int const glf90w_false                        = GLFW_FALSE;

int const glf90w_release                      = GLFW_RELEASE;
int const glf90w_press                        = GLFW_PRESS;
int const glf90w_repeat                       = GLFW_REPEAT;
int const glf90w_hat_centered                 = GLFW_HAT_CENTERED;
int const glf90w_hat_up                       = GLFW_HAT_UP;
int const glf90w_hat_right                    = GLFW_HAT_RIGHT;
int const glf90w_hat_down                     = GLFW_HAT_DOWN;
int const glf90w_hat_left                     = GLFW_HAT_LEFT;
int const glf90w_hat_right_up                 = GLFW_HAT_RIGHT_UP;
int const glf90w_hat_right_down               = GLFW_HAT_RIGHT_DOWN;
int const glf90w_hat_left_up                  = GLFW_HAT_LEFT_UP;
int const glf90w_hat_left_down                = GLFW_HAT_LEFT_DOWN;

int const glf90w_key_unknown                  = GLFW_KEY_UNKNOWN;

int const glf90w_key_space                    = GLFW_KEY_SPACE;
int const glf90w_key_apostrophe               = GLFW_KEY_APOSTROPHE;
int const glf90w_key_comma                    = GLFW_KEY_COMMA;
int const glf90w_key_minus                    = GLFW_KEY_MINUS;
int const glf90w_key_period                   = GLFW_KEY_PERIOD;
int const glf90w_key_slash                    = GLFW_KEY_SLASH;
int const glf90w_key_0                        = GLFW_KEY_0;
int const glf90w_key_1                        = GLFW_KEY_1;
int const glf90w_key_2                        = GLFW_KEY_2;
int const glf90w_key_3                        = GLFW_KEY_3;
int const glf90w_key_4                        = GLFW_KEY_4;
int const glf90w_key_5                        = GLFW_KEY_5;
int const glf90w_key_6                        = GLFW_KEY_6;
int const glf90w_key_7                        = GLFW_KEY_7;
int const glf90w_key_8                        = GLFW_KEY_8;
int const glf90w_key_9                        = GLFW_KEY_9;
int const glf90w_key_semicolon                = GLFW_KEY_SEMICOLON;
int const glf90w_key_equal                    = GLFW_KEY_EQUAL;
int const glf90w_key_a                        = GLFW_KEY_A;
int const glf90w_key_b                        = GLFW_KEY_B;
int const glf90w_key_c                        = GLFW_KEY_C;
int const glf90w_key_d                        = GLFW_KEY_D;
int const glf90w_key_e                        = GLFW_KEY_E;
int const glf90w_key_f                        = GLFW_KEY_F;
int const glf90w_key_g                        = GLFW_KEY_G;
int const glf90w_key_h                        = GLFW_KEY_H;
int const glf90w_key_i                        = GLFW_KEY_I;
int const glf90w_key_j                        = GLFW_KEY_J;
int const glf90w_key_k                        = GLFW_KEY_K;
int const glf90w_key_l                        = GLFW_KEY_L;
int const glf90w_key_m                        = GLFW_KEY_M;
int const glf90w_key_n                        = GLFW_KEY_N;
int const glf90w_key_o                        = GLFW_KEY_O;
int const glf90w_key_p                        = GLFW_KEY_P;
int const glf90w_key_q                        = GLFW_KEY_Q;
int const glf90w_key_r                        = GLFW_KEY_R;
int const glf90w_key_s                        = GLFW_KEY_S;
int const glf90w_key_t                        = GLFW_KEY_T;
int const glf90w_key_u                        = GLFW_KEY_U;
int const glf90w_key_v                        = GLFW_KEY_V;
int const glf90w_key_w                        = GLFW_KEY_W;
int const glf90w_key_x                        = GLFW_KEY_X;
int const glf90w_key_y                        = GLFW_KEY_Y;
int const glf90w_key_z                        = GLFW_KEY_Z;
int const glf90w_key_left_bracket             = GLFW_KEY_LEFT_BRACKET;
int const glf90w_key_backslash                = GLFW_KEY_BACKSLASH;
int const glf90w_key_right_bracket            = GLFW_KEY_RIGHT_BRACKET;
int const glf90w_key_grave_accent             = GLFW_KEY_GRAVE_ACCENT;
int const glf90w_key_world_1                  = GLFW_KEY_WORLD_1;
int const glf90w_key_world_2                  = GLFW_KEY_WORLD_2;

int const glf90w_key_escape                   = GLFW_KEY_ESCAPE;
int const glf90w_key_enter                    = GLFW_KEY_ENTER;
int const glf90w_key_tab                      = GLFW_KEY_TAB;
int const glf90w_key_backspace                = GLFW_KEY_BACKSPACE;
int const glf90w_key_insert                   = GLFW_KEY_INSERT;
int const glf90w_key_delete                   = GLFW_KEY_DELETE;
int const glf90w_key_right                    = GLFW_KEY_RIGHT;
int const glf90w_key_left                     = GLFW_KEY_LEFT;
int const glf90w_key_down                     = GLFW_KEY_DOWN;
int const glf90w_key_up                       = GLFW_KEY_UP;
int const glf90w_key_page_up                  = GLFW_KEY_PAGE_UP;
int const glf90w_key_page_down                = GLFW_KEY_PAGE_DOWN;
int const glf90w_key_home                     = GLFW_KEY_HOME;
int const glf90w_key_end                      = GLFW_KEY_END;
int const glf90w_key_caps_lock                = GLFW_KEY_CAPS_LOCK;
int const glf90w_key_scroll_lock              = GLFW_KEY_SCROLL_LOCK;
int const glf90w_key_num_lock                 = GLFW_KEY_NUM_LOCK;
int const glf90w_key_print_screen             = GLFW_KEY_PRINT_SCREEN;
int const glf90w_key_pause                    = GLFW_KEY_PAUSE;
int const glf90w_key_f1                       = GLFW_KEY_F1;
int const glf90w_key_f2                       = GLFW_KEY_F2;
int const glf90w_key_f3                       = GLFW_KEY_F3;
int const glf90w_key_f4                       = GLFW_KEY_F4;
int const glf90w_key_f5                       = GLFW_KEY_F5;
int const glf90w_key_f6                       = GLFW_KEY_F6;
int const glf90w_key_f7                       = GLFW_KEY_F7;
int const glf90w_key_f8                       = GLFW_KEY_F8;
int const glf90w_key_f9                       = GLFW_KEY_F9;
int const glf90w_key_f10                      = GLFW_KEY_F10;
int const glf90w_key_f11                      = GLFW_KEY_F11;
int const glf90w_key_f12                      = GLFW_KEY_F12;
int const glf90w_key_f13                      = GLFW_KEY_F13;
int const glf90w_key_f14                      = GLFW_KEY_F14;
int const glf90w_key_f15                      = GLFW_KEY_F15;
int const glf90w_key_f16                      = GLFW_KEY_F16;
int const glf90w_key_f17                      = GLFW_KEY_F17;
int const glf90w_key_f18                      = GLFW_KEY_F18;
int const glf90w_key_f19                      = GLFW_KEY_F19;
int const glf90w_key_f20                      = GLFW_KEY_F20;
int const glf90w_key_f21                      = GLFW_KEY_F21;
int const glf90w_key_f22                      = GLFW_KEY_F22;
int const glf90w_key_f23                      = GLFW_KEY_F23;
int const glf90w_key_f24                      = GLFW_KEY_F24;
int const glf90w_key_f25                      = GLFW_KEY_F25;
int const glf90w_key_kp_0                     = GLFW_KEY_KP_0;
int const glf90w_key_kp_1                     = GLFW_KEY_KP_1;
int const glf90w_key_kp_2                     = GLFW_KEY_KP_2;
int const glf90w_key_kp_3                     = GLFW_KEY_KP_3;
int const glf90w_key_kp_4                     = GLFW_KEY_KP_4;
int const glf90w_key_kp_5                     = GLFW_KEY_KP_5;
int const glf90w_key_kp_6                     = GLFW_KEY_KP_6;
int const glf90w_key_kp_7                     = GLFW_KEY_KP_7;
int const glf90w_key_kp_8                     = GLFW_KEY_KP_8;
int const glf90w_key_kp_9                     = GLFW_KEY_KP_9;
int const glf90w_key_kp_decimal               = GLFW_KEY_KP_DECIMAL;
int const glf90w_key_kp_divide                = GLFW_KEY_KP_DIVIDE;
int const glf90w_key_kp_multiply              = GLFW_KEY_KP_MULTIPLY;
int const glf90w_key_kp_subtract              = GLFW_KEY_KP_SUBTRACT;
int const glf90w_key_kp_add                   = GLFW_KEY_KP_ADD;
int const glf90w_key_kp_enter                 = GLFW_KEY_KP_ENTER;
int const glf90w_key_kp_equal                 = GLFW_KEY_KP_EQUAL;
int const glf90w_key_left_shift               = GLFW_KEY_LEFT_SHIFT;
int const glf90w_key_left_control             = GLFW_KEY_LEFT_CONTROL;
int const glf90w_key_left_alt                 = GLFW_KEY_LEFT_ALT;
int const glf90w_key_left_super               = GLFW_KEY_LEFT_SUPER;
int const glf90w_key_right_shift              = GLFW_KEY_RIGHT_SHIFT;
int const glf90w_key_right_control            = GLFW_KEY_RIGHT_CONTROL;
int const glf90w_key_right_alt                = GLFW_KEY_RIGHT_ALT;
int const glf90w_key_right_super              = GLFW_KEY_RIGHT_SUPER;
int const glf90w_key_menu                     = GLFW_KEY_MENU;

int const glf90w_key_last                     = GLFW_KEY_LAST;

int const glf90w_mod_shift                    = GLFW_MOD_SHIFT;
int const glf90w_mod_control                  = GLFW_MOD_CONTROL;
int const glf90w_mod_alt                      = GLFW_MOD_ALT;
int const glf90w_mod_super                    = GLFW_MOD_SUPER;
int const glf90w_mod_caps_lock                = GLFW_MOD_CAPS_LOCK;
int const glf90w_mod_num_lock                 = GLFW_MOD_NUM_LOCK;

int const glf90w_mouse_button_1               = GLFW_MOUSE_BUTTON_1;
int const glf90w_mouse_button_2               = GLFW_MOUSE_BUTTON_2;
int const glf90w_mouse_button_3               = GLFW_MOUSE_BUTTON_3;
int const glf90w_mouse_button_4               = GLFW_MOUSE_BUTTON_4;
int const glf90w_mouse_button_5               = GLFW_MOUSE_BUTTON_5;
int const glf90w_mouse_button_6               = GLFW_MOUSE_BUTTON_6;
int const glf90w_mouse_button_7               = GLFW_MOUSE_BUTTON_7;
int const glf90w_mouse_button_8               = GLFW_MOUSE_BUTTON_8;
int const glf90w_mouse_button_last            = GLFW_MOUSE_BUTTON_LAST;
int const glf90w_mouse_button_left            = GLFW_MOUSE_BUTTON_LEFT;
int const glf90w_mouse_button_right           = GLFW_MOUSE_BUTTON_RIGHT;
int const glf90w_mouse_button_middle          = GLFW_MOUSE_BUTTON_MIDDLE;
int const glf90w_joystick_1                   = GLFW_JOYSTICK_1;
int const glf90w_joystick_2                   = GLFW_JOYSTICK_2;
int const glf90w_joystick_3                   = GLFW_JOYSTICK_3;
int const glf90w_joystick_4                   = GLFW_JOYSTICK_4;
int const glf90w_joystick_5                   = GLFW_JOYSTICK_5;
int const glf90w_joystick_6                   = GLFW_JOYSTICK_6;
int const glf90w_joystick_7                   = GLFW_JOYSTICK_7;
int const glf90w_joystick_8                   = GLFW_JOYSTICK_8;
int const glf90w_joystick_9                   = GLFW_JOYSTICK_9;
int const glf90w_joystick_10                  = GLFW_JOYSTICK_10;
int const glf90w_joystick_11                  = GLFW_JOYSTICK_11;
int const glf90w_joystick_12                  = GLFW_JOYSTICK_12;
int const glf90w_joystick_13                  = GLFW_JOYSTICK_13;
int const glf90w_joystick_14                  = GLFW_JOYSTICK_14;
int const glf90w_joystick_15                  = GLFW_JOYSTICK_15;
int const glf90w_joystick_16                  = GLFW_JOYSTICK_16;
int const glf90w_joystick_last                = GLFW_JOYSTICK_LAST;
int const glf90w_gamepad_button_a             = GLFW_GAMEPAD_BUTTON_A;
int const glf90w_gamepad_button_b             = GLFW_GAMEPAD_BUTTON_B;
int const glf90w_gamepad_button_x             = GLFW_GAMEPAD_BUTTON_X;
int const glf90w_gamepad_button_y             = GLFW_GAMEPAD_BUTTON_Y;
int const glf90w_gamepad_button_left_bumper   = GLFW_GAMEPAD_BUTTON_LEFT_BUMPER;
int const glf90w_gamepad_button_right_bumper  = GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER;
int const glf90w_gamepad_button_back          = GLFW_GAMEPAD_BUTTON_BACK;
int const glf90w_gamepad_button_start         = GLFW_GAMEPAD_BUTTON_START;
int const glf90w_gamepad_button_guide         = GLFW_GAMEPAD_BUTTON_GUIDE;
int const glf90w_gamepad_button_left_thumb    = GLFW_GAMEPAD_BUTTON_LEFT_THUMB;
int const glf90w_gamepad_button_right_thumb   = GLFW_GAMEPAD_BUTTON_RIGHT_THUMB;
int const glf90w_gamepad_button_dpad_up       = GLFW_GAMEPAD_BUTTON_DPAD_UP;
int const glf90w_gamepad_button_dpad_right    = GLFW_GAMEPAD_BUTTON_DPAD_RIGHT;
int const glf90w_gamepad_button_dpad_down     = GLFW_GAMEPAD_BUTTON_DPAD_DOWN;
int const glf90w_gamepad_button_dpad_left     = GLFW_GAMEPAD_BUTTON_DPAD_LEFT;
int const glf90w_gamepad_button_last          = GLFW_GAMEPAD_BUTTON_LAST;

int const glf90w_gamepad_button_cross         = GLFW_GAMEPAD_BUTTON_CROSS;
int const glf90w_gamepad_button_circle        = GLFW_GAMEPAD_BUTTON_CIRCLE;
int const glf90w_gamepad_button_square        = GLFW_GAMEPAD_BUTTON_SQUARE;
int const glf90w_gamepad_button_triangle      = GLFW_GAMEPAD_BUTTON_TRIANGLE;
int const glf90w_gamepad_axis_left_x          = GLFW_GAMEPAD_AXIS_LEFT_X;
int const glf90w_gamepad_axis_left_y          = GLFW_GAMEPAD_AXIS_LEFT_Y;
int const glf90w_gamepad_axis_right_x         = GLFW_GAMEPAD_AXIS_RIGHT_X;
int const glf90w_gamepad_axis_right_y         = GLFW_GAMEPAD_AXIS_RIGHT_Y;
int const glf90w_gamepad_axis_left_trigger    = GLFW_GAMEPAD_AXIS_LEFT_TRIGGER;
int const glf90w_gamepad_axis_right_trigger   = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER;
int const glf90w_gamepad_axis_last            = GLFW_GAMEPAD_AXIS_LAST;
int const glf90w_no_error                     = GLFW_NO_ERROR;
int const glf90w_not_initialized              = GLFW_NOT_INITIALIZED;
int const glf90w_no_current_context           = GLFW_NO_CURRENT_CONTEXT;
int const glf90w_invalid_enum                 = GLFW_INVALID_ENUM;
int const glf90w_invalid_value                = GLFW_INVALID_VALUE;
int const glf90w_out_of_memory                = GLFW_OUT_OF_MEMORY;
int const glf90w_api_unavailable              = GLFW_API_UNAVAILABLE;
int const glf90w_version_unavailable          = GLFW_VERSION_UNAVAILABLE;
int const glf90w_platform_error               = GLFW_PLATFORM_ERROR;
int const glf90w_format_unavailable           = GLFW_FORMAT_UNAVAILABLE;
int const glf90w_no_window_context            = GLFW_NO_WINDOW_CONTEXT;
int const glf90w_cursor_unavailable           = GLFW_CURSOR_UNAVAILABLE;
int const glf90w_feature_unavailable          = GLFW_FEATURE_UNAVAILABLE;
int const glf90w_feature_unimplemented        = GLFW_FEATURE_UNIMPLEMENTED;
int const glf90w_platform_unavailable         = GLFW_PLATFORM_UNAVAILABLE;
int const glf90w_focused                      = GLFW_FOCUSED;
int const glf90w_iconified                    = GLFW_ICONIFIED;
int const glf90w_resizable                    = GLFW_RESIZABLE;
int const glf90w_visible                      = GLFW_VISIBLE;
int const glf90w_decorated                    = GLFW_DECORATED;
int const glf90w_auto_iconify                 = GLFW_AUTO_ICONIFY;
int const glf90w_floating                     = GLFW_FLOATING;
int const glf90w_maximized                    = GLFW_MAXIMIZED;
int const glf90w_center_cursor                = GLFW_CENTER_CURSOR;
int const glf90w_transparent_framebuffer      = GLFW_TRANSPARENT_FRAMEBUFFER;
int const glf90w_hovered                      = GLFW_HOVERED;
int const glf90w_focus_on_show                = GLFW_FOCUS_ON_SHOW;

int const glf90w_mouse_passthrough            = GLFW_MOUSE_PASSTHROUGH;

int const glf90w_position_x                   = GLFW_POSITION_X;

int const glf90w_position_y                   = GLFW_POSITION_Y;

int const glf90w_red_bits                     = GLFW_RED_BITS;
int const glf90w_green_bits                   = GLFW_GREEN_BITS;
int const glf90w_blue_bits                    = GLFW_BLUE_BITS;
int const glf90w_alpha_bits                   = GLFW_ALPHA_BITS;
int const glf90w_depth_bits                   = GLFW_DEPTH_BITS;
int const glf90w_stencil_bits                 = GLFW_STENCIL_BITS;
int const glf90w_accum_red_bits               = GLFW_ACCUM_RED_BITS;
int const glf90w_accum_green_bits             = GLFW_ACCUM_GREEN_BITS;
int const glf90w_accum_blue_bits              = GLFW_ACCUM_BLUE_BITS;
int const glf90w_accum_alpha_bits             = GLFW_ACCUM_ALPHA_BITS;
int const glf90w_aux_buffers                  = GLFW_AUX_BUFFERS;
int const glf90w_stereo                       = GLFW_STEREO;
int const glf90w_samples                      = GLFW_SAMPLES;
int const glf90w_srgb_capable                 = GLFW_SRGB_CAPABLE;
int const glf90w_refresh_rate                 = GLFW_REFRESH_RATE;
int const glf90w_doublebuffer                 = GLFW_DOUBLEBUFFER;

int const glf90w_client_api                   = GLFW_CLIENT_API;
int const glf90w_context_version_major        = GLFW_CONTEXT_VERSION_MAJOR;
int const glf90w_context_version_minor        = GLFW_CONTEXT_VERSION_MINOR;
int const glf90w_context_revision             = GLFW_CONTEXT_REVISION;
int const glf90w_context_robustness           = GLFW_CONTEXT_ROBUSTNESS;
int const glf90w_opengl_forward_compat        = GLFW_OPENGL_FORWARD_COMPAT;
int const glf90w_context_debug                = GLFW_CONTEXT_DEBUG;
int const glf90w_opengl_debug_context         = GLFW_OPENGL_DEBUG_CONTEXT;
int const glf90w_opengl_profile               = GLFW_OPENGL_PROFILE;
int const glf90w_context_release_behavior     = GLFW_CONTEXT_RELEASE_BEHAVIOR;
int const glf90w_context_no_error             = GLFW_CONTEXT_NO_ERROR;
int const glf90w_context_creation_api         = GLFW_CONTEXT_CREATION_API;
int const glf90w_scale_to_monitor             = GLFW_SCALE_TO_MONITOR;
int const glf90w_scale_framebuffer            = GLFW_SCALE_FRAMEBUFFER;
int const glf90w_cocoa_retina_framebuffer     = GLFW_COCOA_RETINA_FRAMEBUFFER;
int const glf90w_cocoa_frame_name             = GLFW_COCOA_FRAME_NAME;
int const glf90w_cocoa_graphics_switching     = GLFW_COCOA_GRAPHICS_SWITCHING;
int const glf90w_x11_class_name               = GLFW_X11_CLASS_NAME;
int const glf90w_x11_instance_name            = GLFW_X11_INSTANCE_NAME;
int const glf90w_win32_keyboard_menu          = GLFW_WIN32_KEYBOARD_MENU;
int const glf90w_win32_showdefault            = GLFW_WIN32_SHOWDEFAULT;
int const glf90w_wayland_app_id               = GLFW_WAYLAND_APP_ID;
int const glf90w_no_api                       = GLFW_NO_API;
int const glf90w_opengl_api                   = GLFW_OPENGL_API;
int const glf90w_opengl_es_api                = GLFW_OPENGL_ES_API;

int const glf90w_no_robustness                = GLFW_NO_ROBUSTNESS;
int const glf90w_no_reset_notification        = GLFW_NO_RESET_NOTIFICATION;
int const glf90w_lose_context_on_reset        = GLFW_LOSE_CONTEXT_ON_RESET;

int const glf90w_opengl_any_profile           = GLFW_OPENGL_ANY_PROFILE;
int const glf90w_opengl_core_profile          = GLFW_OPENGL_CORE_PROFILE;
int const glf90w_opengl_compat_profile        = GLFW_OPENGL_COMPAT_PROFILE;

int const glf90w_cursor                       = GLFW_CURSOR;
int const glf90w_sticky_keys                  = GLFW_STICKY_KEYS;
int const glf90w_sticky_mouse_buttons         = GLFW_STICKY_MOUSE_BUTTONS;
int const glf90w_lock_key_mods                = GLFW_LOCK_KEY_MODS;
int const glf90w_raw_mouse_motion             = GLFW_RAW_MOUSE_MOTION;

int const glf90w_cursor_normal                = GLFW_CURSOR_NORMAL;
int const glf90w_cursor_hidden                = GLFW_CURSOR_HIDDEN;
int const glf90w_cursor_disabled              = GLFW_CURSOR_DISABLED;
int const glf90w_cursor_captured              = GLFW_CURSOR_CAPTURED;

int const glf90w_any_release_behavior         = GLFW_ANY_RELEASE_BEHAVIOR;
int const glf90w_release_behavior_flush       = GLFW_RELEASE_BEHAVIOR_FLUSH;
int const glf90w_release_behavior_none        = GLFW_RELEASE_BEHAVIOR_NONE;

int const glf90w_native_context_api           = GLFW_NATIVE_CONTEXT_API;
int const glf90w_egl_context_api              = GLFW_EGL_CONTEXT_API;
int const glf90w_osmesa_context_api           = GLFW_OSMESA_CONTEXT_API;

int const glf90w_angle_platform_type_none     = GLFW_ANGLE_PLATFORM_TYPE_NONE;
int const glf90w_angle_platform_type_opengl   = GLFW_ANGLE_PLATFORM_TYPE_OPENGL;
int const glf90w_angle_platform_type_opengles = GLFW_ANGLE_PLATFORM_TYPE_OPENGLES;
int const glf90w_angle_platform_type_d3d9     = GLFW_ANGLE_PLATFORM_TYPE_D3D9;
int const glf90w_angle_platform_type_d3d11    = GLFW_ANGLE_PLATFORM_TYPE_D3D11;
int const glf90w_angle_platform_type_vulkan   = GLFW_ANGLE_PLATFORM_TYPE_VULKAN;
int const glf90w_angle_platform_type_metal    = GLFW_ANGLE_PLATFORM_TYPE_METAL;

int const glf90w_wayland_prefer_libdecor      = GLFW_WAYLAND_PREFER_LIBDECOR;
int const glf90w_wayland_disable_libdecor     = GLFW_WAYLAND_DISABLE_LIBDECOR;

int const glf90w_any_position                 = GLFW_ANY_POSITION;

int const glf90w_arrow_cursor                 = GLFW_ARROW_CURSOR;
int const glf90w_ibeam_cursor                 = GLFW_IBEAM_CURSOR;
int const glf90w_crosshair_cursor             = GLFW_CROSSHAIR_CURSOR;
int const glf90w_pointing_hand_cursor         = GLFW_POINTING_HAND_CURSOR;
int const glf90w_resize_ew_cursor             = GLFW_RESIZE_EW_CURSOR;
int const glf90w_resize_ns_cursor             = GLFW_RESIZE_NS_CURSOR;
int const glf90w_resize_nwse_cursor           = GLFW_RESIZE_NWSE_CURSOR;
int const glf90w_resize_nesw_cursor           = GLFW_RESIZE_NESW_CURSOR;
int const glf90w_resize_all_cursor            = GLFW_RESIZE_ALL_CURSOR;
int const glf90w_not_allowed_cursor           = GLFW_NOT_ALLOWED_CURSOR;
int const glf90w_hresize_cursor               = GLFW_HRESIZE_CURSOR;
int const glf90w_vresize_cursor               = GLFW_VRESIZE_CURSOR;
int const glf90w_hand_cursor                  = GLFW_HAND_CURSOR;
int const glf90w_connected                    = GLFW_CONNECTED;
int const glf90w_disconnected                 = GLFW_DISCONNECTED;

int const glf90w_joystick_hat_buttons         = GLFW_JOYSTICK_HAT_BUTTONS;
int const glf90w_angle_platform_type          = GLFW_ANGLE_PLATFORM_TYPE;
int const glf90w_platform                     = GLFW_PLATFORM;
int const glf90w_cocoa_chdir_resources        = GLFW_COCOA_CHDIR_RESOURCES;
int const glf90w_cocoa_menubar                = GLFW_COCOA_MENUBAR;
int const glf90w_x11_xcb_vulkan_surface       = GLFW_X11_XCB_VULKAN_SURFACE;
int const glf90w_wayland_libdecor             = GLFW_WAYLAND_LIBDECOR;
int const glf90w_any_platform                 = GLFW_ANY_PLATFORM;
int const glf90w_platform_win32               = GLFW_PLATFORM_WIN32;
int const glf90w_platform_cocoa               = GLFW_PLATFORM_COCOA;
int const glf90w_platform_wayland             = GLFW_PLATFORM_WAYLAND;
int const glf90w_platform_x11                 = GLFW_PLATFORM_X11;
int const glf90w_platform_null                = GLFW_PLATFORM_NULL;
int const glf90w_dont_care                    = GLFW_DONT_CARE;

// -----------------
// GLF90W is provided under the zlib licence
//
// Copyright (C) 2024 Gaétan J.A.M. Jalin
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
//    1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would be
//    appreciated but is not required.
//
//    2. Altered source versions must be plainly marked as such, and must not be
//    misrepresented as being the original software.
//
//    3. This notice may not be removed or altered from any source distribution.
// -----------------

