//

function onPlayerCommand( player, cmd, text ) {
  cmd = cmd.tolower();
  switch ( cmd ) {
  //FIXME: Group these 2
  case "color": {
    local v = player.Vehicle;
    if ( !v ) {
      MessagePlayer( "[#ff0000]You're not in any vehicle." ,player );
    } else if ( !text && !IsNum( text ) ) {
      MessagePlayer( "[#ff0000]Usage: /color <Colour1ID>" ,player );
    } else {
      v.Colour1 = text.tointeger();
    }
    //FIXME: Support colour 2
    break;
  }
  case "help":
    MessagePlayer("[#333380]/color", player);
    break;
  default:
    break;
  }
}
