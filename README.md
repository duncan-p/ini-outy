# ini-outy
Cloud save an in-game .ini file with Gamemaker Studio.

## Usage

Include the [cloudStore script](https://github.com/duncan-p/ini-outy/cloudStore.gml) in your GamemakerStudio project's `Scripts` directory.

The following game objects are an example of how this script may be used.

### oCloudEventHandler (object)
```
  Event: Cloud
  Execute script: cloudStore
  Argument0: "onEvent"
```

### oLogin (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: "login"
```

### oSave (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: "save"
  Argument1: "progress.ini"  /* name of save file (to write) */
  Argument2: "Current Progress"   /* description of save file */
  Argument3: "0|1|2|3|4|5|6|7|8|9"  /* progress data to save */
```

### oSync (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: "sync"
```

## Google Play Store

You will need to set up your app to allow Google Play Game Services by [following this guide](https://developers.google.com/games/services/android/quickstart#step_2_set_up_the_game_in_the_dev_console)


## iOS Game Center

1. Make sure you add the `Game Center` entitlement to your App ID (via Xcode or https://developer.apple.com).
2. Make sure you add the `GameKit` key to your plist file (again Xcode can handle this for you).
