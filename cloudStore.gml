/// Cloud Store

/*
 * Supported Actions:
 * login
 * logout
 * save(fileName, description, data)
 * sync
 * onEvent
 *
 * The first argument of this function MUST 
 * contain the CloudStoreAction.
 */
enum CloudStoreAction {
  login,
  logout,
  save,
  sync,
  event
};

/*
 * Note: `global.asyncId`  is used to 
 * track the active `async_load` id
 */
var /*CloudStoreAction*/ action = argument[0];

/* Handle the specified action */
switch (action)
{
  case CloudStoreAction.login:
    if !achievement_login_status() {
        achievement_login();
        show_debug_message("Cloud login requested");
    }
  break;
  
  case CloudStoreAction.logout:
    if achievement_login_status() {
        achievement_logout();
        show_debug_message("Cloud logout requested");
    }
  break;
  
  case CloudStoreAction.save:
    var /*string*/ fileName = string(argument[1]),
        /*string*/ description = string(argument[2]),
        /*string*/ data = string(argument[3]),
        /*real*/ file = file_text_open_write(fileName);

    file_text_write_string(file, data);
    file_text_close(file);
    global.asyncId = cloud_file_save(fileName, description);
    show_debug_message("Data saved to cloud: " + data);
  break;
  
  case CloudStoreAction.sync:
    global.asyncId = cloud_synchronise();
    show_debug_message("Cloud data sync requested");
  break;
  
  case CloudStoreAction.event:
    if global.asyncId == ds_map_find_value(async_load, "id")
    {
      var status = ds_map_find_value(async_load, "status");
      show_debug_message("CloudStore event received: Status " + string(status));
      switch (status) {
        case 0:
          show_debug_message("New game data downloaded from the cloud: " +
            ds_map_find_value(async_load, "description") +
            " = " +
             ds_map_find_value(async_load, "resultString")
          );
          var file = file_text_open_write("sync_received.txt");
          file_text_write_string(file, ds_map_find_value(async_load, "resultString"));
          file_text_close(file);
        break;
          
        case 1:
          show_debug_message("No new data since the last syncronization");
        break;
          
        case 2:
          show_debug_message("A syncronization conflict was encountered, but the gamer chose to ignore it");
        break;
          
        case 3:
          show_debug_message("Data successfully uploaded to the cloud");
        break;
          
        default:
          if status < 0
          {
            show_message_async(ds_map_find_value(async_load, "errorString"));
          }
      }
    }
  break;
  
  default:
    show_message_async("Cloud Store Warning: Unsupported Action");
}
