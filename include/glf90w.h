// ------------------
//
// GLF90W (for GLFW 3.4) - https://github.com/gadjalin/glf90w
// Fortran 2008+ bindings for GLFW
//
// -----------------
// glf90w.h
// 17 Mar 2024
// Gaétan J.A.M. Jalin
// See end of file for complete licence description
// -----------------
#ifndef GLF90W_H
#define GLF90W_H

extern int const glf90w_version_major;
extern int const glf90w_version_minor;
extern int const glf90w_version_revision;
extern int const glf90w_true;
extern int const glf90w_false;

extern int const glf90w_release;
extern int const glf90w_press;
extern int const glf90w_repeat;
extern int const glf90w_hat_centered;
extern int const glf90w_hat_up;
extern int const glf90w_hat_right;
extern int const glf90w_hat_down;
extern int const glf90w_hat_left;
extern int const glf90w_hat_right_up;
extern int const glf90w_hat_right_down;
extern int const glf90w_hat_left_up;
extern int const glf90w_hat_left_down;

extern int const glf90w_key_unknown;

extern int const glf90w_key_space;
extern int const glf90w_key_apostrophe;
extern int const glf90w_key_comma;
extern int const glf90w_key_minus;
extern int const glf90w_key_period;
extern int const glf90w_key_slash;
extern int const glf90w_key_0;
extern int const glf90w_key_1;
extern int const glf90w_key_2;
extern int const glf90w_key_3;
extern int const glf90w_key_4;
extern int const glf90w_key_5;
extern int const glf90w_key_6;
extern int const glf90w_key_7;
extern int const glf90w_key_8;
extern int const glf90w_key_9;
extern int const glf90w_key_semicolon;
extern int const glf90w_key_equal;
extern int const glf90w_key_a;
extern int const glf90w_key_b;
extern int const glf90w_key_c;
extern int const glf90w_key_d;
extern int const glf90w_key_e;
extern int const glf90w_key_f;
extern int const glf90w_key_g;
extern int const glf90w_key_h;
extern int const glf90w_key_i;
extern int const glf90w_key_j;
extern int const glf90w_key_k;
extern int const glf90w_key_l;
extern int const glf90w_key_m;
extern int const glf90w_key_n;
extern int const glf90w_key_o;
extern int const glf90w_key_p;
extern int const glf90w_key_q;
extern int const glf90w_key_r;
extern int const glf90w_key_s;
extern int const glf90w_key_t;
extern int const glf90w_key_u;
extern int const glf90w_key_v;
extern int const glf90w_key_w;
extern int const glf90w_key_x;
extern int const glf90w_key_y;
extern int const glf90w_key_z;
extern int const glf90w_key_left_bracket;
extern int const glf90w_key_backslash;
extern int const glf90w_key_right_bracket;
extern int const glf90w_key_grave_accent;
extern int const glf90w_key_world_1;
extern int const glf90w_key_world_2;

extern int const glf90w_key_escape;
extern int const glf90w_key_enter;
extern int const glf90w_key_tab;
extern int const glf90w_key_backspace;
extern int const glf90w_key_insert;
extern int const glf90w_key_delete;
extern int const glf90w_key_right;
extern int const glf90w_key_left;
extern int const glf90w_key_down;
extern int const glf90w_key_up;
extern int const glf90w_key_page_up;
extern int const glf90w_key_page_down;
extern int const glf90w_key_home;
extern int const glf90w_key_end;
extern int const glf90w_key_caps_lock;
extern int const glf90w_key_scroll_lock;
extern int const glf90w_key_num_lock;
extern int const glf90w_key_print_screen;
extern int const glf90w_key_pause;
extern int const glf90w_key_f1;
extern int const glf90w_key_f2;
extern int const glf90w_key_f3;
extern int const glf90w_key_f4;
extern int const glf90w_key_f5;
extern int const glf90w_key_f6;
extern int const glf90w_key_f7;
extern int const glf90w_key_f8;
extern int const glf90w_key_f9;
extern int const glf90w_key_f10;
extern int const glf90w_key_f11;
extern int const glf90w_key_f12;
extern int const glf90w_key_f13;
extern int const glf90w_key_f14;
extern int const glf90w_key_f15;
extern int const glf90w_key_f16;
extern int const glf90w_key_f17;
extern int const glf90w_key_f18;
extern int const glf90w_key_f19;
extern int const glf90w_key_f20;
extern int const glf90w_key_f21;
extern int const glf90w_key_f22;
extern int const glf90w_key_f23;
extern int const glf90w_key_f24;
extern int const glf90w_key_f25;
extern int const glf90w_key_kp_0;
extern int const glf90w_key_kp_1;
extern int const glf90w_key_kp_2;
extern int const glf90w_key_kp_3;
extern int const glf90w_key_kp_4;
extern int const glf90w_key_kp_5;
extern int const glf90w_key_kp_6;
extern int const glf90w_key_kp_7;
extern int const glf90w_key_kp_8;
extern int const glf90w_key_kp_9;
extern int const glf90w_key_kp_decimal;
extern int const glf90w_key_kp_divide;
extern int const glf90w_key_kp_multiply;
extern int const glf90w_key_kp_subtract;
extern int const glf90w_key_kp_add;
extern int const glf90w_key_kp_enter;
extern int const glf90w_key_kp_equal;
extern int const glf90w_key_left_shift;
extern int const glf90w_key_left_control;
extern int const glf90w_key_left_alt;
extern int const glf90w_key_left_super;
extern int const glf90w_key_right_shift;
extern int const glf90w_key_right_control;
extern int const glf90w_key_right_alt;
extern int const glf90w_key_right_super;
extern int const glf90w_key_menu;

extern int const glf90w_key_last;

extern int const glf90w_mod_shift;
extern int const glf90w_mod_control;
extern int const glf90w_mod_alt;
extern int const glf90w_mod_super;
extern int const glf90w_mod_caps_lock;
extern int const glf90w_mod_num_lock;

extern int const glf90w_mouse_button_1;
extern int const glf90w_mouse_button_2;
extern int const glf90w_mouse_button_3;
extern int const glf90w_mouse_button_4;
extern int const glf90w_mouse_button_5;
extern int const glf90w_mouse_button_6;
extern int const glf90w_mouse_button_7;
extern int const glf90w_mouse_button_8;
extern int const glf90w_mouse_button_last;
extern int const glf90w_mouse_button_left;
extern int const glf90w_mouse_button_right;
extern int const glf90w_mouse_button_middle;
extern int const glf90w_joystick_1;
extern int const glf90w_joystick_2;
extern int const glf90w_joystick_3;
extern int const glf90w_joystick_4;
extern int const glf90w_joystick_5;
extern int const glf90w_joystick_6;
extern int const glf90w_joystick_7;
extern int const glf90w_joystick_8;
extern int const glf90w_joystick_9;
extern int const glf90w_joystick_10;
extern int const glf90w_joystick_11;
extern int const glf90w_joystick_12;
extern int const glf90w_joystick_13;
extern int const glf90w_joystick_14;
extern int const glf90w_joystick_15;
extern int const glf90w_joystick_16;
extern int const glf90w_joystick_last;
extern int const glf90w_gamepad_button_a;
extern int const glf90w_gamepad_button_b;
extern int const glf90w_gamepad_button_x;
extern int const glf90w_gamepad_button_y;
extern int const glf90w_gamepad_button_left_bumper;
extern int const glf90w_gamepad_button_right_bumper;
extern int const glf90w_gamepad_button_back;
extern int const glf90w_gamepad_button_start;
extern int const glf90w_gamepad_button_guide;
extern int const glf90w_gamepad_button_left_thumb;
extern int const glf90w_gamepad_button_right_thumb;
extern int const glf90w_gamepad_button_dpad_up;
extern int const glf90w_gamepad_button_dpad_right;
extern int const glf90w_gamepad_button_dpad_down;
extern int const glf90w_gamepad_button_dpad_left;
extern int const glf90w_gamepad_button_last;

extern int const glf90w_gamepad_button_cross;
extern int const glf90w_gamepad_button_circle;
extern int const glf90w_gamepad_button_square;
extern int const glf90w_gamepad_button_triangle;
extern int const glf90w_gamepad_axis_left_x;
extern int const glf90w_gamepad_axis_left_y;
extern int const glf90w_gamepad_axis_right_x;
extern int const glf90w_gamepad_axis_right_y;
extern int const glf90w_gamepad_axis_left_trigger;
extern int const glf90w_gamepad_axis_right_trigger;
extern int const glf90w_gamepad_axis_last;
extern int const glf90w_no_error;
extern int const glf90w_not_initialized;
extern int const glf90w_no_current_context;
extern int const glf90w_invalid_enum;
extern int const glf90w_invalid_value;
extern int const glf90w_out_of_memory;
extern int const glf90w_api_unavailable;
extern int const glf90w_version_unavailable;
extern int const glf90w_platform_error;
extern int const glf90w_format_unavailable;
extern int const glf90w_no_window_context;
extern int const glf90w_cursor_unavailable;
extern int const glf90w_feature_unavailable;
extern int const glf90w_feature_unimplemented;
extern int const glf90w_platform_unavailable;
extern int const glf90w_focused;
extern int const glf90w_iconified;
extern int const glf90w_resizable;
extern int const glf90w_visible;
extern int const glf90w_decorated;
extern int const glf90w_auto_iconify;
extern int const glf90w_floating;
extern int const glf90w_maximized;
extern int const glf90w_center_cursor;
extern int const glf90w_transparent_framebuffer;
extern int const glf90w_hovered;
extern int const glf90w_focus_on_show;

extern int const glf90w_mouse_passthrough;

extern int const glf90w_position_x;

extern int const glf90w_position_y;

extern int const glf90w_red_bits;
extern int const glf90w_green_bits;
extern int const glf90w_blue_bits;
extern int const glf90w_alpha_bits;
extern int const glf90w_depth_bits;
extern int const glf90w_stencil_bits;
extern int const glf90w_accum_red_bits;
extern int const glf90w_accum_green_bits;
extern int const glf90w_accum_blue_bits;
extern int const glf90w_accum_alpha_bits;
extern int const glf90w_aux_buffers;
extern int const glf90w_stereo;
extern int const glf90w_samples;
extern int const glf90w_srgb_capable;
extern int const glf90w_refresh_rate;
extern int const glf90w_doublebuffer;

extern int const glf90w_client_api;
extern int const glf90w_context_version_major;
extern int const glf90w_context_version_minor;
extern int const glf90w_context_revision;
extern int const glf90w_context_robustness;
extern int const glf90w_opengl_forward_compat;
extern int const glf90w_context_debug;
extern int const glf90w_opengl_debug_context;
extern int const glf90w_opengl_profile;
extern int const glf90w_context_release_behavior;
extern int const glf90w_context_no_error;
extern int const glf90w_context_creation_api;
extern int const glf90w_scale_to_monitor;
extern int const glf90w_scale_framebuffer;
extern int const glf90w_cocoa_retina_framebuffer;
extern int const glf90w_cocoa_frame_name;
extern int const glf90w_cocoa_graphics_switching;
extern int const glf90w_x11_class_name;
extern int const glf90w_x11_instance_name;
extern int const glf90w_win32_keyboard_menu;
extern int const glf90w_win32_showdefault;
extern int const glf90w_wayland_app_id;
extern int const glf90w_no_api;
extern int const glf90w_opengl_api;
extern int const glf90w_opengl_es_api;

extern int const glf90w_no_robustness;
extern int const glf90w_no_reset_notification;
extern int const glf90w_lose_context_on_reset;

extern int const glf90w_opengl_any_profile;
extern int const glf90w_opengl_core_profile;
extern int const glf90w_opengl_compat_profile;

extern int const glf90w_cursor;
extern int const glf90w_sticky_keys;
extern int const glf90w_sticky_mouse_buttons;
extern int const glf90w_lock_key_mods;
extern int const glf90w_raw_mouse_motion;

extern int const glf90w_cursor_normal;
extern int const glf90w_cursor_hidden;
extern int const glf90w_cursor_disabled;
extern int const glf90w_cursor_captured;

extern int const glf90w_any_release_behavior;
extern int const glf90w_release_behavior_flush;
extern int const glf90w_release_behavior_none;

extern int const glf90w_native_context_api;
extern int const glf90w_egl_context_api;
extern int const glf90w_osmesa_context_api;

extern int const glf90w_angle_platform_type_none;
extern int const glf90w_angle_platform_type_opengl;
extern int const glf90w_angle_platform_type_opengles;
extern int const glf90w_angle_platform_type_d3d9;
extern int const glf90w_angle_platform_type_d3d11;
extern int const glf90w_angle_platform_type_vulkan;
extern int const glf90w_angle_platform_type_metal;

extern int const glf90w_wayland_prefer_libdecor;
extern int const glf90w_wayland_disable_libdecor;

extern int const glf90w_any_position;

extern int const glf90w_arrow_cursor;
extern int const glf90w_ibeam_cursor;
extern int const glf90w_crosshair_cursor;
extern int const glf90w_pointing_hand_cursor;
extern int const glf90w_resize_ew_cursor;
extern int const glf90w_resize_ns_cursor;
extern int const glf90w_resize_nwse_cursor;
extern int const glf90w_resize_nesw_cursor;
extern int const glf90w_resize_all_cursor;
extern int const glf90w_not_allowed_cursor;
extern int const glf90w_hresize_cursor;
extern int const glf90w_vresize_cursor;
extern int const glf90w_hand_cursor;
extern int const glf90w_connected;
extern int const glf90w_disconnected;

extern int const glf90w_joystick_hat_buttons;
extern int const glf90w_angle_platform_type;
extern int const glf90w_platform;
extern int const glf90w_cocoa_chdir_resources;
extern int const glf90w_cocoa_menubar;
extern int const glf90w_x11_xcb_vulkan_surface;
extern int const glf90w_wayland_libdecor;
extern int const glf90w_any_platform;
extern int const glf90w_platform_win32;
extern int const glf90w_platform_cocoa;
extern int const glf90w_platform_wayland;
extern int const glf90w_platform_x11;
extern int const glf90w_platform_null;
extern int const glf90w_dont_care;

#endif // GLF90W_H
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

