!! ------------------
!!
!! GLF90W (for GLFW 3.4) - https://github.com/gadjalin/glf90w
!! Fortran 2008+ bindings for GLFW
!!
!! ------------------
!! glf90w.F90
!! 25 Feb 2024
!! Gaétan J.A.M. Jalin
!! See end of file for complete licence description
!! ------------------
module glf90w
    use, intrinsic :: iso_c_binding

    implicit none
    private
    save


    ! --------------------------------------------------------------------------
    ! GLFW API tokens
    ! --------------------------------------------------------------------------


    integer(kind=c_int), bind(C, name="glf90w_version_major"),                public :: GLFW_VERSION_MAJOR
    integer(kind=c_int), bind(C, name="glf90w_version_minor"),                public :: GLFW_VERSION_MINOR
    integer(kind=c_int), bind(C, name="glf90w_version_revision"),             public :: GLFW_VERSION_REVISION
    integer(kind=c_int), bind(C, name="glf90w_true"),                         public :: GLFW_TRUE
    integer(kind=c_int), bind(C, name="glf90w_false"),                        public :: GLFW_FALSE

    integer(kind=c_int), bind(C, name="glf90w_release"),                      public :: GLFW_RELEASE
    integer(kind=c_int), bind(C, name="glf90w_press"),                        public :: GLFW_PRESS
    integer(kind=c_int), bind(C, name="glf90w_repeat"),                       public :: GLFW_REPEAT
    integer(kind=c_int), bind(C, name="glf90w_hat_centered"),                 public :: GLFW_HAT_CENTERED
    integer(kind=c_int), bind(C, name="glf90w_hat_up"),                       public :: GLFW_HAT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_right"),                    public :: GLFW_HAT_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_hat_down"),                     public :: GLFW_HAT_DOWN
    integer(kind=c_int), bind(C, name="glf90w_hat_left"),                     public :: GLFW_HAT_LEFT
    integer(kind=c_int), bind(C, name="glf90w_hat_right_up"),                 public :: GLFW_HAT_RIGHT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_right_down"),               public :: GLFW_HAT_RIGHT_DOWN
    integer(kind=c_int), bind(C, name="glf90w_hat_left_up"),                  public :: GLFW_HAT_LEFT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_left_down"),                public :: GLFW_HAT_LEFT_DOWN

    integer(kind=c_int), bind(C, name="glf90w_key_unknown"),                  public :: GLFW_KEY_UNKNOWN

    integer(kind=c_int), bind(C, name="glf90w_key_space"),                    public :: GLFW_KEY_SPACE
    integer(kind=c_int), bind(C, name="glf90w_key_apostrophe"),               public :: GLFW_KEY_APOSTROPHE
    integer(kind=c_int), bind(C, name="glf90w_key_comma"),                    public :: GLFW_KEY_COMMA
    integer(kind=c_int), bind(C, name="glf90w_key_minus"),                    public :: GLFW_KEY_MINUS
    integer(kind=c_int), bind(C, name="glf90w_key_period"),                   public :: GLFW_KEY_PERIOD
    integer(kind=c_int), bind(C, name="glf90w_key_slash"),                    public :: GLFW_KEY_SLASH
    integer(kind=c_int), bind(C, name="glf90w_key_0"),                        public :: GLFW_KEY_0
    integer(kind=c_int), bind(C, name="glf90w_key_1"),                        public :: GLFW_KEY_1
    integer(kind=c_int), bind(C, name="glf90w_key_2"),                        public :: GLFW_KEY_2
    integer(kind=c_int), bind(C, name="glf90w_key_3"),                        public :: GLFW_KEY_3
    integer(kind=c_int), bind(C, name="glf90w_key_4"),                        public :: GLFW_KEY_4
    integer(kind=c_int), bind(C, name="glf90w_key_5"),                        public :: GLFW_KEY_5
    integer(kind=c_int), bind(C, name="glf90w_key_6"),                        public :: GLFW_KEY_6
    integer(kind=c_int), bind(C, name="glf90w_key_7"),                        public :: GLFW_KEY_7
    integer(kind=c_int), bind(C, name="glf90w_key_8"),                        public :: GLFW_KEY_8
    integer(kind=c_int), bind(C, name="glf90w_key_9"),                        public :: GLFW_KEY_9
    integer(kind=c_int), bind(C, name="glf90w_key_semicolon"),                public :: GLFW_KEY_SEMICOLON
    integer(kind=c_int), bind(C, name="glf90w_key_equal"),                    public :: GLFW_KEY_EQUAL
    integer(kind=c_int), bind(C, name="glf90w_key_a"),                        public :: GLFW_KEY_A
    integer(kind=c_int), bind(C, name="glf90w_key_b"),                        public :: GLFW_KEY_B
    integer(kind=c_int), bind(C, name="glf90w_key_c"),                        public :: GLFW_KEY_C
    integer(kind=c_int), bind(C, name="glf90w_key_d"),                        public :: GLFW_KEY_D
    integer(kind=c_int), bind(C, name="glf90w_key_e"),                        public :: GLFW_KEY_E
    integer(kind=c_int), bind(C, name="glf90w_key_f"),                        public :: GLFW_KEY_F
    integer(kind=c_int), bind(C, name="glf90w_key_g"),                        public :: GLFW_KEY_G
    integer(kind=c_int), bind(C, name="glf90w_key_h"),                        public :: GLFW_KEY_H
    integer(kind=c_int), bind(C, name="glf90w_key_i"),                        public :: GLFW_KEY_I
    integer(kind=c_int), bind(C, name="glf90w_key_j"),                        public :: GLFW_KEY_J
    integer(kind=c_int), bind(C, name="glf90w_key_k"),                        public :: GLFW_KEY_K
    integer(kind=c_int), bind(C, name="glf90w_key_l"),                        public :: GLFW_KEY_L
    integer(kind=c_int), bind(C, name="glf90w_key_m"),                        public :: GLFW_KEY_M
    integer(kind=c_int), bind(C, name="glf90w_key_n"),                        public :: GLFW_KEY_N
    integer(kind=c_int), bind(C, name="glf90w_key_o"),                        public :: GLFW_KEY_O
    integer(kind=c_int), bind(C, name="glf90w_key_p"),                        public :: GLFW_KEY_P
    integer(kind=c_int), bind(C, name="glf90w_key_q"),                        public :: GLFW_KEY_Q
    integer(kind=c_int), bind(C, name="glf90w_key_r"),                        public :: GLFW_KEY_R
    integer(kind=c_int), bind(C, name="glf90w_key_s"),                        public :: GLFW_KEY_S
    integer(kind=c_int), bind(C, name="glf90w_key_t"),                        public :: GLFW_KEY_T
    integer(kind=c_int), bind(C, name="glf90w_key_u"),                        public :: GLFW_KEY_U
    integer(kind=c_int), bind(C, name="glf90w_key_v"),                        public :: GLFW_KEY_V
    integer(kind=c_int), bind(C, name="glf90w_key_w"),                        public :: GLFW_KEY_W
    integer(kind=c_int), bind(C, name="glf90w_key_x"),                        public :: GLFW_KEY_X
    integer(kind=c_int), bind(C, name="glf90w_key_y"),                        public :: GLFW_KEY_Y
    integer(kind=c_int), bind(C, name="glf90w_key_z"),                        public :: GLFW_KEY_Z
    integer(kind=c_int), bind(C, name="glf90w_key_left_bracket"),             public :: GLFW_KEY_LEFT_BRACKET
    integer(kind=c_int), bind(C, name="glf90w_key_backslash"),                public :: GLFW_KEY_BACKSLASH
    integer(kind=c_int), bind(C, name="glf90w_key_right_bracket"),            public :: GLFW_KEY_RIGHT_BRACKET
    integer(kind=c_int), bind(C, name="glf90w_key_grave_accent"),             public :: GLFW_KEY_GRAVE_ACCENT
    integer(kind=c_int), bind(C, name="glf90w_key_world_1"),                  public :: GLFW_KEY_WORLD_1
    integer(kind=c_int), bind(C, name="glf90w_key_world_2"),                  public :: GLFW_KEY_WORLD_2

    integer(kind=c_int), bind(C, name="glf90w_key_escape"),                   public :: GLFW_KEY_ESCAPE
    integer(kind=c_int), bind(C, name="glf90w_key_enter"),                    public :: GLFW_KEY_ENTER
    integer(kind=c_int), bind(C, name="glf90w_key_tab"),                      public :: GLFW_KEY_TAB
    integer(kind=c_int), bind(C, name="glf90w_key_backspace"),                public :: GLFW_KEY_BACKSPACE
    integer(kind=c_int), bind(C, name="glf90w_key_insert"),                   public :: GLFW_KEY_INSERT
    integer(kind=c_int), bind(C, name="glf90w_key_delete"),                   public :: GLFW_KEY_DELETE
    integer(kind=c_int), bind(C, name="glf90w_key_right"),                    public :: GLFW_KEY_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_key_left"),                     public :: GLFW_KEY_LEFT
    integer(kind=c_int), bind(C, name="glf90w_key_down"),                     public :: GLFW_KEY_DOWN
    integer(kind=c_int), bind(C, name="glf90w_key_up"),                       public :: GLFW_KEY_UP
    integer(kind=c_int), bind(C, name="glf90w_key_page_up"),                  public :: GLFW_KEY_PAGE_UP
    integer(kind=c_int), bind(C, name="glf90w_key_page_down"),                public :: GLFW_KEY_PAGE_DOWN
    integer(kind=c_int), bind(C, name="glf90w_key_home"),                     public :: GLFW_KEY_HOME
    integer(kind=c_int), bind(C, name="glf90w_key_end"),                      public :: GLFW_KEY_END
    integer(kind=c_int), bind(C, name="glf90w_key_caps_lock"),                public :: GLFW_KEY_CAPS_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_scroll_lock"),              public :: GLFW_KEY_SCROLL_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_num_lock"),                 public :: GLFW_KEY_NUM_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_print_screen"),             public :: GLFW_KEY_PRINT_SCREEN
    integer(kind=c_int), bind(C, name="glf90w_key_pause"),                    public :: GLFW_KEY_PAUSE
    integer(kind=c_int), bind(C, name="glf90w_key_f1"),                       public :: GLFW_KEY_F1
    integer(kind=c_int), bind(C, name="glf90w_key_f2"),                       public :: GLFW_KEY_F2
    integer(kind=c_int), bind(C, name="glf90w_key_f3"),                       public :: GLFW_KEY_F3
    integer(kind=c_int), bind(C, name="glf90w_key_f4"),                       public :: GLFW_KEY_F4
    integer(kind=c_int), bind(C, name="glf90w_key_f5"),                       public :: GLFW_KEY_F5
    integer(kind=c_int), bind(C, name="glf90w_key_f6"),                       public :: GLFW_KEY_F6
    integer(kind=c_int), bind(C, name="glf90w_key_f7"),                       public :: GLFW_KEY_F7
    integer(kind=c_int), bind(C, name="glf90w_key_f8"),                       public :: GLFW_KEY_F8
    integer(kind=c_int), bind(C, name="glf90w_key_f9"),                       public :: GLFW_KEY_F9
    integer(kind=c_int), bind(C, name="glf90w_key_f10"),                      public :: GLFW_KEY_F10
    integer(kind=c_int), bind(C, name="glf90w_key_f11"),                      public :: GLFW_KEY_F11
    integer(kind=c_int), bind(C, name="glf90w_key_f12"),                      public :: GLFW_KEY_F12
    integer(kind=c_int), bind(C, name="glf90w_key_f13"),                      public :: GLFW_KEY_F13
    integer(kind=c_int), bind(C, name="glf90w_key_f14"),                      public :: GLFW_KEY_F14
    integer(kind=c_int), bind(C, name="glf90w_key_f15"),                      public :: GLFW_KEY_F15
    integer(kind=c_int), bind(C, name="glf90w_key_f16"),                      public :: GLFW_KEY_F16
    integer(kind=c_int), bind(C, name="glf90w_key_f17"),                      public :: GLFW_KEY_F17
    integer(kind=c_int), bind(C, name="glf90w_key_f18"),                      public :: GLFW_KEY_F18
    integer(kind=c_int), bind(C, name="glf90w_key_f19"),                      public :: GLFW_KEY_F19
    integer(kind=c_int), bind(C, name="glf90w_key_f20"),                      public :: GLFW_KEY_F20
    integer(kind=c_int), bind(C, name="glf90w_key_f21"),                      public :: GLFW_KEY_F21
    integer(kind=c_int), bind(C, name="glf90w_key_f22"),                      public :: GLFW_KEY_F22
    integer(kind=c_int), bind(C, name="glf90w_key_f23"),                      public :: GLFW_KEY_F23
    integer(kind=c_int), bind(C, name="glf90w_key_f24"),                      public :: GLFW_KEY_F24
    integer(kind=c_int), bind(C, name="glf90w_key_f25"),                      public :: GLFW_KEY_F25
    integer(kind=c_int), bind(C, name="glf90w_key_kp_0"),                     public :: GLFW_KEY_KP_0
    integer(kind=c_int), bind(C, name="glf90w_key_kp_1"),                     public :: GLFW_KEY_KP_1
    integer(kind=c_int), bind(C, name="glf90w_key_kp_2"),                     public :: GLFW_KEY_KP_2
    integer(kind=c_int), bind(C, name="glf90w_key_kp_3"),                     public :: GLFW_KEY_KP_3
    integer(kind=c_int), bind(C, name="glf90w_key_kp_4"),                     public :: GLFW_KEY_KP_4
    integer(kind=c_int), bind(C, name="glf90w_key_kp_5"),                     public :: GLFW_KEY_KP_5
    integer(kind=c_int), bind(C, name="glf90w_key_kp_6"),                     public :: GLFW_KEY_KP_6
    integer(kind=c_int), bind(C, name="glf90w_key_kp_7"),                     public :: GLFW_KEY_KP_7
    integer(kind=c_int), bind(C, name="glf90w_key_kp_8"),                     public :: GLFW_KEY_KP_8
    integer(kind=c_int), bind(C, name="glf90w_key_kp_9"),                     public :: GLFW_KEY_KP_9
    integer(kind=c_int), bind(C, name="glf90w_key_kp_decimal"),               public :: GLFW_KEY_KP_DECIMAL
    integer(kind=c_int), bind(C, name="glf90w_key_kp_divide"),                public :: GLFW_KEY_KP_DIVIDE
    integer(kind=c_int), bind(C, name="glf90w_key_kp_multiply"),              public :: GLFW_KEY_KP_MULTIPLY
    integer(kind=c_int), bind(C, name="glf90w_key_kp_subtract"),              public :: GLFW_KEY_KP_SUBTRACT
    integer(kind=c_int), bind(C, name="glf90w_key_kp_add"),                   public :: GLFW_KEY_KP_ADD
    integer(kind=c_int), bind(C, name="glf90w_key_kp_enter"),                 public :: GLFW_KEY_KP_ENTER
    integer(kind=c_int), bind(C, name="glf90w_key_kp_equal"),                 public :: GLFW_KEY_KP_EQUAL
    integer(kind=c_int), bind(C, name="glf90w_key_left_shift"),               public :: GLFW_KEY_LEFT_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_key_left_control"),             public :: GLFW_KEY_LEFT_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_key_left_alt"),                 public :: GLFW_KEY_LEFT_ALT
    integer(kind=c_int), bind(C, name="glf90w_key_left_super"),               public :: GLFW_KEY_LEFT_SUPER
    integer(kind=c_int), bind(C, name="glf90w_key_right_shift"),              public :: GLFW_KEY_RIGHT_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_key_right_control"),            public :: GLFW_KEY_RIGHT_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_key_right_alt"),                public :: GLFW_KEY_RIGHT_ALT
    integer(kind=c_int), bind(C, name="glf90w_key_right_super"),              public :: GLFW_KEY_RIGHT_SUPER
    integer(kind=c_int), bind(C, name="glf90w_key_menu"),                     public :: GLFW_KEY_MENU

    integer(kind=c_int), bind(C, name="glf90w_key_last"),                     public :: GLFW_KEY_LAST

    integer(kind=c_int), bind(C, name="glf90w_mod_shift"),                    public :: GLFW_MOD_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_mod_control"),                  public :: GLFW_MOD_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_mod_alt"),                      public :: GLFW_MOD_ALT
    integer(kind=c_int), bind(C, name="glf90w_mod_super"),                    public :: GLFW_MOD_SUPER
    integer(kind=c_int), bind(C, name="glf90w_mod_caps_lock"),                public :: GLFW_MOD_CAPS_LOCK
    integer(kind=c_int), bind(C, name="glf90w_mod_num_lock"),                 public :: GLFW_MOD_NUM_LOCK

    integer(kind=c_int), bind(C, name="glf90w_mouse_button_1"),               public :: GLFW_MOUSE_BUTTON_1
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_2"),               public :: GLFW_MOUSE_BUTTON_2
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_3"),               public :: GLFW_MOUSE_BUTTON_3
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_4"),               public :: GLFW_MOUSE_BUTTON_4
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_5"),               public :: GLFW_MOUSE_BUTTON_5
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_6"),               public :: GLFW_MOUSE_BUTTON_6
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_7"),               public :: GLFW_MOUSE_BUTTON_7
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_8"),               public :: GLFW_MOUSE_BUTTON_8
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_last"),            public :: GLFW_MOUSE_BUTTON_LAST
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_left"),            public :: GLFW_MOUSE_BUTTON_LEFT
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_right"),           public :: GLFW_MOUSE_BUTTON_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_middle"),          public :: GLFW_MOUSE_BUTTON_MIDDLE
    integer(kind=c_int), bind(C, name="glf90w_joystick_1"),                   public :: GLFW_JOYSTICK_1
    integer(kind=c_int), bind(C, name="glf90w_joystick_2"),                   public :: GLFW_JOYSTICK_2
    integer(kind=c_int), bind(C, name="glf90w_joystick_3"),                   public :: GLFW_JOYSTICK_3
    integer(kind=c_int), bind(C, name="glf90w_joystick_4"),                   public :: GLFW_JOYSTICK_4
    integer(kind=c_int), bind(C, name="glf90w_joystick_5"),                   public :: GLFW_JOYSTICK_5
    integer(kind=c_int), bind(C, name="glf90w_joystick_6"),                   public :: GLFW_JOYSTICK_6
    integer(kind=c_int), bind(C, name="glf90w_joystick_7"),                   public :: GLFW_JOYSTICK_7
    integer(kind=c_int), bind(C, name="glf90w_joystick_8"),                   public :: GLFW_JOYSTICK_8
    integer(kind=c_int), bind(C, name="glf90w_joystick_9"),                   public :: GLFW_JOYSTICK_9
    integer(kind=c_int), bind(C, name="glf90w_joystick_10"),                  public :: GLFW_JOYSTICK_10
    integer(kind=c_int), bind(C, name="glf90w_joystick_11"),                  public :: GLFW_JOYSTICK_11
    integer(kind=c_int), bind(C, name="glf90w_joystick_12"),                  public :: GLFW_JOYSTICK_12
    integer(kind=c_int), bind(C, name="glf90w_joystick_13"),                  public :: GLFW_JOYSTICK_13
    integer(kind=c_int), bind(C, name="glf90w_joystick_14"),                  public :: GLFW_JOYSTICK_14
    integer(kind=c_int), bind(C, name="glf90w_joystick_15"),                  public :: GLFW_JOYSTICK_15
    integer(kind=c_int), bind(C, name="glf90w_joystick_16"),                  public :: GLFW_JOYSTICK_16
    integer(kind=c_int), bind(C, name="glf90w_joystick_last"),                public :: GLFW_JOYSTICK_LAST
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_a"),             public :: GLFW_GAMEPAD_BUTTON_A
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_b"),             public :: GLFW_GAMEPAD_BUTTON_B
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_x"),             public :: GLFW_GAMEPAD_BUTTON_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_y"),             public :: GLFW_GAMEPAD_BUTTON_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_left_bumper"),   public :: GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_right_bumper"),  public :: GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_back"),          public :: GLFW_GAMEPAD_BUTTON_BACK
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_start"),         public :: GLFW_GAMEPAD_BUTTON_START
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_guide"),         public :: GLFW_GAMEPAD_BUTTON_GUIDE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_left_thumb"),    public :: GLFW_GAMEPAD_BUTTON_LEFT_THUMB
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_right_thumb"),   public :: GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_up"),       public :: GLFW_GAMEPAD_BUTTON_DPAD_UP
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_right"),    public :: GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_down"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_DOWN
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_left"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_LEFT
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_last"),          public :: GLFW_GAMEPAD_BUTTON_LAST

    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_cross"),         public :: GLFW_GAMEPAD_BUTTON_CROSS
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_circle"),        public :: GLFW_GAMEPAD_BUTTON_CIRCLE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_square"),        public :: GLFW_GAMEPAD_BUTTON_SQUARE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_triangle"),      public :: GLFW_GAMEPAD_BUTTON_TRIANGLE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_x"),          public :: GLFW_GAMEPAD_AXIS_LEFT_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_y"),          public :: GLFW_GAMEPAD_AXIS_LEFT_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_x"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_y"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_trigger"),    public :: GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_trigger"),   public :: GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_last"),            public :: GLFW_GAMEPAD_AXIS_LAST
    integer(kind=c_int), bind(C, name="glf90w_no_error"),                     public :: GLFW_NO_ERROR
    integer(kind=c_int), bind(C, name="glf90w_not_initialized"),              public :: GLFW_NOT_INITIALIZED
    integer(kind=c_int), bind(C, name="glf90w_no_current_context"),           public :: GLFW_NO_CURRENT_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_invalid_enum"),                 public :: GLFW_INVALID_ENUM
    integer(kind=c_int), bind(C, name="glf90w_invalid_value"),                public :: GLFW_INVALID_VALUE
    integer(kind=c_int), bind(C, name="glf90w_out_of_memory"),                public :: GLFW_OUT_OF_MEMORY
    integer(kind=c_int), bind(C, name="glf90w_api_unavailable"),              public :: GLFW_API_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_version_unavailable"),          public :: GLFW_VERSION_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_platform_error"),               public :: GLFW_PLATFORM_ERROR
    integer(kind=c_int), bind(C, name="glf90w_format_unavailable"),           public :: GLFW_FORMAT_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_no_window_context"),            public :: GLFW_NO_WINDOW_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_cursor_unavailable"),           public :: GLFW_CURSOR_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_feature_unavailable"),          public :: GLFW_FEATURE_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_feature_unimplemented"),        public :: GLFW_FEATURE_UNIMPLEMENTED
    integer(kind=c_int), bind(C, name="glf90w_platform_unavailable"),         public :: GLFW_PLATFORM_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_focused"),                      public :: GLFW_FOCUSED
    integer(kind=c_int), bind(C, name="glf90w_iconified"),                    public :: GLFW_ICONIFIED
    integer(kind=c_int), bind(C, name="glf90w_resizable"),                    public :: GLFW_RESIZABLE
    integer(kind=c_int), bind(C, name="glf90w_visible"),                      public :: GLFW_VISIBLE
    integer(kind=c_int), bind(C, name="glf90w_decorated"),                    public :: GLFW_DECORATED
    integer(kind=c_int), bind(C, name="glf90w_auto_iconify"),                 public :: GLFW_AUTO_ICONIFY
    integer(kind=c_int), bind(C, name="glf90w_floating"),                     public :: GLFW_FLOATING
    integer(kind=c_int), bind(C, name="glf90w_maximized"),                    public :: GLFW_MAXIMIZED
    integer(kind=c_int), bind(C, name="glf90w_center_cursor"),                public :: GLFW_CENTER_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_transparent_framebuffer"),      public :: GLFW_TRANSPARENT_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_hovered"),                      public :: GLFW_HOVERED
    integer(kind=c_int), bind(C, name="glf90w_focus_on_show"),                public :: GLFW_FOCUS_ON_SHOW

    integer(kind=c_int), bind(C, name="glf90w_mouse_passthrough"),            public :: GLFW_MOUSE_PASSTHROUGH

    integer(kind=c_int), bind(C, name="glf90w_position_x"),                   public :: GLFW_POSITION_X
    integer(kind=c_int), bind(C, name="glf90w_position_y"),                   public :: GLFW_POSITION_Y

    integer(kind=c_int), bind(C, name="glf90w_red_bits"),                     public :: GLFW_RED_BITS
    integer(kind=c_int), bind(C, name="glf90w_green_bits"),                   public :: GLFW_GREEN_BITS
    integer(kind=c_int), bind(C, name="glf90w_blue_bits"),                    public :: GLFW_BLUE_BITS
    integer(kind=c_int), bind(C, name="glf90w_alpha_bits"),                   public :: GLFW_ALPHA_BITS
    integer(kind=c_int), bind(C, name="glf90w_depth_bits"),                   public :: GLFW_DEPTH_BITS
    integer(kind=c_int), bind(C, name="glf90w_stencil_bits"),                 public :: GLFW_STENCIL_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_red_bits"),               public :: GLFW_ACCUM_RED_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_green_bits"),             public :: GLFW_ACCUM_GREEN_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_blue_bits"),              public :: GLFW_ACCUM_BLUE_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_alpha_bits"),             public :: GLFW_ACCUM_ALPHA_BITS
    integer(kind=c_int), bind(C, name="glf90w_aux_buffers"),                  public :: GLFW_AUX_BUFFERS
    integer(kind=c_int), bind(C, name="glf90w_stereo"),                       public :: GLFW_STEREO
    integer(kind=c_int), bind(C, name="glf90w_samples"),                      public :: GLFW_SAMPLES
    integer(kind=c_int), bind(C, name="glf90w_srgb_capable"),                 public :: GLFW_SRGB_CAPABLE
    integer(kind=c_int), bind(C, name="glf90w_refresh_rate"),                 public :: GLFW_REFRESH_RATE
    integer(kind=c_int), bind(C, name="glf90w_doublebuffer"),                 public :: GLFW_DOUBLEBUFFER

    integer(kind=c_int), bind(C, name="glf90w_client_api"),                   public :: GLFW_CLIENT_API
    integer(kind=c_int), bind(C, name="glf90w_context_version_major"),        public :: GLFW_CONTEXT_VERSION_MAJOR
    integer(kind=c_int), bind(C, name="glf90w_context_version_minor"),        public :: GLFW_CONTEXT_VERSION_MINOR
    integer(kind=c_int), bind(C, name="glf90w_context_revision"),             public :: GLFW_CONTEXT_REVISION
    integer(kind=c_int), bind(C, name="glf90w_context_robustness"),           public :: GLFW_CONTEXT_ROBUSTNESS
    integer(kind=c_int), bind(C, name="glf90w_opengl_forward_compat"),        public :: GLFW_OPENGL_FORWARD_COMPAT
    integer(kind=c_int), bind(C, name="glf90w_context_debug"),                public :: GLFW_CONTEXT_DEBUG
    integer(kind=c_int), bind(C, name="glf90w_opengl_debug_context"),         public :: GLFW_OPENGL_DEBUG_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_opengl_profile"),               public :: GLFW_OPENGL_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_context_release_behavior"),     public :: GLFW_CONTEXT_RELEASE_BEHAVIOR
    integer(kind=c_int), bind(C, name="glf90w_context_no_error"),             public :: GLFW_CONTEXT_NO_ERROR
    integer(kind=c_int), bind(C, name="glf90w_context_creation_api"),         public :: GLFW_CONTEXT_CREATION_API
    integer(kind=c_int), bind(C, name="glf90w_scale_to_monitor"),             public :: GLFW_SCALE_TO_MONITOR
    integer(kind=c_int), bind(C, name="glf90w_scale_framebuffer"),            public :: GLFW_SCALE_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_cocoa_retina_framebuffer"),     public :: GLFW_COCOA_RETINA_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_cocoa_frame_name"),             public :: GLFW_COCOA_FRAME_NAME
    integer(kind=c_int), bind(C, name="glf90w_cocoa_graphics_switching"),     public :: GLFW_COCOA_GRAPHICS_SWITCHING
    integer(kind=c_int), bind(C, name="glf90w_x11_class_name"),               public :: GLFW_X11_CLASS_NAME
    integer(kind=c_int), bind(C, name="glf90w_x11_instance_name"),            public :: GLFW_X11_INSTANCE_NAME
    integer(kind=c_int), bind(C, name="glf90w_win32_keyboard_menu"),          public :: GLFW_WIN32_KEYBOARD_MENU
    integer(kind=c_int), bind(C, name="glf90w_win32_showdefault"),            public :: GLFW_WIN32_SHOWDEFAULT
    integer(kind=c_int), bind(C, name="glf90w_wayland_app_id"),               public :: GLFW_WAYLAND_APP_ID
    integer(kind=c_int), bind(C, name="glf90w_no_api"),                       public :: GLFW_NO_API
    integer(kind=c_int), bind(C, name="glf90w_opengl_api"),                   public :: GLFW_OPENGL_API
    integer(kind=c_int), bind(C, name="glf90w_opengl_es_api"),                public :: GLFW_OPENGL_ES_API

    integer(kind=c_int), bind(C, name="glf90w_no_robustness"),                public :: GLFW_NO_ROBUSTNESS
    integer(kind=c_int), bind(C, name="glf90w_no_reset_notification"),        public :: GLFW_NO_RESET_NOTIFICATION
    integer(kind=c_int), bind(C, name="glf90w_lose_context_on_reset"),        public :: GLFW_LOSE_CONTEXT_ON_RESET

    integer(kind=c_int), bind(C, name="glf90w_opengl_any_profile"),           public :: GLFW_OPENGL_ANY_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_opengl_core_profile"),          public :: GLFW_OPENGL_CORE_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_opengl_compat_profile"),        public :: GLFW_OPENGL_COMPAT_PROFILE

    integer(kind=c_int), bind(C, name="glf90w_cursor"),                       public :: GLFW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_sticky_keys"),                  public :: GLFW_STICKY_KEYS
    integer(kind=c_int), bind(C, name="glf90w_sticky_mouse_buttons"),         public :: GLFW_STICKY_MOUSE_BUTTONS
    integer(kind=c_int), bind(C, name="glf90w_lock_key_mods"),                public :: GLFW_LOCK_KEY_MODS
    integer(kind=c_int), bind(C, name="glf90w_raw_mouse_motion"),             public :: GLFW_RAW_MOUSE_MOTION

    integer(kind=c_int), bind(C, name="glf90w_cursor_normal"),                public :: GLFW_CURSOR_NORMAL
    integer(kind=c_int), bind(C, name="glf90w_cursor_hidden"),                public :: GLFW_CURSOR_HIDDEN
    integer(kind=c_int), bind(C, name="glf90w_cursor_disabled"),              public :: GLFW_CURSOR_DISABLED
    integer(kind=c_int), bind(C, name="glf90w_cursor_captured"),              public :: GLFW_CURSOR_CAPTURED

    integer(kind=c_int), bind(C, name="glf90w_any_release_behavior"),         public :: GLFW_ANY_RELEASE_BEHAVIOR
    integer(kind=c_int), bind(C, name="glf90w_release_behavior_flush"),       public :: GLFW_RELEASE_BEHAVIOR_FLUSH
    integer(kind=c_int), bind(C, name="glf90w_release_behavior_none"),        public :: GLFW_RELEASE_BEHAVIOR_NONE

    integer(kind=c_int), bind(C, name="glf90w_native_context_api"),           public :: GLFW_NATIVE_CONTEXT_API
    integer(kind=c_int), bind(C, name="glf90w_egl_context_api"),              public :: GLFW_EGL_CONTEXT_API
    integer(kind=c_int), bind(C, name="glf90w_osmesa_context_api"),           public :: GLFW_OSMESA_CONTEXT_API

    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_none"),     public :: GLFW_ANGLE_PLATFORM_TYPE_NONE
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_opengl"),   public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGL
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_opengles"), public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_d3d9"),     public :: GLFW_ANGLE_PLATFORM_TYPE_D3D9
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_d3d11"),    public :: GLFW_ANGLE_PLATFORM_TYPE_D3D11
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_vulkan"),   public :: GLFW_ANGLE_PLATFORM_TYPE_VULKAN
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_metal"),    public :: GLFW_ANGLE_PLATFORM_TYPE_METAL

    integer(kind=c_int), bind(C, name="glf90w_wayland_prefer_libdecor"),      public :: GLFW_WAYLAND_PREFER_LIBDECOR
    integer(kind=c_int), bind(C, name="glf90w_wayland_disable_libdecor"),     public :: GLFW_WAYLAND_DISABLE_LIBDECOR

    integer(kind=c_int), bind(C, name="glf90w_any_position"),                 public :: GLFW_ANY_POSITION

    integer(kind=c_int), bind(C, name="glf90w_arrow_cursor"),                 public :: GLFW_ARROW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_ibeam_cursor"),                 public :: GLFW_IBEAM_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_crosshair_cursor"),             public :: GLFW_CROSSHAIR_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_pointing_hand_cursor"),         public :: GLFW_POINTING_HAND_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_ew_cursor"),             public :: GLFW_RESIZE_EW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_ns_cursor"),             public :: GLFW_RESIZE_NS_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_nwse_cursor"),           public :: GLFW_RESIZE_NWSE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_nesw_cursor"),           public :: GLFW_RESIZE_NESW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_all_cursor"),            public :: GLFW_RESIZE_ALL_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_not_allowed_cursor"),           public :: GLFW_NOT_ALLOWED_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_hresize_cursor"),               public :: GLFW_HRESIZE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_vresize_cursor"),               public :: GLFW_VRESIZE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_hand_cursor"),                  public :: GLFW_HAND_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_connected"),                    public :: GLFW_CONNECTED
    integer(kind=c_int), bind(C, name="glf90w_disconnected"),                 public :: GLFW_DISCONNECTED

    integer(kind=c_int), bind(C, name="glf90w_joystick_hat_buttons"),         public :: GLFW_JOYSTICK_HAT_BUTTONS
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type"),          public :: GLFW_ANGLE_PLATFORM_TYPE
    integer(kind=c_int), bind(C, name="glf90w_platform"),                     public :: GLFW_PLATFORM
    integer(kind=c_int), bind(C, name="glf90w_cocoa_chdir_resources"),        public :: GLFW_COCOA_CHDIR_RESOURCES
    integer(kind=c_int), bind(C, name="glf90w_cocoa_menubar"),                public :: GLFW_COCOA_MENUBAR
    integer(kind=c_int), bind(C, name="glf90w_x11_xcb_vulkan_surface"),       public :: GLFW_X11_XCB_VULKAN_SURFACE
    integer(kind=c_int), bind(C, name="glf90w_wayland_libdecor"),             public :: GLFW_WAYLAND_LIBDECOR
    integer(kind=c_int), bind(C, name="glf90w_any_platform"),                 public :: GLFW_ANY_PLATFORM
    integer(kind=c_int), bind(C, name="glf90w_platform_win32"),               public :: GLFW_PLATFORM_WIN32
    integer(kind=c_int), bind(C, name="glf90w_platform_cocoa"),               public :: GLFW_PLATFORM_COCOA
    integer(kind=c_int), bind(C, name="glf90w_platform_wayland"),             public :: GLFW_PLATFORM_WAYLAND
    integer(kind=c_int), bind(C, name="glf90w_platform_x11"),                 public :: GLFW_PLATFORM_X11
    integer(kind=c_int), bind(C, name="glf90w_platform_null"),                public :: GLFW_PLATFORM_NULL
    integer(kind=c_int), bind(C, name="glf90w_dont_care"),                    public :: GLFW_DONT_CARE


    ! --------------------------------------------------------------------------
    ! GLF90W API types
    ! --------------------------------------------------------------------------


    public :: associated

    type, abstract :: c_opaque_ptr
        type(c_ptr) :: handle = c_null_ptr
    end type c_opaque_ptr

    type, bind(C) :: c_GLFWallocator
        type(c_funptr) :: allocate_fn   = c_null_funptr
        type(c_funptr) :: reallocate_fn = c_null_funptr
        type(c_funptr) :: deallocate_fn = c_null_funptr
        type(c_ptr)    :: user          = c_null_ptr
    end type c_GLFWallocator

    type :: GLF90Wwindow
        private
        type(c_ptr), public :: handle = c_null_ptr
        type(GLF90Wwindow), pointer :: next => null()
        procedure(GLFWwindowposfun),          pointer, nopass :: pos              => null()
        procedure(GLFWwindowsizefun),         pointer, nopass :: size             => null()
        procedure(GLFWwindowclosefun),        pointer, nopass :: close            => null()
        procedure(GLFWwindowrefreshfun),      pointer, nopass :: refresh          => null()
        procedure(GLFWwindowfocusfun),        pointer, nopass :: focus            => null()
        procedure(GLFWwindowiconifyfun),      pointer, nopass :: iconify          => null()
        procedure(GLFWwindowmaximizefun),     pointer, nopass :: maximize         => null()
        procedure(GLFWframebuffersizefun),    pointer, nopass :: framebuffer_size => null()
        procedure(GLFWwindowcontentscalefun), pointer, nopass :: content_scale    => null()
        procedure(GLFWmousebuttonfun),        pointer, nopass :: mouse            => null()
        procedure(GLFWcursorposfun),          pointer, nopass :: cursor_pos       => null()
        procedure(GLFWcursorenterfun),        pointer, nopass :: cursor_enter     => null()
        procedure(GLFWscrollfun),             pointer, nopass :: scroll           => null()
        procedure(GLFWkeyfun),                pointer, nopass :: key              => null()
        procedure(GLFWcharfun),               pointer, nopass :: char             => null()
        procedure(GLFWcharmodsfun),           pointer, nopass :: mods             => null()
        procedure(GLFWdropfun),               pointer, nopass :: drop             => null()
    end type GLF90Wwindow

    interface associated
        module procedure associated_opaque, associated_window
    end interface associated


    ! --------------------------------------------------------------------------
    ! GLFW API types
    ! --------------------------------------------------------------------------


    type, extends(c_opaque_ptr), public :: GLFWmonitor
    end type GLFWmonitor

    type, public :: GLFWwindow
        type(GLF90Wwindow), pointer :: handle => null()
    end type GLFWwindow

    type, extends(c_opaque_ptr), public :: GLFWcursor
    end type GLFWcursor

    public :: &
        ! -- typedef void* (*GLFWallocatefun)(size_t size, void* user)
        GLFWallocatefun, &
        ! -- typedef void* (*GLFWreallocatefun)(void* block, size_t size, void* user)
        GLFWreallocatefun, &
        ! -- typedef void (*GLFWdeallocatefun)(void* block, void* user)
        GLFWdeallocatefun, &
        ! -- typedef void (*GLFWerrorfun)(int error_code, char description)
        GLFWerrorfun, &
        ! -- typedef void (*GLFWwindowposfun)(GLFWwindow window, int x, int y)
        GLFWwindowposfun, &
        ! -- typedef void (*GLFWwindowsizefun)(GLFWwindow window, int x, int y)
        GLFWwindowsizefun, &
        ! -- typedef void (*GLFWwindowclosefun)(GLFWwindow window);
        GLFWwindowclosefun, &
        ! -- typedef void (*GLFWwindowrefreshfun)(GLFWwindow window);
        GLFWwindowrefreshfun, &
        ! -- typedef void (*GLFWwindowfocusfun)(GLFWwindow window, int focused);
        GLFWwindowfocusfun, &
        ! -- typedef void (*GLFWwindowiconifyfun)(GLFWwindow window, int iconified);
        GLFWwindowiconifyfun, &
        ! -- typedef void (*GLFWwindowmaximizefun)(GLFWwindow window, int maximized);
        GLFWwindowmaximizefun, &
        ! -- typedef void (*GLFWframebuffersizefun)(GLFWwindow window, int width, int height);
        GLFWframebuffersizefun, &
        ! -- typedef void (*GLFWwindowcontentscalefun)(GLFWwindow window, float xscale, float yscale);
        GLFWwindowcontentscalefun, &
        ! -- typedef void (*GLFWmousebuttonfun)(GLFWwindow window, int button, int action, int mods);
        GLFWmousebuttonfun, &
        ! -- typedef void (*GLFWcursorposfun)(GLFWwindow window, double xpos, double ypos);
        GLFWcursorposfun, &
        ! -- typedef void (*GLFWcursorenterfun)(GLFWwindow window, int entered);
        GLFWcursorenterfun, &
        ! -- typedef void (*GLFWscrollfun)(GLFWwindow window, double xoffset, double yoffset);
        GLFWscrollfun, &
        ! -- typedef void (*GLFWkeyfun)(GLFWwindow window, int key, int scancode, int action, int mods);
        GLFWkeyfun, &
        ! -- typedef void (*GLFWcharfun)(GLFWwindow window, unsigned int codepoint);
        GLFWcharfun, &
        ! -- typedef void (*GLFWcharmodsfun)(GLFWwindow window, unsigned int codepoint, int mods);
        GLFWcharmodsfun, &
        ! -- typedef void (*GLFWdropfun)(GLFWwindow window, int path_count, const char* paths[]);
        GLFWdropfun, &
        ! -- typedef void (*GLFWmonitorfun)(GLFWmonitor IN monitor, int IN description)
        GLFWmonitorfun, &
        ! -- typedef void (*GLFWjoystickfun)(int IN jid, int IN event)
        GLFWjoystickfun

    type, bind(C), public :: GLFWvidmode
        integer(kind=c_int) :: width
        integer(kind=c_int) :: height
        integer(kind=c_int) :: redBits
        integer(kind=c_int) :: greenBits
        integer(kind=c_int) :: blueBits
        integer(kind=c_int) :: refreshRate
    end type GLFWvidmode

    ! TODO Those are supposed to be "unsigned short*", leaving it to the user for now...
    !      But should make a wrapper
    type, bind(C), public :: GLFWgammaramp
        type(c_ptr) :: red
        type(c_ptr) :: green
        type(c_ptr) :: blue
        integer(kind=c_int) :: size
    end type GLFWgammaramp

    ! TODO pixels is supposed to be "unsigned char*", maybe make a cleaner wrapper like
    !
    ! type, public :: GLFWimage(width, height)
    !   integer(kind=c_int), len :: width, height
    !   character(kind=c_char), dimension(:), pointer :: pixels
    ! end type GLFWimage
    !
    ! or something
    type, bind(C), public :: GLFWimage
        integer(kind=c_int) :: width
        integer(kind=c_int) :: height
        type(c_ptr) :: pixels
    end type GLFWimage

    type, bind(C), public :: GLFWgamepadstate
        character(kind=c_char), dimension(15) :: buttons ! NOTE Not sure if integer(c_signed_char) would be better
        real(kind=c_float),     dimension(6)  :: axes
    end type GLFWgamepadstate

    type, public :: GLFWallocator
        procedure(GLFWallocatefun),   pointer, nopass :: allocate_fn   => null()
        procedure(GLFWreallocatefun), pointer, nopass :: reallocate_fn => null()
        procedure(GLFWdeallocatefun), pointer, nopass :: deallocate_fn => null()
        type(c_ptr)                                   :: user          =  c_null_ptr
    end type GLFWallocator


    ! --------------------------------------------------------------------------
    ! GLF90W API abstract interfaces
    ! --------------------------------------------------------------------------


    abstract interface
        function GLFWallocatefun(blckSize, user) result(blck) bind(C)
            import
            implicit none
            integer(kind=c_size_t), intent(in) :: blckSize
            type(c_ptr),            intent(in) :: user
            type(c_ptr)                        :: blck
        end function GLFWallocatefun

        function GLFWreallocatefun(blck, blckSize, user) result(reblck) bind(C)
            import
            implicit none
            type(c_ptr),            intent(in) :: blck
            integer(kind=c_size_t), intent(in) :: blckSize
            type(c_ptr),            intent(in) :: user
            type(c_ptr)                        :: reblck
        end function GLFWreallocatefun

        subroutine GLFWdeallocatefun(blck, user) bind(C)
            import
            implicit none
            type(c_ptr), intent(in) :: blck
            type(c_ptr), intent(in) :: user
        end subroutine GLFWdeallocatefun
    end interface

    abstract interface
        subroutine GLFWerrorfun(error_code, description)
            import
            implicit none
            integer(kind=c_int),           intent(in) :: error_code
            character(len=*, kind=c_char), intent(in) :: description
        end subroutine GLFWerrorfun

        subroutine GLFWwindowposfun(window, x, y)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: x, y
        end subroutine GLFWwindowposfun

        subroutine GLFWwindowsizefun(window, width, height)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: width, height
        end subroutine GLFWwindowsizefun

        subroutine GLFWwindowclosefun(window)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
        end subroutine GLFWwindowclosefun

        subroutine GLFWwindowrefreshfun(window)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
        end subroutine GLFWwindowrefreshfun

        subroutine GLFWwindowfocusfun(window, focused)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical,          intent(in) :: focused
        end subroutine GLFWwindowfocusfun

        subroutine GLFWwindowiconifyfun(window, iconified)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical,          intent(in) :: iconified
        end subroutine GLFWwindowiconifyfun

        subroutine GLFWwindowmaximizefun(window, maximized)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical,          intent(in) :: maximized
        end subroutine GLFWwindowmaximizefun

        subroutine GLFWframebuffersizefun(window, width, height)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: width, height
        end subroutine GLFWframebuffersizefun

        subroutine GLFWwindowcontentscalefun(window, xscale, yscale)
            import
            implicit none
            type(GLFWwindow),   intent(in) :: window
            real(kind=c_float), intent(in) :: xscale, yscale
        end subroutine GLFWwindowcontentscalefun

        subroutine GLFWmousebuttonfun(window, button, action, mods)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: button, action, mods
        end subroutine GLFWmousebuttonfun

        subroutine GLFWcursorposfun(window, x, y)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            real(kind=c_double), intent(in) :: x, y
        end subroutine GLFWcursorposfun

        subroutine GLFWcursorenterfun(window, entered)
            import
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical,          intent(in) :: entered
        end subroutine GLFWcursorenterfun

        subroutine GLFWscrollfun(window, xoffset, yoffset)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            real(kind=c_double), intent(in) :: xoffset, yoffset
        end subroutine GLFWscrollfun

        subroutine GLFWkeyfun(window, key, scancode, action, mods)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: key, scancode, action, mods
        end subroutine GLFWkeyfun

        subroutine GLFWcharfun(window, codepoint)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: codepoint ! NOTE This is supposed to be unsigned int
        end subroutine GLFWcharfun

        subroutine GLFWcharmodsfun(window, codepoint, mods)
            import
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: codepoint ! NOTE This is supposed to be unsigned int
            integer(kind=c_int), intent(in) :: mods
        end subroutine GLFWcharmodsfun

        subroutine GLFWdropfun(window, paths)
            import
            implicit none
            type(GLFWwindow),                        intent(in) :: window
            character(len=:), dimension(:), pointer, intent(in) :: paths
        end subroutine GLFWdropfun

        subroutine GLFWmonitorfun(monitor, event)
            import
            implicit none
            type(GLFWmonitor),   intent(in) :: monitor
            integer(kind=c_int), intent(in) :: event
        end subroutine GLFWmonitorfun

        subroutine GLFWjoystickfun(jid, event)
            import
            implicit none
            integer(kind=c_int), intent(in) :: jid
            integer(kind=c_int), intent(in) :: event
        end subroutine GLFWjoystickfun
    end interface


    ! --------------------------------------------------------------------------
    ! GLF90W callback pointers
    ! --------------------------------------------------------------------------


    procedure(GLFWerrorfun),              pointer :: glf90wErrorCallback              => null()
    procedure(GLFWmonitorfun),            pointer :: glf90wMonitorCallback            => null()
    procedure(GLFWjoystickfun),           pointer :: glf90wJoystickCallback           => null()


    ! --------------------------------------------------------------------------
    ! GLF90W window list
    ! --------------------------------------------------------------------------


    type(GLF90Wwindow), pointer :: window_list_head => null()


    ! --------------------------------------------------------------------------
    ! GLFW API functions
    ! --------------------------------------------------------------------------


    public :: &
        ! -- void glfwInit(ierr)
        glfwInit, &
        ! -- void glfwTerminate()
        glfwTerminate, &
        ! -- void glfwInitHint(int IN hint, int IN value)
        glfwInitHint, &
        ! -- void glfwInitAllocator(GLFWallocator IN allocator)
        glfwInitAllocator, &
#if defined(VK_VERSION_1_0)
        ! -- void glfwInitVulkanLoader(PFN_vkGetInstanceProcAddr IN loader)
        glfwInitVulkanLoader, &
#endif
        ! -- void glfwGetVersion(int OUT major, int OUT minor, int OUT rev)
        glfwGetVersion, &
        ! -- char POINTER glfwGetVersionString() result(str)
        glfwGetVersionString, &
        ! -- int glfwGetError(char OPTIONAL POINTER OUT description) result(error_code)
        glfwGetError, &
        ! -- GLFWerrorfun POINTER glfwSetErrorCallback(GLFWerrorfun OPTIONAL IN callback) result(prev_callback)
        glfwSetErrorCallback, &
        ! -- int glfwGetPlatform() result(platform)
        glfwGetPlatform, &
        ! -- logical glfwPlatformSupported(int IN platform) result(supported)
        glfwPlatformSupported, &
        ! -- GLFWmonitor(:) glfwGetMonitors() result(monitors)
        glfwGetMonitors, &
        ! -- GLFWmonitor glfwGetPrimaryMonitor() result(monitor)
        glfwGetPrimaryMonitor, &
        ! -- void glfwGetMonitorPos(GLFWmonitor IN monitor, int OPTIONAL OUT x, int OPTIONAL OUT y)
        glfwGetMonitorPos, &
        ! -- void glfwGetMonitorWorkarea(GLFWmonitor IN monitor, int OPTIONAL OUT x, int OPTIONAL OUT y,
        !                                                            int OPTIONAL OUT w, int OPTIONAL OUT h)
        glfwGetMonitorWorkarea, &
        ! -- void glfwGetMonitorPhysicalSize(GLFWmonitor IN monitor, int OPTIONAL OUT widthMM,
        !                                                                int OPTIONAL OUT heightMM)
        glfwGetMonitorPhysicalSize, &
        ! -- void glfwGetMonitorContentScale(GLFWmonitor IN monitor, float OPTIONAL OUT xscale,
        !                                                                float OPTIONAL OUT yscale)
        glfwGetMonitorContentScale, &
        ! -- char POINTER glfwGetMonitorName(GLFWmonitor IN monitor) result(name)
        glfwGetMonitorName, &
        ! -- void glfwSetMonitorUserPointer(GLFWmonitor IN monitor, type(c_ptr) IN user_pointer)
        glfwSetMonitorUserPointer, &
        ! -- type(c_ptr) glfwGetMonitorUserPointer(GLFWmonitor IN monitor) result(user_pointer)
        glfwGetMonitorUserPointer, &
        ! -- GLFWmonitorfun POINTER glfwSetMonitorCallback(GLFWmonitorfun OPTIONAL IN callback) result(prev_callback)
        glfwSetMonitorCallback, &
        ! -- GLFWvidmode(:) POINTER glfwGetVideoModes(GLFWmonitor IN monitor) result(vidmodes)
        glfwGetVideoModes, &
        ! -- GLFWvidmode POINTER glfwGetVideoMode(GLFWmonitor IN monitor) result(vidmode)
        glfwGetVideoMode, &
        ! -- void glfwSetGamma(GLFWmonitor IN monitor, real IN gamma)
        glfwSetGamma, &
        ! -- GLFWgammaramp POINTER glfwGetGammaRamp(GLFWmonitor IN monitor) result(gammaramp)
        glfwGetGammaRamp, &
        ! -- void glfwSetGammaRamp(GLFWmonitor IN monitor, GLFWgammaramp POINTER IN gammaramp)
        glfwSetGammaRamp, &
        ! -- void glfwDefaultWindowHints(void)
        glfwDefaultWindowHints, &
        ! -- void glfwWindowHint(int IN hint, int IN value)
        glfwWindowHint, &
        ! -- void glfwWindowHintString(int IN hint, char IN value)
        glfwWindowHintString, &
        ! -- GLFWwindow glfwCreateWindow(int IN width, int IN height, char IN title,
        !                                    GLFWmonitor OPTIONAL IN monitor, GLFWwindow OPTIONAL IN share) result(window)
        glfwCreateWindow, &
        ! -- void glfwDestroyWindow(GLFWwindow IN window)
        glfwDestroyWindow, &
        ! -- logical glfwWindowShouldClose(GLFWwindow IN window) result(closeflag)
        glfwWindowShouldClose, &
        ! -- void glfwSetWindowShouldClose(GLFWwindow IN window, logical IN val)
        glfwSetWindowShouldClose, &
        ! -- char POINTER glfwGetWindowTitle(GLFWwindow IN window) result(title)
        glfwGetWindowTitle, &
        ! -- void glfwSetWindowTitle(GLFWwindow IN window, char IN title)
        glfwSetWindowTitle, &
        ! -- void glfwSetWindowIcon(GLFWwindow IN window, GLFWimage(:) IN images)
        glfwSetWindowIcon, &
        ! -- void glfwGetWindowPos(GLFWwindow IN window, int OPTIONAL OUT x, int OPTIONAL OUT y)
        glfwGetWindowPos, &
        ! -- void glfwSetWindowPos(GLFWwindow IN window, int IN x, int IN y)
        glfwSetWindowPos, &
        ! -- void glfwGetWindowSize(GLFWwindow IN window, int OPTIONAL OUT width, int OPTIONAL OUT height)
        glfwGetWindowSize, &
        ! -- void glfwSetWindowSizeLimits(GLFWwindow IN window, int IN minwidth, int IN minheight,
        !                                                           int IN maxwidth, int IN maxheight)
        glfwSetWindowSizeLimits, &
        ! -- void glfwSetWindowAspectRatio(GLFWwindow IN window, int IN numer, int IN denom)
        glfwSetWindowAspectRatio, &
        ! -- void glfwSetWindowSize(GLFWwindow IN window, int IN width, int IN height)
        glfwSetWindowSize, &
        ! -- void glfwGetFramebufferSize(GLFWwindow IN window, int OPTIONAL OUT width, int OPTIONAL OUT height)
        glfwGetFramebufferSize, &
        ! -- void glfwGetWindowFrameSize(GLFWwindow IN window, int OPTIONAL OUT left, int OPTIONAL OUT top,
        !                                                          int OPTIONAL OUT right, int OPTIONAL OUT bottom)
        glfwGetWindowFrameSize, &
        ! -- void glfwGetWindowContentScale(GLFWwindow IN window, int OPTIONAL OUT xscale, int OPTIONAL OUT yscale)
        glfwGetWindowContentScale, &
        ! -- float glfwGetWindowOpacity(GLFWwindow IN window) result(opacity)
        glfwGetWindowOpacity, &
        ! -- void glfwSetWindowOpacity(GLFWwindow IN window, float IN opacity)
        glfwSetWindowOpacity, &
        ! -- void glfwIconifyWindow(GLFWwindow IN window)
        glfwIconifyWindow, &
        ! -- void glfwRestoreWindow(GLFWwindow IN window)
        glfwRestoreWindow, &
        ! -- void glfwMaximizeWindow(GLFWwindow IN window)
        glfwMaximizeWindow, &
        ! -- void glfwShowWindow(GLFWwindow IN window)
        glfwShowWindow, &
        ! -- void glfwHideWindow(GLFWwindow IN window)
        glfwHideWindow, &
        ! -- void glfwFocusWindow(GLFWwindow IN window)
        glfwFocusWindow, &
        ! -- void glfwRequestWindowAttention(GLFWwindow IN window)
        glfwRequestWindowAttention, &
        ! -- GLFWmonitor glfwGetWindowMonitor(GLFWwindow IN window) result(monitor)
        glfwGetWindowMonitor, &
        ! -- void glfwSetWindowMonitor(GLFWwindow IN window, GLFWmonitor OPTIONAL IN monitor,
        !                              int IN x, int IN y, int IN width, int IN height, int IN refresh_rate)
        glfwSetWindowMonitor, &
        ! -- int glfwGetWindowAttrib(GLFWwindow IN window, int IN attrib) result(val)
        glfwGetWindowAttrib, &
        ! -- void glfwSetWindowAttrib(GLFWwindow IN window, int IN attrib, int IN val)
        glfwSetWindowAttrib, &
        ! -- void glfwSetWindowUserPointer(GLFWwindow IN window, void* IN user_pointer)
        glfwSetWindowUserPointer, &
        ! -- void* glfwGetWindowUserPointer(GLFWwindow IN window) result(user_pointer)
        glfwGetWindowUserPointer, &
        ! -- GLFWwindowposfun POINTER glfwSetWindowPosCallback(GLFWwindow IN window,
        !                   GLFWwindowposfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowPosCallback, &
        ! -- GLFWwindowsizefun POINTER glfwSetWindowSizeCallback(GLFWwindow IN window, 
        !                    GLFWwindowsizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowSizeCallback, &
        ! -- GLFWwindowclosefun POINTER glfwSetWindowCloseCallback(GLFWwindow IN window,
        !                     GLFWwindowclosefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowCloseCallback, &
        ! -- GLFWwindowrefreshfun POINTER glfwSetWindowRefreshCallback(GLFWwindow IN window,
        !                       GLFWwindowrefreshfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowRefreshCallback, &
        ! -- GLFWwindowfocusfun POINTER glfwSetWindowFocusCallback(GLFWwindow IN window,
        !                       GLFWwindowfocusfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowFocusCallback, &
        ! -- GLFWwindowiconifyfun POINTER glfwSetWindowIconifyCallback(GLFWwindow IN window,
        !                       GLFWwindowiconifyfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowIconifyCallback, &
        ! -- GLFWwindowmaximizefun POINTER glfwSetWindowMaximizeCallback(GLFWwindow IN window,
        !                        GLFWwindowmaximizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowMaximizeCallback, &
        ! -- GLFWframebuffersizefun POINTER glfwSetFramebufferSizeCallback(GLFWwindow IN window,
        !                         GLFWframebuffersizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetFramebufferSizeCallback, &
        ! -- GLFWwindowcontentscalefun POINTER glfwSetWindowContentScaleCallback(GLFWwindow IN window,
        !                            GLFWwindowcontentscalefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowContentScaleCallback, &
        ! -- void glfwPollEvents()
        glfwPollEvents, &
        ! -- void glfwWaitEvents()
        glfwWaitEvents, &
        ! -- void glfwWaitEventsTimeout(double IN timeout)
        glfwWaitEventsTimeout, &
        ! -- void glfwPostEmptyEvent()
        glfwPostEmptyEvent, &
        ! -- int glfwGetInputMode(GLFWwindow IN window, int IN mode) result(val)
        glfwGetInputMode, &
        ! -- void glfwSetInputMode(GLFWwindow IN window, int IN mode, int IN val)
        glfwSetInputMode, &
        ! -- logical glfwRawMouseMotionSupported() result(supported)
        glfwRawMouseMotionSupported, &
        ! -- char POINTER glfwGetKeyName(int IN key, int IN scancode) result(name)
        glfwGetKeyName, &
        ! -- int glfwGetKeyScancode(int IN key) result(scancode)
        glfwGetKeyScancode, &
        ! -- int glfwGetKey(GLFWwindow IN window, int IN key) result(status)
        glfwGetKey, &
        ! -- int glfwGetMouseButton(GLFWwindow IN window, int IN button) result(status)
        glfwGetMouseButton, &
        ! -- void glfwGetCursorPos(GLFWwindow IN window, double OPTIONAL OUT x, double OPTIONAL OUT y)
        glfwGetCursorPos, &
        ! -- void glfwSetCursorPos(GLFWwindow IN window, double IN x, double IN y)
        glfwSetCursorPos, &
        ! -- GLFWcursor glfwCreateCursor(GLFWimage IN image, int IN xhot, int IN yhot) result(cursor)
        glfwCreateCursor, &
        ! -- GLFWcursor glfwCreateStandardCursor(int IN shape) result(cursor)
        glfwCreateStandardCursor, &
        ! -- void glfwDestroyCursor(GLFWcursor IN cursor)
        glfwDestroyCursor, &
        ! -- void glfwSetCursor(GLFWwindow IN window, GLFWcursor IN cursor)
        glfwSetCursor, &
        ! -- GLFWkeyfun POINTER glfwSetKeyCallback(GLFWwindow IN window,
        !                                          GLFWkeyfun OPTIONAL IN callback) result(prev_callback)
        glfwSetKeyCallback, &
        ! -- GLFWcharfun POINTER glfwSetCharCallback(GLFWwindow IN window,
        !                                            GLFWcharfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCharCallback, &
        ! -- GLFWcharmodsfun POINTER glfwSetCharModsCallback(GLFWwindow IN window,
        !                                                    GLFWcharmodsfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCharModsCallback, &
        ! -- GLFWmousebuttonfun POINTER glfwSetMouseButtonCallback(GLFWwindow IN window,
        !                                                          GLFWmousebuttonfun OPTIONAL IN callback) result(prev_callback)
        glfwSetMouseButtonCallback, &
        ! -- GLFWcursorposfun POINTER glfwSetCursorPosCallback(GLFWwindow IN window,
        !                                                      GLFWcursorposfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCursorPosCallback, &
        ! -- GLFWcursorenterfun POINTER glfwSetCursorEnterCallback(GLFWwindow IN window,
        !                                                          GLFWcursorenterfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCursorEnterCallback, &
        ! -- GLFWscrollfun POINTER glfwSetScrollCallback(GLFWwindow IN window,
        !                                                GLFWscrollfun OPTIONAL IN callback) result(prev_callback)
        glfwSetScrollCallback, &
        ! -- GLFWdropfun POINTER glfwSetDropCallback(GLFWwindow IN window,
        !                                            GLFWdropfun OPTIONAL IN callback) result(prev_callback)
        glfwSetDropCallback, &
        ! -- logical glfwJoystickPresent(int IN jid) result(is_present)
        glfwJoystickPresent, &
        ! -- real(:) glfwGetJoystickAxes(int IN jid) result(axes)
        ! Note: The "count" parameter from the original function can be obtained from size(axes) instead
        !       size(axes) = 0 if joystick is not present (axes == NULL from C side)
        glfwGetJoystickAxes, &
        ! -- char(:) glfwGetJoystickButtons(int IN jid) result(states)
        glfwGetJoystickButtons, &
        ! -- char(:) glfwGetJoystickHats(int IN jid) result(states)
        glfwGetJoystickHats, &
        ! -- char POINTER glfwGetJoystickName(int IN jid) result(name)
        glfwGetJoystickName, &
        ! -- char POINTER glfwGetJoystickGUID(int IN jid) result(GUID)
        glfwGetJoystickGUID, &
        ! -- void glfwSetJoystickUserPointer(int IN jid, void* IN user_pointer)
        glfwSetJoystickUserPointer, &
        ! -- void* glfwGetJoystickUserPointer(int IN jid) result(user_pointer)
        glfwGetJoystickUserPointer, &
        ! -- logical glfwJoystickIsGamepad(int IN jid) result(is_gamepad)
        glfwJoystickIsGamepad, &
        ! -- GLFWjoystickfun POINTER glfwSetJoystickCallback(GLFWjoystickfun OPTIONAL IN callback) result(prev_callback)
        glfwSetJoystickCallback, &
        ! -- logical glfwJoystickIsGamepad(char IN mappings) result(success)
        glfwUpdateGamepadMappings, &
        ! -- char POINTER glfwGetGamepadName(int IN jid) result(name)
        glfwGetGamepadName, &
        ! -- logical glfwGetGamepadState(int IN jid, GLFWgamepadstate OUT state) result(success)
        glfwGetGamepadState, &
        ! -- void glfwSetClipboardString(GLFWwindow IN window, char IN string)
        glfwSetClipboardString, &
        ! -- char glfwSetClipboardString(GLFWwindow IN window) result(string)
        glfwGetClipboardString, &
        ! -- double glfwGetTime() result(time)
        glfwGetTime, &
        ! -- void glfwSetTime(double IN time)
        glfwSetTime, &
        ! -- long glfwGetTimerValue() result(value)
        glfwGetTimerValue, &
        ! -- long glfwGetTimerFrequency() result(frequency)
        glfwGetTimerFrequency, &
        ! -- void glfwMakeContextCurrent(GLFWwindow IN window)
        glfwMakeContextCurrent, &
        ! -- GLFWwindow glfwGetCurrentContext() result(window)
        glfwGetCurrentContext, &
        ! -- void glfwSwapBuffers(GLFWwindow IN window)
        glfwSwapBuffers, &
        ! -- void glfwSwapInterval(int IN interval)
        glfwSwapInterval, &
        ! -- logical glfwExtensionSupported(char IN extension) result(supported)
        glfwExtensionSupported, &
        ! -- GLFWglproc glfwGetProcAddress(char IN procname) result(procaddr)
        glfwGetProcAddress, &
        ! -- logical glfwVulkanSupported() result(supported)
        glfwVulkanSupported, &
#if defined(VK_VERSION_1_0)
        ! GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname);
        glfwGetInstanceProcAddress, &
        ! int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
        glfwGetPhysicalDevicePresentationSupport, &
        ! VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);
        glfwCreateWindowSurface, &
#endif
        ! -- character(:), dimension(:) glfwGetRequiredInstanceExtensions(void) result(names)
        glfwGetRequiredInstanceExtensions


    ! --------------------------------------------------------------------------
    ! GLF90W C function interfaces
    ! --------------------------------------------------------------------------


    interface
        function c_glfwInit() result(success) bind(C, name="glfwInit")
            import
            implicit none
            integer(kind=c_int) :: success
        end function c_glfwInit

        subroutine c_glfwTerminate() bind(C, name="glfwTerminate")
        end subroutine c_glfwTerminate

        subroutine glfwInitHint(hint, value) bind(C, name="glfwInitHint")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: hint
            integer(kind=c_int), value, intent(in) :: value
        end subroutine glfwInitHint

        subroutine c_glfwInitAllocator(allocator) bind(C, name="glfwInitAllocator")
            import
            implicit none
            type(c_GLFWallocator), optional, intent(in) :: allocator
        end subroutine c_glfwInitAllocator

#if defined(VK_VERSION_1_0)
        subroutine c_glfwInitVulkanLoader(loader) bind(C, name="glfwInitVulkanLoader")
            import
            implicit none
            type(c_funptr), value, intent(in) :: loader
        end subroutine c_glfwInitVulkanLoader
#endif

        subroutine glfwGetVersion(major, minor, rev) bind(C, name="glfwGetVersion")
            import
            implicit none
            integer(kind=c_int), optional, intent(out) :: major
            integer(kind=c_int), optional, intent(out) :: minor
            integer(kind=c_int), optional, intent(out) :: rev
        end subroutine glfwGetVersion

        function c_glfwGetVersionString() result(str) bind(C, name="glfwGetVersionString")
            import
            implicit none
            type(c_ptr) :: str
        end function c_glfwGetVersionString

        function c_glfwGetError(description) result(error_code) bind(C, name="glfwGetError")
            import
            implicit none
            type(c_ptr), optional :: description
            integer(kind=c_int)   :: error_code
        end function c_glfwGetError

        function c_glfwSetErrorCallback(callback) result(prev_callback) bind(C, name="glfwSetErrorCallback")
            import
            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetErrorCallback

        function glfwGetPlatform() result(platform) bind(C, name="glfwGetPlatform")
            import
            implicit none
            integer(kind=c_int) :: platform
        end function glfwGetPlatform

        function c_glfwPlatformSupported(platform) result(supported) bind(C, name="glfwPlatformSupported")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: platform
            integer(kind=c_int)                    :: supported
        end function c_glfwPlatformSupported

        function c_glfwGetMonitors(count) result(monitors) bind(C, name="glfwGetMonitors")
            import
            implicit none
            integer(kind=c_int) :: count
            type(c_ptr)         :: monitors
        end function c_glfwGetMonitors

        function c_glfwGetPrimaryMonitor() result(monitor) bind(C, name="glfwGetPrimaryMonitor")
            import
            implicit none
            type(c_ptr) :: monitor
        end function c_glfwGetPrimaryMonitor

        subroutine c_glfwGetMonitorPos(monitor, x, y) bind(C, name="glfwGetMonitorPos")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y
        end subroutine c_glfwGetMonitorPos

        subroutine c_glfwGetMonitorWorkarea(monitor, x, y, w, h) bind(C, name="glfwGetMonitorWorkarea")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y, w, h
        end subroutine c_glfwGetMonitorWorkarea

        subroutine c_glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM) bind(C, name="glfwGetMonitorPhysicalSize")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: widthMM, heightMM
        end subroutine c_glfwGetMonitorPhysicalSize

        subroutine c_glfwGetMonitorContentScale(monitor, xscale, yscale) bind(C, name="glfwGetMonitorContentScale")
            import
            implicit none
            type(c_ptr), value,           intent(in)  :: monitor
            real(kind=c_float), optional, intent(out) :: xscale, yscale
        end subroutine c_glfwGetMonitorContentScale

        function c_glfwGetMonitorName(monitor) result(name) bind(C, name="glfwGetMonitorName")
            import
            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: name
        end function c_glfwGetMonitorName

        subroutine c_glfwSetMonitorUserPointer(monitor, ptr) bind(C, name="glfwSetMonitorUserPointer")
            import
            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr),        intent(in) :: ptr
        end subroutine c_glfwSetMonitorUserPointer

        function c_glfwGetMonitorUserPointer(monitor) result(ptr) bind(C, name="glfwGetMonitorUserPointer")
            import
            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: ptr
        end function c_glfwGetMonitorUserPointer

        function c_glfwSetMonitorCallback(callback) result(prev_callback) bind(C, name="glfwSetMonitorCallback")
            import
            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetMonitorCallback

        function c_glfwGetVideoModes(monitor, count) result(vidmodes) bind(C, name="glfwGetVideoModes")
            import
            implicit none
            type(c_ptr), value, intent(in) :: monitor
            integer(kind=c_int)            :: count
            type(c_ptr)                    :: vidmodes
        end function c_glfwGetVideoModes

        function c_glfwGetVideoMode(monitor) result(vidmode) bind(C, name="glfwGetVideoMode")
            import
            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: vidmode
        end function c_glfwGetVideoMode

        subroutine c_glfwSetGamma(monitor, gamma) bind(C, name="glfwSetGamma")
            import
            implicit none
            type(c_ptr),        value, intent(in) :: monitor
            real(kind=c_float), value, intent(in) :: gamma
        end subroutine c_glfwSetGamma

        function c_glfwGetGammaRamp(monitor) result(gammaramp) bind(C, name="glfwGetGammaRamp")
            import
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: gammaramp
        end function c_glfwGetGammaRamp

        subroutine c_glfwSetGammaRamp(monitor, gammaramp) bind(C, name="glfwSetGammaRamp")
            import
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr), value, intent(in) :: gammaramp
        end subroutine c_glfwSetGammaRamp

        subroutine glfwDefaultWindowHints() bind(C, name="glfwDefaultWindowHints")
        end subroutine glfwDefaultWindowHints

        subroutine glfwWindowHint(hint, value) bind(C, name="glfwWindowHint")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: hint
            integer(kind=c_int), value, intent(in) :: value
        end subroutine glfwWindowHint

        subroutine c_glfwWindowHintString(hint, val) bind(C, name="glfwWindowHintString")
            import
            implicit none
            integer(kind=c_int), value,                  intent(in) :: hint
            character(len=1, kind=c_char), dimension(*), intent(in) :: val
        end subroutine c_glfwWindowHintString

        function c_glfwCreateWindow(width, height, title, monitor, share) result(window) bind(C, name="glfwCreateWindow")
            import
            implicit none
            integer(kind=c_int), value,                  intent(in) :: width, height
            character(len=1, kind=c_char), dimension(*), intent(in) :: title
            type(c_ptr), value,                          intent(in) :: monitor
            type(c_ptr), value,                          intent(in) :: share
            type(c_ptr)                                             :: window
        end function c_glfwCreateWindow

        subroutine c_glfwDestroyWindow(window) bind(C, name="glfwDestroyWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwDestroyWindow

        function c_glfwWindowShouldClose(window) result(closeflag) bind(C, name="glfwWindowShouldClose")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            integer(kind=c_int)            :: closeflag
        end function c_glfwWindowShouldClose

        subroutine c_glfwSetWindowShouldClose(window, val) bind(C, name="glfwSetWindowShouldClose")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetWindowShouldClose

        function c_glfwGetWindowTitle(window) result(title) bind(C, name="glfwGetWindowTitle")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: title
        end function c_glfwGetWindowTitle

        subroutine c_glfwSetWindowTitle(window, title) bind(C, name="glfwSetWindowTitle")
            import
            implicit none
            type(c_ptr), value,                          intent(in) :: window
            character(len=1, kind=c_char), dimension(*), intent(in) :: title
        end subroutine c_glfwSetWindowTitle

        subroutine c_glfwSetWindowIcon(window, count, images) bind(C, name="glfwSetWindowIcon")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: count
            type(c_ptr),         value, intent(in) :: images
        end subroutine c_glfwSetWindowIcon

        subroutine c_glfwGetWindowPos(window, x, y) bind(C, name="glfwGetWindowPos")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: x, y
        end subroutine c_glfwGetWindowPos

        subroutine c_glfwSetWindowPos(window, x, y) bind(C, name="glfwSetWindowPos")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: x, y
        end subroutine c_glfwSetWindowPos

        subroutine c_glfwGetWindowSize(window, width, height) bind(C, name="glfwGetWindowSize")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height
        end subroutine c_glfwGetWindowSize

        subroutine c_glfwSetWindowSizeLimits(window, minw, minh, maxw, maxh) bind(C, name="glfwSetWindowSizeLimits")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: minw, minh, maxw, maxh
        end subroutine c_glfwSetWindowSizeLimits

        subroutine c_glfwSetWindowAspectRatio(window, numer, denom) bind(C, name="glfwSetWindowAspectRatio")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: numer, denom
        end subroutine c_glfwSetWindowAspectRatio

        subroutine c_glfwSetWindowSize(window, width, height) bind(C, name="glfwSetWindowSize")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height
        end subroutine c_glfwSetWindowSize

        subroutine c_glfwGetFramebufferSize(window, width, height) bind(C, name="glfwGetFramebufferSize")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height
        end subroutine c_glfwGetFramebufferSize

        subroutine c_glfwGetWindowFrameSize(window, left, top, right, bottom) bind(C, name="glfwGetWindowFrameSize")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: left, top, right, bottom
        end subroutine c_glfwGetWindowFrameSize

        subroutine c_glfwGetWindowContentScale(window, xscale, yscale) bind(C, name="glfwGetWindowContentScale")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            real(kind=c_float),  optional, intent(out) :: xscale, yscale
        end subroutine c_glfwGetWindowContentScale

        function c_glfwGetWindowOpacity(window) result(opacity) bind(C, name="glfwGetWindowOpacity")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            real(kind=c_float)             :: opacity
        end function c_glfwGetWindowOpacity

        subroutine c_glfwSetWindowOpacity(window, opacity) bind(C, name="glfwSetWindowOpacity")
            import
            implicit none
            type(c_ptr),        value, intent(in) :: window
            real(kind=c_float), value, intent(in) :: opacity
        end subroutine c_glfwSetWindowOpacity

        subroutine c_glfwIconifyWindow(window) bind(C, name="glfwIconifyWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwIconifyWindow

        subroutine c_glfwRestoreWindow(window) bind(C, name="glfwRestoreWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwRestoreWindow

        subroutine c_glfwMaximizeWindow(window) bind(C, name="glfwMaximizeWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwMaximizeWindow

        subroutine c_glfwShowWindow(window) bind(C, name="glfwShowWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwShowWindow

        subroutine c_glfwHideWindow(window) bind(C, name="glfwHideWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwHideWindow

        subroutine c_glfwFocusWindow(window) bind(C, name="glfwFocusWindow")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwFocusWindow

        subroutine c_glfwRequestWindowAttention(window) bind(C, name="glfwRequestWindowAttention")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwRequestWindowAttention

        function c_glfwGetWindowMonitor(window) result(monitor) bind(C, name="glfwGetWindowMonitor")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: monitor
        end function c_glfwGetWindowMonitor

        subroutine c_glfwSetWindowMonitor(window, monitor, x, y, w, h, refresh_rate) bind(C, name="glfwSetWindowMonitor")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            type(c_ptr),         value, intent(in) :: monitor
            integer(kind=c_int), value, intent(in) :: x, y, w, h, refresh_rate
        end subroutine c_glfwSetWindowMonitor

        function c_glfwGetWindowAttrib(window, attrib) result(val) bind(C, name="glfwGetWindowAttrib")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: attrib
            integer(kind=c_int)                    :: val
        end function c_glfwGetWindowAttrib

        subroutine c_glfwSetWindowAttrib(window, attrib, val) bind(C, name="glfwSetWindowAttrib")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: attrib
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetWindowAttrib

        subroutine c_glfwSetWindowUserPointer(window, user_pointer) bind(C, name="glfwSetWindowUserPointer")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr),        intent(in) :: user_pointer
        end subroutine c_glfwSetWindowUserPointer

        function c_glfwGetWindowUserPointer(window) result(user_pointer) bind(C, name="glfwGetWindowUserPointer")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: user_pointer
        end function c_glfwGetWindowUserPointer

        function c_glfwSetWindowPosCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowPosCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowPosCallback

        function c_glfwSetWindowSizeCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowSizeCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowSizeCallback

        function c_glfwSetWindowCloseCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowCloseCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowCloseCallback

        function c_glfwSetWindowRefreshCallback(window, callback) &
        result(prev_callback) bind(C, name="glfwSetWindowRefreshCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowRefreshCallback

        function c_glfwSetWindowFocusCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowFocusCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowFocusCallback

        function c_glfwSetWindowIconifyCallback(window, callback) &
        result(prev_callback) bind(C, name="glfwSetWindowIconifyCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowIconifyCallback

        function c_glfwSetWindowMaximizeCallback(window, callback) &
        result(prev_callback) bind(C, name="glfwSetWindowMaximizeCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowMaximizeCallback

        function c_glfwSetFramebufferSizeCallback(window, callback) &
        result(prev_callback) bind(C, name="glfwSetFramebufferSizeCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetFramebufferSizeCallback

        function c_glfwSetWindowContentScaleCallback(window, callback) &
        result(prev_callback) bind(C, name="glfwSetWindowContentScaleCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowContentScaleCallback

        subroutine glfwPollEvents() bind(C, name="glfwPollEvents")
        end subroutine glfwPollEvents

        subroutine glfwWaitEvents() bind(C, name="glfwWaitEvents")
        end subroutine glfwWaitEvents

        subroutine glfwWaitEventsTimeout(timeout) bind(C, name="glfwWaitEventsTimeout")
            import
            implicit none
            real(kind=c_double), value, intent(in) :: timeout
        end subroutine glfwWaitEventsTimeout

        subroutine glfwPostEmptyEvent() bind(C, name="glfwPostEmptyEvent")
        end subroutine glfwPostEmptyEvent

        function c_glfwGetInputMode(window, mode) result(val) bind(C, name="glfwGetInputMode")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: mode
            integer(kind=c_int)                    :: val
        end function c_glfwGetInputMode

        subroutine c_glfwSetInputMode(window, mode, val) bind(C, name="glfwSetInputMode")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: mode
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetInputMode

        function c_glfwRawMouseMotionSupported() result(supported) bind(C, name="glfwRawMouseMotionSupported")
            import
            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwRawMouseMotionSupported

        function c_glfwGetKeyName(key, scancode) result(name) bind(C, name="glfwGetKeyName")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int), value, intent(in) :: scancode
            type(c_ptr)                            :: name
        end function c_glfwGetKeyName

        function glfwGetKeyScancode(key) result(scancode) bind(C, name="glfwGetKeyScancode")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int)                    :: scancode
        end function glfwGetKeyScancode

        function c_glfwGetKey(window, key) result(status) bind(C, name="glfwGetKey")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int)                    :: status
        end function c_glfwGetKey

        function c_glfwGetMouseButton(window, button) result(status) bind(C, name="glfwGetMouseButton")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: button
            integer(kind=c_int)                    :: status
        end function c_glfwGetMouseButton

        subroutine c_glfwGetCursorPos(window, x, y) bind(C, name="glfwGetCursorPos")
            import
            implicit none
            type(c_ptr), value,            intent(in)  :: window
            real(kind=c_double), optional, intent(out) :: x, y
        end subroutine c_glfwGetCursorPos

        subroutine c_glfwSetCursorPos(window, x, y) bind(C, name="glfwSetCursorPos")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: x, y
        end subroutine c_glfwSetCursorPos

        function c_glfwCreateCursor(image, xhot, yhot) result(cursor) bind(C, name="glfwCreateCursor")
            import
            implicit none
            type(c_ptr),         value, intent(in) :: image
            integer(kind=c_int), value, intent(in) :: xhot, yhot
            type(c_ptr)                            :: cursor
        end function c_glfwCreateCursor

        function c_glfwCreateStandardCursor(cursor_shape) result(cursor) bind(C, name="glfwCreateStandardCursor")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: cursor_shape
            type(c_ptr)                            :: cursor
        end function c_glfwCreateStandardCursor

        subroutine c_glfwDestroyCursor(cursor) bind(C, name="glfwDestroyCursor")
            import
            implicit none
            type(c_ptr), value, intent(in) :: cursor
        end subroutine c_glfwDestroyCursor

        subroutine c_glfwSetCursor(window, cursor) bind(C, name="glfwSetCursor")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr), value, intent(in) :: cursor
        end subroutine c_glfwSetCursor

        function c_glfwSetKeyCallback(window, callback) result(prev_callback) bind(C, name="glfwSetKeyCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetKeyCallback

        function c_glfwSetCharCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCharCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCharCallback

        function c_glfwSetCharModsCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCharModsCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCharModsCallback

        function c_glfwSetMouseButtonCallback(window, callback) result(prev_callback) bind(C, name="glfwSetMouseButtonCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetMouseButtonCallback

        function c_glfwSetCursorPosCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCursorPosCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCursorPosCallback

        function c_glfwSetCursorEnterCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCursorEnterCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCursorEnterCallback

        function c_glfwSetScrollCallback(window, callback) result(prev_callback) bind(C, name="glfwSetScrollCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetScrollCallback

        function c_glfwSetDropCallback(window, callback) result(prev_callback) bind(C, name="glfwSetDropCallback")
            import
            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetDropCallback

        function c_glfwJoystickPresent(jid) result(jpresent) bind(C, name="glfwJoystickPresent")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: jpresent
        end function c_glfwJoystickPresent

        function c_glfwGetJoystickAxes(jid, count) result(axes) bind(C, name="glfwGetJoystickAxes")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: axes
        end function c_glfwGetJoystickAxes

        function c_glfwGetJoystickButtons(jid, count) result(states) bind(C, name="glfwGetJoystickButtons")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: states
        end function c_glfwGetJoystickButtons

        function c_glfwGetJoystickHats(jid, count) result(states) bind(C, name="glfwGetJoystickHats")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: states
        end function c_glfwGetJoystickHats

        function c_glfwGetJoystickName(jid) result(name) bind(C, name="glfwGetJoystickName")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: name
        end function c_glfwGetJoystickName

        function c_glfwGetJoystickGUID(jid) result(GUID) bind(C, name="glfwGetJoystickGUID")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: GUID
        end function c_glfwGetJoystickGUID

        subroutine glfwSetJoystickUserPointer(jid, user_pointer) bind(C, name="glfwSetJoystickUserPointer")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr),                intent(in) :: user_pointer
        end subroutine glfwSetJoystickUserPointer

        function glfwGetJoystickUserPointer(jid) result(user_pointer) bind(C, name="glfwGetJoystickUserPointer")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: user_pointer
        end function glfwGetJoystickUserPointer

        function c_glfwJoystickIsGamepad(jid) result(is_gamepad) bind(C, name="glfwJoystickIsGamepad")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: is_gamepad
        end function c_glfwJoystickIsGamepad

        function c_glfwSetJoystickCallback(callback) result(prev_callback) bind(C, name="glfwSetJoystickCallback")
            import
            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetJoystickCallback

        function c_glfwUpdateGamepadMappings(mappings) result(success) bind(C, name="glfwUpdateGamepadMappings")
            import
            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: mappings
            integer(kind=c_int)                                     :: success
        end function c_glfwUpdateGamepadMappings

        function c_glfwGetGamepadName(jid) result(name) bind(C, name="glfwGetGamepadName")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: name
        end function c_glfwGetGamepadName

        function c_glfwGetGamepadState(jid, state) result(success) bind(C, name="glfwGetGamepadState")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(GLFWgamepadstate)                 :: state
            integer(kind=c_int)                    :: success
        end function c_glfwGetGamepadState

        subroutine c_glfwSetClipboardString(window, string) bind(C, name="glfwSetClipboardString")
            import
            implicit none
            type(c_ptr), value,                          intent(in) :: window
            character(len=1, kind=c_char), dimension(*), intent(in) :: string
        end subroutine c_glfwSetClipboardString

        function c_glfwGetClipboardString(window) result(string) bind(C, name="glfwGetClipboardString")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: string
        end function c_glfwGetClipboardString

        function glfwGetTime() result(time) bind(C, name="glfwGetTime")
            import
            implicit none
            real(kind=c_double) :: time
        end function glfwGetTime

        subroutine glfwSetTime(time) bind(C, name="glfwSetTime")
            import
            implicit none
            real(kind=c_double), value, intent(in) :: time
        end subroutine glfwSetTime

        function glfwGetTimerValue() result(value) bind(C, name="glfwGetTimerValue")
            import
            implicit none
            integer(kind=c_int64_t) :: value
        end function glfwGetTimerValue

        function glfwGetTimerFrequency() result(frequency) bind(C, name="glfwGetTimerFrequency")
            import
            implicit none
            integer(kind=c_int64_t) :: frequency
        end function glfwGetTimerFrequency

        subroutine c_glfwMakeContextCurrent(window) bind(C, name="glfwMakeContextCurrent")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwMakeContextCurrent

        function c_glfwGetCurrentContext() result(window) bind(C, name="glfwGetCurrentContext")
            import
            implicit none
            type(c_ptr) :: window
        end function c_glfwGetCurrentContext

        subroutine c_glfwSwapBuffers(window) bind(C, name="glfwSwapBuffers")
            import
            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwSwapBuffers

        subroutine glfwSwapInterval(interval) bind(C, name="glfwSwapInterval")
            import
            implicit none
            integer(kind=c_int), value, intent(in) :: interval
        end subroutine glfwSwapInterval

        function c_glfwExtensionSupported(extension) result(supported) bind(C, name="glfwExtensionSupported")
            import
            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: extension
            integer(kind=c_int)                                     :: supported
        end function c_glfwExtensionSupported

        function c_glfwGetProcAddress(procname) result(procaddr) bind(C, name="glfwGetProcAddress")
            import
            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: procname
            type(c_funptr)                                          :: procaddr
        end function c_glfwGetProcAddress

        function c_glfwVulkanSupported() result(supported) bind(C, name="glfwVulkanSupported")
            import
            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwVulkanSupported

#if defined(VK_VERSION_1_0)
        function c_glfwGetInstanceProcAddress(instance, procname) &
        result(procaddr) bind(C, name="glfwGetInstanceProcAddress")
            import
            implicit none
            type(c_ptr), value,                          intent(in) :: instance
            character(len=1, kind=c_char), dimension(*), intent(in) :: procname
            type(c_funptr)                                          :: procaddr
        end function c_glfwGetInstanceProcAddress

        function c_glfwGetPhysicalDevicePresentationSupport(instance, device, queuefamily) &
        result(supported) bind(C, name="glfwGetPhysicalDevicePresentationSupport")
            import
            implicit none
            type(c_ptr),             value, intent(in) :: instance
            type(c_ptr),             value, intent(in) :: device
            integer(kind=c_int32_t), value, intent(in) :: queuefamily
            integer(kind=c_int)                        :: supported
        end function c_glfwGetPhysicalDevicePresentationSupport

        function c_glfwCreateWindowSurface(instance, window, allocator, surface) &
        result(res) bind(C, name="glfwCreateWindowSurface")
            import
            implicit none
            type(c_ptr),             value, intent(in) :: instance
            type(c_ptr),             value, intent(in) :: window
            type(c_ptr),             value, intent(in) :: allocator
            type(c_ptr),             value, intent(in) :: surface
            integer(kind=c_int)                        :: res
        end function c_glfwCreateWindowSurface
#endif

        function c_glfwGetRequiredInstanceExtensions(count) result(names) bind(C, name="glfwGetRequiredInstanceExtensions")
            import
            implicit none
            integer(kind=c_int32_t) :: count
            type(c_ptr)             :: names
        end function c_glfwGetRequiredInstanceExtensions
    end interface


    ! --------------------------------------------------------------------------
    ! GLF90W C-interoperability function interfaces
    ! --------------------------------------------------------------------------


    interface c_strlen
        pure function c_ptr_strlen(cstr) result(length) bind(C, name="strlen")
            import
            implicit none
            type(c_ptr), value, intent(in) :: cstr
            integer(kind=c_size_t)         :: length
        end function c_ptr_strlen

        pure function c_char_strlen(cstr) result(length) bind(C, name="strlen")
            import
            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: cstr
            integer(kind=c_size_t)                                  :: length
        end function c_char_strlen
    end interface c_strlen

    contains


        ! ----------------------------------------------------------------------
        ! GLF90W API procedures
        ! ----------------------------------------------------------------------


        subroutine glfwInit(ierr)
            implicit none
            integer, optional, intent(out) :: ierr

            ierr = merge(1, 0, c_glfwInit() == GLFW_FALSE)
        end subroutine glfwInit

        subroutine glfwTerminate()
            implicit none
            type(GLF90Wwindow), pointer :: current, next

            call c_glfwTerminate()

            current => window_list_head
            do
                if (.not. associated(current)) exit

                next => current%next
                deallocate(current)
                current => next
            end do
            nullify(window_list_head)

            nullify(glf90wMonitorCallback)
            nullify(glf90wJoystickCallback)
        end subroutine glfwTerminate

        subroutine glfwInitAllocator(allocator)
            implicit none
            type(GLFWallocator), optional, intent(in) :: allocator
            type(c_GLFWallocator) :: c_allocator

            if (present(allocator)) then
                c_allocator%allocate_fn = c_funloc(allocator%allocate_fn)
                c_allocator%reallocate_fn = c_funloc(allocator%reallocate_fn)
                c_allocator%deallocate_fn = c_funloc(allocator%deallocate_fn)
                c_allocator%user = allocator%user

                call c_glfwInitAllocator(c_allocator)
            else
                call c_glfwInitAllocator()
            end if
        end subroutine glfwInitAllocator

#if defined(VK_VERSION_1_0)
        subroutine glfwInitVulkanLoader(loader)
            implicit none
            ! TODO This has to be the C interface with C-string argument. 
            ! Can I make a wrapper or have it in a way that allows
            ! passing a fortran string instead ?
            interface
                function loader(instance, procname) result(procaddr)
                    import
                    implicit none
                    type(c_ptr), value,                          intent(in) :: instance
                    character(len=1, kind=c_char), dimension(*), intent(in) :: procname
                    type(c_funptr)                                          :: procaddr
                end function loader
            end interface

            call c_glfwInitVulkanLoader(c_funloc(loader))
        end subroutine glfwInitVulkanLoader
#endif

        function glfwGetVersionString() result(string)
            implicit none
            character(len=:, kind=c_char), pointer :: string
            type(c_ptr) :: c_string

            c_string = c_glfwGetVersionString()
            call c_f_strpointer(c_string, string, c_strlen(c_string))
        end function glfwGetVersionString

        function glfwGetError(description) result(error_code)
            implicit none
            character(len=:, kind=c_char), pointer, optional :: description
            integer(kind=c_int) :: error_code

            type(c_ptr) :: c_desc

            error_code = c_glfwGetError(c_desc)
            if (present(description)) then
                if (c_associated(c_desc)) then
                    call c_f_strpointer(c_desc, description, c_strlen(c_desc))
                else
                    nullify(description)
                end if
            end if
        end function glfwGetError

        subroutine glfwSetErrorCallback(callback, prev_callback)
            implicit none
            procedure(GLFWerrorfun), optional :: callback
            procedure(GLFWerrorfun), pointer, optional, intent(out) :: prev_callback

            type(c_funptr) :: unused

            if (present(prev_callback)) prev_callback => glf90wErrorCallback
            if (present(callback)) then
                unused = c_glfwSetErrorCallback(c_funloc(glf90wErrorWrapper))
                glf90wErrorCallback => callback
            else
                unused = c_glfwSetErrorCallback(c_null_funptr)
                nullify(glf90wErrorCallback)
            end if
        end subroutine glfwSetErrorCallback

        function glfwPlatformSupported(platform) result(supported)
            implicit none
            integer(kind=c_int), intent(in) :: platform
            logical                         :: supported

            supported = merge(.false., .true., c_glfwPlatformSupported(platform) == GLFW_FALSE)
        end function glfwPlatformSupported

        function glfwGetMonitors() result(monitors)
            implicit none
            type(GLFWmonitor), dimension(:), allocatable :: monitors

            type(c_ptr) :: c_monitors
            integer(kind=c_int) :: count
            type(c_ptr), dimension(:), pointer :: c_array
            count = 0

            c_monitors = c_glfwGetMonitors(count)
            allocate(monitors(count))
            if (count > 0) then
                call c_f_pointer(c_monitors, c_array, [count])
                monitors(:)%handle = c_array
            end if
        end function glfwGetMonitors

        function glfwGetPrimaryMonitor() result(monitor)
            implicit none
            type(GLFWmonitor) :: monitor

            monitor = GLFWmonitor(handle = c_glfwGetPrimaryMonitor())
        end function glfwGetPrimaryMonitor

        subroutine glfwGetMonitorPos(monitor, x, y)
            implicit none
            type(GLFWmonitor),             intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y

            call c_glfwGetMonitorPos(monitor%handle, x, y)
        end subroutine glfwGetMonitorPos

        subroutine glfwGetMonitorWorkarea(monitor, x, y, width, height)
            implicit none
            type(GLFWmonitor),             intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y, width, height

            call c_glfwGetMonitorWorkarea(monitor%handle, x, y, width, height)
        end subroutine glfwGetMonitorWorkarea

        subroutine glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM)
            implicit none
            type(GLFWmonitor),             intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: widthMM, heightMM

            call c_glfwGetMonitorPhysicalSize(monitor%handle, widthMM, heightMM)
        end subroutine glfwGetMonitorPhysicalSize

        subroutine glfwGetMonitorContentScale(monitor, xscale, yscale)
            implicit none
            type(GLFWmonitor),            intent(in)  :: monitor
            real(kind=c_float), optional, intent(out) :: xscale, yscale

            call c_glfwGetMonitorContentScale(monitor%handle, xscale, yscale)
        end subroutine glfwGetMonitorContentScale

        function glfwGetMonitorName(monitor) result(name)
            implicit none
            type(GLFWmonitor), intent(in) :: monitor
            character(len=:), pointer     :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetMonitorName(monitor%handle)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name, c_strlen(c_name))
            else
                nullify(name)
            end if
        end function glfwGetMonitorName

        subroutine glfwSetMonitorUserPointer(monitor, user_pointer)
            implicit none
            type(GLFWmonitor), intent(in) :: monitor
            type(c_ptr),       intent(in) :: user_pointer

            call c_glfwSetMonitorUserPointer(monitor%handle, user_pointer)
        end subroutine glfwSetMonitorUserPointer

        function glfwGetMonitorUserPointer(monitor) result(user_pointer)
            implicit none
            type(GLFWmonitor), intent(in) :: monitor
            type(c_ptr)                   :: user_pointer

            user_pointer = c_glfwGetMonitorUserPointer(monitor%handle)
        end function glfwGetMonitorUserPointer

        subroutine glfwSetMonitorCallback(callback, prev_callback)
            implicit none
            procedure(GLFWmonitorfun), optional :: callback
            procedure(GLFWmonitorfun), pointer, optional, intent(out) :: prev_callback

            type(c_funptr) :: unused

            if (present(prev_callback)) prev_callback => glf90wMonitorCallback
            if (present(callback)) then
                unused = c_glfwSetMonitorCallback(c_funloc(glf90wMonitorWrapper))
                glf90wMonitorCallback => callback
            else
                unused = c_glfwSetMonitorCallback(c_null_funptr)
                nullify(glf90wMonitorCallback)
            end if
        end subroutine glfwSetMonitorCallback

        function glfwGetVideoModes(monitor) result(vidmodes)
            implicit none
            type(GLFWmonitor), intent(in)            :: monitor
            type(GLFWvidmode), dimension(:), pointer :: vidmodes

            type(c_ptr) :: c_vidmodes
            integer(kind=c_int) :: count

            c_vidmodes = c_glfwGetVideoModes(monitor%handle, count)
            if (c_associated(c_vidmodes)) then
                call c_f_pointer(c_vidmodes, vidmodes, [count])
            else
                nullify(vidmodes)
            end if
        end function glfwGetVideoModes

        function glfwGetVideoMode(monitor) result(vidmode)
            implicit none
            type(GLFWmonitor), intent(in) :: monitor
            type(GLFWvidmode), pointer    :: vidmode

            type(c_ptr) :: c_vidmode

            c_vidmode = c_glfwGetVideoMode(monitor%handle)
            if (c_associated(c_vidmode)) then
                call c_f_pointer(c_vidmode, vidmode)
            else
                nullify(vidmode)
            end if
        end function glfwGetVideoMode

        subroutine glfwSetGamma(monitor, gamma_val)
            implicit none
            type(GLFWmonitor),  intent(in) :: monitor
            real(kind=c_float), intent(in) :: gamma_val

            call c_glfwSetGamma(monitor%handle, gamma_val)
        end subroutine glfwSetGamma

        function glfwGetGammaRamp(monitor) result(gammaramp)
            implicit none
            type(GLFWmonitor), intent(in) :: monitor
            type(GLFWgammaramp), pointer  :: gammaramp

            type(c_ptr) :: c_gammaramp

            c_gammaramp = c_glfwGetGammaRamp(monitor%handle)
            if (c_associated(c_gammaramp)) then
                call c_f_pointer(c_gammaramp, gammaramp)
            else
                nullify(gammaramp)
            end if
        end function glfwGetGammaRamp

        subroutine glfwSetGammaRamp(monitor, gammaramp)
            implicit none
            type(GLFWmonitor),           intent(in) :: monitor
            type(GLFWgammaramp), target, intent(in) :: gammaramp

            call c_glfwSetGammaRamp(monitor%handle, c_loc(gammaramp))
        end subroutine glfwSetGammaRamp

        subroutine glfwWindowHintString(hint, val)
            implicit none
            integer(kind=c_int),           intent(in) :: hint
            character(len=*, kind=c_char), intent(in) :: val

            call c_glfwWindowHintString(hint, f_c_string(val))
        end subroutine glfwWindowHintString

        function glfwCreateWindow(width, height, title, monitor, share) result(window)
            implicit none
            integer(kind=c_int),           intent(in) :: width, height
            character(len=*, kind=c_char), intent(in) :: title
            type(GLFWmonitor), optional,   intent(in) :: monitor
            type(GLFWwindow),  optional,   intent(in) :: share
            type(GLFWwindow)                          :: window

            type(GLF90Wwindow), pointer :: new_window
            type(c_ptr) :: c_monitor, c_share, c_window
            c_monitor = c_null_ptr
            c_share = c_null_ptr

            if (present(monitor)) c_monitor = monitor%handle
            if (present(share)) c_share = share%handle%handle

            c_window = c_glfwCreateWindow(width, height, f_c_string(title), c_monitor, c_share)
            if (c_associated(c_window)) then
                allocate(new_window)
                new_window = GLF90Wwindow(handle = c_window)
                new_window%next => window_list_head
                window_list_head => new_window

                window = GLFWwindow(handle = new_window)
            end if
        end function glfwCreateWindow

        subroutine glfwDestroyWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(GLF90Wwindow), pointer :: current, previous
            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwDestroyWindow(c_window)

            current => window_list_head
            previous => null()
            do
                if (.not. associated(current)) exit

                if (associated(window%handle, current)) then
                    if (associated(previous)) then
                        previous%next => current%next
                    else
                        window_list_head => current%next
                    end if
                    deallocate(current)
                    exit
                end if
                previous => current
                current => current%next
            end do
        end subroutine glfwDestroyWindow

        function glfwWindowShouldClose(window) result(closeflag)
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical                      :: closeflag

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            closeflag = merge(.false., .true., c_glfwWindowShouldClose(c_window) == GLFW_FALSE)
        end function glfwWindowShouldClose

        subroutine glfwSetWindowShouldClose(window, val)
            implicit none
            type(GLFWwindow), intent(in) :: window
            logical,          intent(in) :: val

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowShouldClose(c_window, merge(GLFW_TRUE, GLFW_FALSE, val))
        end subroutine glfwSetWindowShouldClose

        function glfwGetWindowTitle(window) result(title)
            implicit none
            type(GLFWwindow), intent(in) :: window
            character(len=:), pointer    :: title

            type(c_ptr) :: c_title
            type(c_ptr) :: c_window

            c_window = window%handle%handle
            c_title = c_glfwGetWindowTitle(c_window)
            if (c_associated(c_title)) then
                call c_f_strpointer(c_title, title, c_strlen(c_title))
            else
                nullify(title)
            end if
        end function glfwGetWindowTitle

        subroutine glfwSetWindowTitle(window, title)
            implicit none
            type(GLFWwindow),              intent(in) :: window
            character(len=*, kind=c_char), intent(in) :: title

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowTitle(c_window, f_c_string(title))
        end subroutine glfwSetWindowTitle

        subroutine glfwSetWindowIcon(window, images)
            implicit none
            type(GLFWwindow),                                intent(in) :: window
            type(GLFWimage), dimension(:), target, optional, intent(in) :: images
            type(c_ptr) :: c_window

            ! Image data is copied by GLFW so okay to c_loc the dummy argument
            c_window = window%handle%handle
            if (present(images)) then
                call c_glfwSetWindowIcon(c_window, size(images), c_loc(images))
            else
                call c_glfwSetWindowIcon(c_window, 0, c_null_ptr)
            end if
        end subroutine glfwSetWindowIcon

        subroutine glfwGetWindowPos(window, x, y)
            implicit none
            type(GLFWwindow),              intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: x, y

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetWindowPos(c_window, x, y)
        end subroutine glfwGetWindowPos

        subroutine glfwSetWindowPos(window, x, y)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: x, y

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowPos(c_window, x, y)
        end subroutine glfwSetWindowPos

        subroutine glfwGetWindowSize(window, width, height)
            implicit none
            type(GLFWwindow),              intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetWindowSize(c_window, width, height)
        end subroutine glfwGetWindowSize

        subroutine glfwSetWindowSizeLimits(window, minwidth, minheight, maxwidth, maxheight)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: minwidth, minheight, maxwidth, maxheight

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowSizeLimits(c_window, minwidth, minheight, maxwidth, maxheight)
        end subroutine glfwSetWindowSizeLimits

        subroutine glfwSetWindowAspectRatio(window, numer, denom)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: numer, denom

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowAspectRatio(c_window, numer, denom)
        end subroutine glfwSetWindowAspectRatio

        subroutine glfwSetWindowSize(window, width, height)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: width, height

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowSize(c_window, width, height)
        end subroutine glfwSetWindowSize

        subroutine glfwGetFramebufferSize(window, width, height)
            implicit none
            type(GLFWwindow),              intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetFramebufferSize(c_window, width, height)
        end subroutine glfwGetFramebufferSize

        subroutine glfwGetWindowFrameSize(window, left, top, right, bottom)
            implicit none
            type(GLFWwindow),              intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: left, top, right, bottom

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetWindowFrameSize(c_window, left, top, right, bottom)
        end subroutine glfwGetWindowFrameSize

        subroutine glfwGetWindowContentScale(window, xscale, yscale)
            implicit none
            type(GLFWwindow),             intent(in)  :: window
            real(kind=c_float), optional, intent(out) :: xscale, yscale

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetWindowContentScale(c_window, xscale, yscale)
        end subroutine glfwGetWindowContentScale

        function glfwGetWindowOpacity(window) result(opacity)
            implicit none
            type(GLFWwindow), intent(in) :: window
            real(kind=c_float)           :: opacity

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            opacity = c_glfwGetWindowOpacity(c_window)
        end function glfwGetWindowOpacity

        subroutine glfwSetWindowOpacity(window, opacity)
            implicit none
            type(GLFWwindow),   intent(in) :: window
            real(kind=c_float), intent(in) :: opacity

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowOpacity(c_window, opacity)
        end subroutine glfwSetWindowOpacity

        subroutine glfwIconifyWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwIconifyWindow(c_window)
        end subroutine glfwIconifyWindow

        subroutine glfwRestoreWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwRestoreWindow(c_window)
        end subroutine glfwRestoreWindow

        subroutine glfwMaximizeWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwMaximizeWindow(c_window)
        end subroutine glfwMaximizeWindow

        subroutine glfwShowWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwShowWindow(c_window)
        end subroutine glfwShowWindow

        subroutine glfwHideWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwHideWindow(c_window)
        end subroutine glfwHideWindow

        subroutine glfwFocusWindow(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwFocusWindow(c_window)
        end subroutine glfwFocusWindow

        subroutine glfwRequestWindowAttention(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwRequestWindowAttention(c_window)
        end subroutine glfwRequestWindowAttention

        function glfwGetWindowMonitor(window) result(monitor)
            implicit none
            type(GLFWwindow), intent(in) :: window
            type(GLFWmonitor)            :: monitor

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            monitor = GLFWmonitor(handle = c_glfwGetWindowMonitor(c_window))
        end function glfwGetWindowMonitor

        subroutine glfwSetWindowMonitor(window, monitor, x, y, width, height, refresh_rate)
            implicit none
            type(GLFWwindow),            intent(in) :: window
            type(GLFWmonitor), optional, intent(in) :: monitor
            integer(kind=c_int),         intent(in) :: x, y, width, height, refresh_rate

            type(c_ptr) :: c_monitor
            type(c_ptr) :: c_window

            c_monitor = c_null_ptr
            if (present(monitor)) c_monitor = monitor%handle

            c_window = window%handle%handle
            call c_glfwSetWindowMonitor(c_window, c_monitor, x, y, width, height, refresh_rate)
        end subroutine glfwSetWindowMonitor

        function glfwGetWindowAttrib(window, attrib) result(val)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: attrib
            integer(kind=c_int)             :: val

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            val = c_glfwGetWindowAttrib(c_window, attrib)
        end function glfwGetWindowAttrib

        subroutine glfwSetWindowAttrib(window, attrib, val)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: attrib
            integer(kind=c_int), intent(in) :: val

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowAttrib(c_window, attrib, val)
        end subroutine glfwSetWindowAttrib

        subroutine glfwSetWindowUserPointer(window, user_pointer)
            implicit none
            type(GLFWwindow), intent(in) :: window
            type(c_ptr),      intent(in) :: user_pointer

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetWindowUserPointer(c_window, user_pointer)
        end subroutine glfwSetWindowUserPointer

        function glfwGetWindowUserPointer(window) result(user_pointer)
            implicit none
            type(GLFWwindow), intent(in) :: window
            type(c_ptr)                  :: user_pointer

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            user_pointer = c_glfwGetWindowUserPointer(c_window)
        end function glfwGetWindowUserPointer

        subroutine glfwSetWindowPosCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)          :: window
            procedure(GLFWwindowposfun), optional :: callback
            procedure(GLFWwindowposfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%pos
            if (present(callback)) then
                unused = c_glfwSetWindowPosCallback(c_window, c_funloc(glf90wWindowPosWrapper))
                window%handle%pos => callback
            else
                unused = c_glfwSetWindowPosCallback(c_window, c_null_funptr)
                window%handle%pos => null()
            end if
        end subroutine glfwSetWindowPosCallback

        subroutine glfwSetWindowSizeCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)           :: window
            procedure(GLFWwindowsizefun), optional :: callback
            procedure(GLFWwindowsizefun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%size
            if (present(callback)) then
                unused = c_glfwSetWindowSizeCallback(c_window, c_funloc(glf90wWindowSizeWrapper))
                window%handle%size => callback
            else
                unused = c_glfwSetWindowSizeCallback(c_window, c_null_funptr)
                window%handle%size => null()
            end if
        end subroutine glfwSetWindowSizeCallback

        subroutine glfwSetWindowCloseCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)            :: window
            procedure(GLFWwindowclosefun), optional :: callback
            procedure(GLFWwindowclosefun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%close
            if (present(callback)) then
                unused = c_glfwSetWindowCloseCallback(c_window, c_funloc(glf90wWindowCloseWrapper))
                window%handle%close => callback
            else
                unused = c_glfwSetWindowCloseCallback(c_window, c_null_funptr)
                window%handle%close => null()
            end if
        end subroutine glfwSetWindowCloseCallback

        subroutine glfwSetWindowRefreshCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)              :: window
            procedure(GLFWwindowrefreshfun), optional :: callback
            procedure(GLFWwindowrefreshfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%refresh
            if (present(callback)) then
                unused = c_glfwSetWindowRefreshCallback(c_window, c_funloc(glf90wWindowRefreshWrapper))
                window%handle%refresh => callback
            else
                unused = c_glfwSetWindowRefreshCallback(c_window, c_null_funptr)
                window%handle%refresh => null()
            end if
        end subroutine glfwSetWindowRefreshCallback

        subroutine glfwSetWindowFocusCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)            :: window
            procedure(GLFWwindowfocusfun), optional :: callback
            procedure(GLFWwindowfocusfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%focus
            if (present(callback)) then
                unused = c_glfwSetWindowFocusCallback(c_window, c_funloc(glf90wWindowFocusWrapper))
                window%handle%focus => callback
            else
                unused = c_glfwSetWindowFocusCallback(c_window, c_null_funptr)
                window%handle%focus => null()
            end if
        end subroutine glfwSetWindowFocusCallback

        subroutine glfwSetWindowIconifyCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)              :: window
            procedure(GLFWwindowiconifyfun), optional :: callback
            procedure(GLFWwindowiconifyfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%iconify
            if (present(callback)) then
                unused = c_glfwSetWindowIconifyCallback(c_window, c_funloc(glf90wWindowIconifyWrapper))
                window%handle%iconify => callback
            else
                unused = c_glfwSetWindowIconifyCallback(c_window, c_null_funptr)
                window%handle%iconify => null()
            end if
        end subroutine glfwSetWindowIconifyCallback

        subroutine glfwSetWindowMaximizeCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)               :: window
            procedure(GLFWwindowmaximizefun), optional :: callback
            procedure(GLFWwindowmaximizefun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%maximize
            if (present(callback)) then
                unused = c_glfwSetWindowMaximizeCallback(c_window, c_funloc(glf90wWindowMaximizeWrapper))
                window%handle%maximize => callback
            else
                unused = c_glfwSetWindowMaximizeCallback(c_window, c_null_funptr)
                window%handle%maximize => null()
            end if
        end subroutine glfwSetWindowMaximizeCallback

        subroutine glfwSetFramebufferSizeCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)                :: window
            procedure(GLFWframebuffersizefun), optional :: callback
            procedure(GLFWframebuffersizefun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%framebuffer_size
            if (present(callback)) then
                unused = c_glfwSetFramebufferSizeCallback(c_window, c_funloc(glf90wFramebufferSizeWrapper))
                window%handle%framebuffer_size => callback
            else
                unused = c_glfwSetFramebufferSizeCallback(c_window, c_null_funptr)
                window%handle%framebuffer_size => null()
            end if
        end subroutine glfwSetFramebufferSizeCallback

        subroutine glfwSetWindowContentScaleCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)                   :: window
            procedure(GLFWwindowcontentscalefun), optional :: callback
            procedure(GLFWwindowcontentscalefun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%content_scale
            if (present(callback)) then
                unused = c_glfwSetWindowContentScaleCallback(c_window, c_funloc(glf90wWindowContentScaleWrapper))
                window%handle%content_scale => callback
            else
                unused = c_glfwSetWindowContentScaleCallback(c_window, c_null_funptr)
                window%handle%content_scale => null()
            end if
        end subroutine glfwSetWindowContentScaleCallback

        function glfwGetInputMode(window, mode) result(val)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: mode
            integer(kind=c_int)             :: val

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            val = c_glfwGetInputMode(c_window, mode)
        end function glfwGetInputMode

        subroutine glfwSetInputMode(window, mode, val)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: mode
            integer(kind=c_int), intent(in) :: val

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetInputMode(c_window, mode, val)
        end subroutine glfwSetInputMode

        function glfwRawMouseMotionSupported() result(supported)
            implicit none
            logical :: supported

            supported = merge(.false., .true., c_glfwRawMouseMotionSupported() == GLFW_FALSE)
        end function glfwRawMouseMotionSupported

        function glfwGetKeyName(key, scancode) result(name)
            implicit none
            integer(kind=c_int), intent(in)        :: key
            integer(kind=c_int), intent(in)        :: scancode
            character(len=:, kind=c_char), pointer :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetKeyName(key, scancode)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name, c_strlen(c_name))
            else
                nullify(name)
            end if
        end function glfwGetKeyName

        function glfwGetKey(window, key) result(status)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: key
            integer(kind=c_int)             :: status

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            status = c_glfwGetKey(c_window, key)
        end function glfwGetKey

        function glfwGetMouseButton(window, button) result(status)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            integer(kind=c_int), intent(in) :: button
            integer(kind=c_int)             :: status

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            status = c_glfwGetMouseButton(c_window, button)
        end function glfwGetMouseButton

        subroutine glfwGetCursorPos(window, x, y)
            implicit none
            type(GLFWwindow),              intent(in)  :: window
            real(kind=c_double), optional, intent(out) :: x, y

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwGetCursorPos(c_window, x, y)
        end subroutine glfwGetCursorPos

        subroutine glfwSetCursorPos(window, x, y)
            implicit none
            type(GLFWwindow),    intent(in) :: window
            real(kind=c_double), intent(in) :: x, y

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSetCursorPos(c_window, x, y)
        end subroutine glfwSetCursorPos

        function glfwCreateCursor(image, xhot, yhot) result(cursor)
            implicit none
            type(GLFWimage), target, intent(in) :: image
            integer(kind=c_int),     intent(in) :: xhot, yhot
            type(GLFWcursor)                    :: cursor

            ! Image data is copied by GLFW so okay to c_loc the dummy argument
            cursor = GLFWcursor(handle = c_glfwCreateCursor(c_loc(image), xhot, yhot))
        end function glfwCreateCursor

        function glfwCreateStandardCursor(cursor_shape) result(cursor)
            implicit none
            integer(kind=c_int), intent(in) :: cursor_shape
            type(GLFWcursor)                :: cursor

            cursor = GLFWcursor(handle = c_glfwCreateStandardCursor(cursor_shape))
        end function glfwCreateStandardCursor

        subroutine glfwDestroyCursor(cursor)
            implicit none
            type(GLFWcursor), intent(in) :: cursor

            call c_glfwDestroyCursor(cursor%handle)
        end subroutine glfwDestroyCursor

        subroutine glfwSetCursor(window, cursor)
            implicit none
            type(GLFWwindow), intent(in) :: window
            type(GLFWcursor), optional, intent(in) :: cursor

            type(c_ptr) :: c_cursor
            type(c_ptr) :: c_window

            c_cursor = c_null_ptr
            if (present(cursor)) c_cursor = cursor%handle

            c_window = window%handle%handle
            call c_glfwSetCursor(c_window, c_cursor)
        end subroutine glfwSetCursor

        subroutine glfwSetKeyCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)     :: window
            procedure(GLFWkeyfun), optional  :: callback
            procedure(GLFWkeyfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%key
            if (present(callback)) then
                unused = c_glfwSetKeyCallback(c_window, c_funloc(glf90wKeyWrapper))
                window%handle%key => callback
            else
                unused = c_glfwSetKeyCallback(c_window, c_null_funptr)
                window%handle%key => null()
            end if
        end subroutine glfwSetKeyCallback

        subroutine glfwSetCharCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)     :: window
            procedure(GLFWcharfun), optional :: callback
            procedure(GLFWcharfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%char
            if (present(callback)) then
                unused = c_glfwSetCharCallback(c_window, c_funloc(glf90wCharWrapper))
                window%handle%char => callback
            else
                unused = c_glfwSetCharCallback(c_window, c_null_funptr)
                window%handle%char => null()
            end if
        end subroutine glfwSetCharCallback

        subroutine glfwSetCharModsCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)         :: window
            procedure(GLFWcharmodsfun), optional :: callback
            procedure(GLFWcharmodsfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%mods
            if (present(callback)) then
                unused = c_glfwSetCharModsCallback(c_window, c_funloc(glf90wCharModsWrapper))
                window%handle%mods => callback
            else
                unused = c_glfwSetCharModsCallback(c_window, c_null_funptr)
                window%handle%mods => null()
            end if
        end subroutine glfwSetCharModsCallback

        subroutine glfwSetMouseButtonCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)            :: window
            procedure(GLFWmousebuttonfun), optional :: callback
            procedure(GLFWmousebuttonfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%mouse
            if (present(callback)) then
                unused = c_glfwSetMouseButtonCallback(c_window, c_funloc(glf90wMouseButtonWrapper))
                window%handle%mouse => callback
            else
                unused = c_glfwSetMouseButtonCallback(c_window, c_null_funptr)
                window%handle%mouse => null()
            end if
        end subroutine glfwSetMouseButtonCallback

        subroutine glfwSetCursorPosCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)          :: window
            procedure(GLFWcursorposfun), optional :: callback
            procedure(GLFWcursorposfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%cursor_pos
            if (present(callback)) then
                unused = c_glfwSetCursorPosCallback(c_window, c_funloc(glf90wCursorPosWrapper))
                window%handle%cursor_pos => callback
            else
                unused = c_glfwSetCursorPosCallback(c_window, c_null_funptr)
                window%handle%cursor_pos => null()
            end if
        end subroutine glfwSetCursorPosCallback

        subroutine glfwSetCursorEnterCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)            :: window
            procedure(GLFWcursorenterfun), optional :: callback
            procedure(GLFWcursorenterfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%cursor_enter
            if (present(callback)) then
                unused = c_glfwSetCursorEnterCallback(c_window, c_funloc(glf90wCursorEnterWrapper))
                window%handle%cursor_enter => callback
            else
                unused = c_glfwSetCursorEnterCallback(c_window, c_null_funptr)
                window%handle%cursor_enter => null()
            end if
        end subroutine glfwSetCursorEnterCallback

        subroutine glfwSetScrollCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)       :: window
            procedure(GLFWscrollfun), optional :: callback
            procedure(GLFWscrollfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%scroll
            if (present(callback)) then
                unused = c_glfwSetScrollCallback(c_window, c_funloc(glf90wScrollWrapper))
                window%handle%scroll => callback
            else
                unused = c_glfwSetScrollCallback(c_window, c_null_funptr)
                window%handle%scroll => null()
            end if
        end subroutine glfwSetScrollCallback

        subroutine glfwSetDropCallback(window, callback, prev_callback)
            implicit none
            type(GLFWwindow), intent(in)     :: window
            procedure(GLFWdropfun), optional :: callback
            procedure(GLFWdropfun), pointer, optional, intent(out) :: prev_callback

            type(c_ptr) :: c_window
            type(c_funptr) :: unused

            c_window = window%handle%handle
            if (present(prev_callback)) prev_callback => window%handle%drop
            if (present(callback)) then
                unused = c_glfwSetDropCallback(c_window, c_funloc(glf90wDropWrapper))
                window%handle%drop => callback
            else
                unused = c_glfwSetDropCallback(c_window, c_null_funptr)
                window%handle%drop => null()
            end if
        end subroutine glfwSetDropCallback

        function glfwJoystickPresent(jid) result(is_present)
            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: is_present

            is_present = merge(.false., .true., c_glfwJoystickPresent(jid) == GLFW_FALSE)
        end function glfwJoystickPresent

        function glfwGetJoystickAxes(jid) result(axes)
            implicit none
            integer(kind=c_int), intent(in)           :: jid
            real(kind=c_float), dimension(:), pointer :: axes

            type(c_ptr) :: c_axes
            integer(kind=c_int) :: count
            count = 0

            c_axes = c_glfwGetJoystickAxes(jid, count)
            if (c_associated(c_axes) .AND. count > 0) then
                call c_f_pointer(c_axes, axes, [count])
            else
                nullify(axes)
            end if
        end function glfwGetJoystickAxes

        function glfwGetJoystickButtons(jid) result(states)
            implicit none
            integer(kind=c_int), intent(in)               :: jid
            character(kind=c_char), dimension(:), pointer :: states

            integer(kind=c_int) :: count
            type(c_ptr) :: c_states

            c_states = c_glfwGetJoystickButtons(jid, count)
            if (c_associated(c_states) .AND. count > 0) then
                call c_f_pointer(c_states, states, [count])
            else
                nullify(states)
            end if
        end function glfwGetJoystickButtons

        function glfwGetJoystickHats(jid) result(states)
            implicit none
            integer(kind=c_int), intent(in)               :: jid
            character(kind=c_char), dimension(:), pointer :: states

            integer(kind=c_int) :: count
            type(c_ptr) :: c_states

            c_states = c_glfwGetJoystickHats(jid, count)
            if (c_associated(c_states) .AND. count > 0) then
                call c_f_pointer(c_states, states, [count])
            else
                nullify(states)
            end if
        end function glfwGetJoystickHats

        function glfwGetJoystickName(jid) result(name)
            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetJoystickName(jid)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name, c_strlen(c_name))
            else
                nullify(name)
            end if
        end function glfwGetJoystickName

        function glfwGetJoystickGUID(jid) result(guid)
            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: guid

            type(c_ptr) :: c_guid

            c_guid = c_glfwGetJoystickGUID(jid)
            if (c_associated(c_guid)) then
                call c_f_strpointer(c_guid, guid, c_strlen(c_guid))
            else
                nullify(guid)
            end if
        end function glfwGetJoystickGUID

        function glfwJoystickIsGamepad(jid) result(is_gamepad)
            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: is_gamepad

            is_gamepad = merge(.false., .true., c_glfwJoystickIsGamepad(jid) == GLFW_FALSE)
        end function glfwJoystickIsGamepad

        subroutine glfwSetJoystickCallback(callback, prev_callback)
            implicit none
            procedure(GLFWjoystickfun), optional :: callback
            procedure(GLFWjoystickfun), pointer, optional, intent(out) :: prev_callback

            type(c_funptr) :: unused

            if (present(prev_callback)) prev_callback => glf90wJoystickCallback
            if (present(callback)) then
                unused = c_glfwSetJoystickCallback(c_funloc(glf90wJoystickWrapper))
                glf90wJoystickCallback => callback
            else
                unused = c_glfwSetJoystickCallback(c_null_funptr)
                glf90wJoystickCallback => null()
            end if
        end subroutine glfwSetJoystickCallback

        function glfwUpdateGamepadMappings(mappings) result(success)
            implicit none
            character(len=*, kind=c_char), intent(in) :: mappings
            logical                                   :: success

            success = merge(.false., .true., c_glfwUpdateGamepadMappings(f_c_string(mappings)) == GLFW_FALSE)
        end function glfwUpdateGamepadMappings

        function glfwGetGamepadName(jid) result(name)
            implicit none
            integer(kind=c_int), intent(in)        :: jid
            character(len=:, kind=c_char), pointer :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetGamepadName(jid)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name, c_strlen(c_name))
            else
                nullify(name)
            end if
        end function glfwGetGamepadName

        function glfwGetGamepadState(jid, state) result(success)
            implicit none
            integer(kind=c_int), intent(in) :: jid
            type(GLFWgamepadstate)          :: state
            logical                         :: success

            success = merge(.false., .true., c_glfwGetGamepadState(jid, state) == GLFW_FALSE)
        end function glfwGetGamepadState

        subroutine glfwSetClipboardString(window, string)
            implicit none
            type(GLFWwindow), optional,    intent(in) :: window
            character(len=*, kind=c_char), intent(in) :: string

            type(c_ptr) :: c_window
            c_window = c_null_ptr

            if (present(window)) c_window = window%handle%handle
            call c_glfwSetClipboardString(c_window, f_c_string(string))
        end subroutine glfwSetClipboardString

        function glfwGetClipboardString(window) result(string)
            implicit none
            type(GLFWwindow), optional, intent(in) :: window
            character(len=:, kind=c_char), pointer :: string

            type(c_ptr) :: c_window
            type(c_ptr) :: c_string

            c_window = c_null_ptr
            if (present(window)) c_window = window%handle%handle

            c_string = c_glfwGetClipboardString(c_window)
            if (c_associated(c_string)) then
                call c_f_strpointer(c_string, string, c_strlen(c_string))
            else
                nullify(string)
            end if
        end function glfwGetClipboardString

        subroutine glfwMakeContextCurrent(window)
            implicit none
            type(GLFWwindow), optional, intent(in) :: window

            type(c_ptr) :: c_window

            if (present(window)) then
                c_window = window%handle%handle
                call c_glfwMakeContextCurrent(c_window)
            else
                call c_glfwMakeContextCurrent(c_null_ptr)
            end if
        end subroutine glfwMakeContextCurrent

        function glfwGetCurrentContext() result(window)
            implicit none
            type(GLFWwindow) :: window
            
            type(c_ptr) :: c_window

            c_window = c_glfwGetCurrentContext()
            window = GLFWwindow(handle = find_window(c_window))
        end function glfwGetCurrentContext

        subroutine glfwSwapBuffers(window)
            implicit none
            type(GLFWwindow), intent(in) :: window

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            call c_glfwSwapBuffers(c_window)
        end subroutine glfwSwapBuffers

        function glfwExtensionSupported(extension) result(supported)
            implicit none
            character(len=*, kind=c_char), intent(in) :: extension
            logical                                   :: supported

            supported = merge(.false., .true., c_glfwExtensionSupported(f_c_string(extension)) == GLFW_FALSE)
        end function glfwExtensionSupported

        function glfwGetProcAddress(procname) result(procaddr)
            implicit none
            character(len=*, kind=c_char), intent(in) :: procname
            type(c_funptr)                            :: procaddr

            procaddr = c_glfwGetProcAddress(f_c_string(procname))
        end function glfwGetProcAddress

        function glfwVulkanSupported() result(supported)
            implicit none
            logical :: supported

            supported = merge(.false., .true., c_glfwVulkanSupported() == GLFW_FALSE)
        end function glfwVulkanSupported

#if defined(VK_VERSION_1_0)
        function glfwGetInstanceProcAddress(instance, procname) result(procaddr)
            implicit none
            type(c_ptr),                   intent(in) :: instance
            character(len=*, kind=c_char), intent(in) :: procname
            type(c_funptr)                            :: procaddr

            procaddr = c_glfwGetInstanceProcAddress(instance, f_c_string(procname))
        end function glfwGetInstanceProcAddress

        function glfwGetPhysicalDevicePresentationSupport(instance, device, queuefamily) result(supported)
            implicit none
            type(c_ptr),             intent(in) :: instance
            type(c_ptr),             intent(in) :: device
            integer(kind=c_int32_t), intent(in) :: queuefamily
            logical                             :: supported

            supported = merge(.false., .true., &
                c_glfwGetPhysicalDevicePresentationSupport(instance, device, queuefamily) == GLFW_FALSE)
        end function glfwGetPhysicalDevicePresentationSupport

        ! TODO Vulkan types for allocator, surface, and result? 
        ! But also opaque pointer types for instance, device and what-not?
        ! This asks for a whole Vulkan Fortran binding OMG
        function glfwCreateWindowSurface(instance, window, allocator, surface) result(res)
            implicit none
            type(c_ptr), intent(in) :: instance
            type(GLFWwindow), intent(in) :: window
            type(c_ptr), optional, intent(in) :: allocator
            type(c_ptr), intent(in) :: surface
            integer(kind=c_int) :: res

            type(c_ptr) :: c_window

            c_window = window%handle%handle
            if (present(allocator)) then
                res = c_glfwCreateWindowSurface(instance, c_window, allocator, surface)
            else
                res = c_glfwCreateWindowSurface(instance, c_window, c_null_ptr, surface)
            end if
        end function glfwCreateWindowSurface
#endif

        function glfwGetRequiredInstanceExtensions() result(names)
            implicit none
            character(len=:, kind=c_char), dimension(:), allocatable :: names

            type(c_ptr) :: c_names
            integer(kind=c_int) :: count
            type(c_ptr), dimension(:), pointer :: c_array
            character(len=:, kind=c_char), pointer :: ptr
            integer(kind=c_size_t) :: max_length
            integer(kind=c_int) :: i

            c_names = c_glfwGetRequiredInstanceExtensions(count)
            if (count > 0) then
                call c_f_pointer(c_names, c_array, [count])
                max_length = 0
                do i = 1, count
                    max_length = max(max_length, c_strlen(c_array(i)))
                end do

                allocate(character(len=max_length, kind=c_char) :: names(count))
                do i = 1, count
                    call c_f_strpointer(c_array(i), ptr, c_strlen(c_array(i)))
                    names(i) = ptr
                end do
            end if
        end function glfwGetRequiredInstanceExtensions


        ! ----------------------------------------------------------------------
        ! GLF90W Callback wrapper procedures
        ! ----------------------------------------------------------------------


        ! NOTE In principle, the wrappers are not associated to GLFW if the callbacks are NULL()
        ! Therefore there shouldn't be a need to check "associated(glf90wSomeCallback)"
        ! But remember to check here if something goes wrong (?)

        subroutine glf90wErrorWrapper(error_code, desc_ptr) bind(C)
            implicit none
            integer(kind=c_int), value, intent(in) :: error_code
            type(c_ptr),         value, intent(in) :: desc_ptr

            character(len=:, kind=c_char), pointer :: f_desc

            if (c_associated(desc_ptr)) then
                call c_f_strpointer(desc_ptr, f_desc, c_strlen(desc_ptr))
            else
                nullify(f_desc)
            end if

            call glf90wErrorCallback(error_code, f_desc)
        end subroutine glf90wErrorWrapper

        subroutine glf90wWindowPosWrapper(c_window, x, y) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: x, y

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%pos(GLFWwindow(handle = window), x, y)
        end subroutine glf90wWindowPosWrapper

        subroutine glf90wWindowSizeWrapper(c_window, width, height) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: width, height

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%size(GLFWwindow(handle = window), width, height)
        end subroutine glf90wWindowSizeWrapper

        subroutine glf90wWindowCloseWrapper(c_window) bind(C)
            implicit none
            type(c_ptr), value, intent(in) :: c_window

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%close(GLFWwindow(handle = window))
        end subroutine glf90wWindowCloseWrapper

        subroutine glf90wWindowRefreshWrapper(c_window) bind(C)
            implicit none
            type(c_ptr), value, intent(in) :: c_window

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%refresh(GLFWwindow(handle = window))
        end subroutine glf90wWindowRefreshWrapper

        subroutine glf90wWindowFocusWrapper(c_window, focused) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: focused

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%focus(GLFWwindow(handle = window), merge(.false., .true., focused == GLFW_FALSE))
        end subroutine glf90wWindowFocusWrapper

        subroutine glf90wWindowIconifyWrapper(c_window, iconified) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: iconified

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%iconify(GLFWwindow(handle = window), merge(.false., .true., iconified == GLFW_FALSE))
        end subroutine glf90wWindowIconifyWrapper

        subroutine glf90wWindowMaximizeWrapper(c_window, maximized) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: maximized

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%maximize(GLFWwindow(handle = window), merge(.false., .true., maximized == GLFW_FALSE))
        end subroutine glf90wWindowMaximizeWrapper

        subroutine glf90wFramebufferSizeWrapper(c_window, width, height) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: width, height

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%framebuffer_size(GLFWwindow(handle = window), width, height)
        end subroutine glf90wFramebufferSizeWrapper

        subroutine glf90wWindowContentScaleWrapper(c_window, xscale, yscale) bind(C)
            implicit none
            type(c_ptr),        value, intent(in) :: c_window
            real(kind=c_float), value, intent(in) :: xscale, yscale

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%content_scale(GLFWwindow(handle = window), xscale, yscale)
        end subroutine glf90wWindowContentScaleWrapper

        subroutine glf90wMouseButtonWrapper(c_window, button, action, mods) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: button, action, mods

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%mouse(GLFWwindow(handle = window), button, action, mods)
        end subroutine glf90wMouseButtonWrapper

        subroutine glf90wCursorPosWrapper(c_window, x, y)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            real(kind=c_double), value, intent(in) :: x, y

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%cursor_pos(GLFWwindow(handle = window), x, y)
        end subroutine glf90wCursorPosWrapper

        subroutine glf90wCursorEnterWrapper(c_window, entered) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: entered

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%cursor_enter(GLFWwindow(handle = window), merge(.false., .true., entered == GLFW_FALSE))
        end subroutine glf90wCursorEnterWrapper 

        subroutine glf90wScrollWrapper(c_window, xoffset, yoffset)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            real(kind=c_double), value, intent(in) :: xoffset, yoffset

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%scroll(GLFWwindow(handle = window), xoffset, yoffset)
        end subroutine glf90wScrollWrapper

        subroutine glf90wKeyWrapper(c_window, key, scancode, action, mods) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: key, scancode, action, mods

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%key(GLFWwindow(handle = window), key, scancode, action, mods)
        end subroutine glf90wKeyWrapper

        subroutine glf90wCharWrapper(c_window, codepoint) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: codepoint

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%char(GLFWwindow(handle = window), codepoint)
        end subroutine glf90wCharWrapper

        subroutine glf90wCharModsWrapper(c_window, codepoint, mods) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: c_window
            integer(kind=c_int), value, intent(in) :: codepoint, mods

            type(GLF90Wwindow), pointer :: window

            window => find_window(c_window)
            call window%mods(GLFWwindow(handle = window), codepoint, mods)
        end subroutine glf90wCharModsWrapper

        subroutine glf90wDropWrapper(c_window, path_count, paths) bind(C)
            implicit none
            type(c_ptr),         value,         intent(in) :: c_window
            integer(kind=c_int), value,         intent(in) :: path_count
            type(c_ptr), dimension(path_count), intent(in) :: paths

            type(GLF90Wwindow), pointer :: window
            character(len=:, kind=c_char), dimension(:), allocatable, target :: path_array
            character(len=:, kind=c_char), pointer :: ptr
            integer(kind=c_size_t) :: max_length
            integer :: i

            max_length = 0
            do i = 1, path_count
                max_length = max(max_length, c_strlen(paths(i)))
            end do

            allocate(character(len=max_length, kind=c_char) :: path_array(path_count))
            do i = 1, path_count
                call c_f_strpointer(paths(i), ptr, c_strlen(paths(i)))
                path_array(i) = ptr
            end do

            window => find_window(c_window)
            call window%drop(GLFWwindow(handle = window), path_array)
        end subroutine glf90wDropWrapper

        subroutine glf90wMonitorWrapper(monitor, event) bind(C)
            implicit none
            type(c_ptr),         value, intent(in) :: monitor
            integer(kind=c_int), value, intent(in) :: event

            call glf90wMonitorCallback(GLFWmonitor(handle = monitor), event)
        end subroutine glf90wMonitorWrapper


        subroutine glf90wJoystickWrapper(jid, event) bind(C)
            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int), value, intent(in) :: event

            call glf90wJoystickCallback(jid, event)
        end subroutine glf90wJoystickWrapper


        function find_window(c_window) result(glf90w_window)
            implicit none
            type(c_ptr), intent(in) :: c_window
            type(GLF90Wwindow), pointer :: glf90w_window

            glf90w_window => window_list_head
            do
                if (.not. associated(glf90w_window)) exit
                if (c_associated(glf90w_window%handle, c_window)) exit
                glf90w_window => glf90w_window%next
            end do
        end function find_window


        ! ----------------------------------------------------------------------
        ! GLF90W Pointer semantic for GLFW opaque pointer types
        ! ----------------------------------------------------------------------


        pure function associated_opaque(pointer, target) result(is_associated)
            implicit none
            class(c_opaque_ptr),           intent(in) :: pointer
            class(c_opaque_ptr), optional, intent(in) :: target
            logical                                   :: is_associated

            if (present(target)) then
                is_associated = c_associated(pointer%handle, target%handle)
            else
                is_associated = c_associated(pointer%handle)
            end if
        end function associated_opaque

        pure function associated_window(pointer, target) result(is_associated)
            implicit none
            class(GLFWwindow),           intent(in) :: pointer
            class(GLFWwindow), optional, intent(in) :: target
            logical                                 :: is_associated

            if (associated(pointer%handle)) then
                if (present(target)) then
                    if (associated(target%handle)) then
                        is_associated = c_associated(pointer%handle%handle, target%handle%handle)
                    else
                        is_associated = .false.
                    end if
                else
                    is_associated = c_associated(pointer%handle%handle)
                end if
            else
                is_associated = .false.
            end if
        end function associated_window


        ! ----------------------------------------------------------------------
        ! GLF90W C-interoperability procedures
        ! TODO: Clashes with Fortran 2023
        ! ----------------------------------------------------------------------

        ! Converts a Fortran character string to a C interoperable string (character array)
        pure function f_c_string(string, asis) result(c_string)
            implicit none
            character(len=*, kind=c_char), intent(in)                :: string
            logical, optional,             intent(in)                :: asis
            character(len=1, kind=c_char), dimension(:), allocatable :: c_string

            integer :: c_length
            integer :: i

            if (present(asis)) then
                if (asis) then
                    c_length = len(string) + 1
                else
                    c_length = len_trim(string) + 1
                end if
            else
                c_length = len_trim(string) + 1
            end if

            allocate(character(len=1, kind=c_char) :: c_string(c_length))
            ! Some compilers fail if simply doing string//c_null_char
            do i = 1, c_length-1
                c_string(i) = string(i:i)
            end do
            c_string(c_length) = c_null_char
        end function f_c_string

        ! Obtain a Fortran pointer to a C string (char*)
        subroutine c_f_strpointer(cstrptr, fstrptr, nchars)
            implicit none
            type(c_ptr), target,       intent(in)  :: cstrptr
            character(len=:), pointer, intent(out) :: fstrptr
            integer(kind=c_size_t),    intent(in)  :: nchars
            character(len=nchars, kind=c_char), pointer :: cstrarray

            call c_f_pointer(cstrptr, cstrarray)
            fstrptr => cstrarray
        end subroutine c_f_strpointer

end module glf90w
!! -----------------
!! GLF90W is provided under the zlib licence
!!
!! Copyright (C) 2024 Gaétan J.A.M. Jalin
!!
!! This software is provided 'as-is', without any express or implied
!! warranty.  In no event will the authors be held liable for any damages
!! arising from the use of this software.
!!
!! Permission is granted to anyone to use this software for any purpose,
!! including commercial applications, and to alter it and redistribute it
!! freely, subject to the following restrictions:
!!
!!    1. The origin of this software must not be misrepresented; you must not
!!    claim that you wrote the original software. If you use this software
!!    in a product, an acknowledgment in the product documentation would be
!!    appreciated but is not required.
!!
!!    2. Altered source versions must be plainly marked as such, and must not be
!!    misrepresented as being the original software.
!!
!!    3. This notice may not be removed or altered from any source distribution.
!! -----------------

