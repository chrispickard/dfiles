/*
  Set any config.h overrides for your specific keymap here.
  See config.h options at https://docs.qmk.fm/#/config_options?id=the-configh-file
*/
#define ORYX_CONFIGURATOR
#undef DEBOUNCE
#define DEBOUNCE 75

#undef ONESHOT_TIMEOUT
#define ONESHOT_TIMEOUT 1

#define TAPPING_FORCE_HOLD

#define USB_SUSPEND_WAKEUP_DELAY 0
