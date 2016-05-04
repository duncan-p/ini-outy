# ini-outy
Cloud save an in-game .ini file with Gamemaker Studio.

## Usage

Include the [cloudStore script](https://github.com/duncan-p/ini-outy/cloudStore.gml) in your GamemakerStudio project's `Scripts` directory.

The following game objects are an example of how this script may be used.

### oCloudEventHandler (object)
```
  Event: Cloud
  Execute script: cloudStore
  Argument0: CloudStoreAction.event
```

### oLogin (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: CloudStoreAction.login
```

### oSave (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: CloudStoreAction.save
  Argument1: "progress.ini"  /* name of save file (to write) */
  Argument2: "Current Progress"   /* description of save file */
```

### oSync (object)
```
  Event: LeftReleased
  Execute script: cloudStore
  Argument0: CloudStoreAction.sync
```

## Google Play Store

You will need to set up your app to allow Google Play Game Services by [following this guide](https://developers.google.com/games/services/android/quickstart#step_2_set_up_the_game_in_the_dev_console)


## Sample project

See the sample GameMaker Studio project for demo purposes.
