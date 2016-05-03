# ini-outy
Cloud save an in-game ini file with Gamemaker Studio.

## Usage

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

