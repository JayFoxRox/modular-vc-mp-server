teleporters <- {}
teleporters["bank"] <- Vector( -873.3062, -340.7981, 11.1026 );
teleporters["hotring"] <- Vector( -1409.717, 1144.97, 266.3857 + 1.0 );
teleporters["dirtring"] <- Vector( -1331.994, 1454.152, 298.15 + 1.0 );
teleporters["bloodring"] <- Vector(  -1280.96, 994.86, 261.8 + 1.0 );


function lookup_location(location) {
  local result = false;
  local location = location.tolower();

  if (location in teleporters) {
    return teleporters[location];
  }

  // Old garbage
  switch ( location ) {
  case "hz": {
    result = Vector( -376.7852, -521.1617, 12.7663 );
    break;
  }
  case "jd": {
    result = Vector( 232.2453, -1279.0906, 12.0712 );
    break;
  }
  case "cc": {
    result = Vector( -657.2713, -1478.9364, 13.8016 );
    break;
  }
  case "gd": {
    result = Vector( 335.7215,-233.5262,31.1983 );
    break;
  }
  case "jcj": {
    result = Vector( -658.3732,761.5365,11.5527 );
    break;
  }
  case "jy": {
    result = Vector( -1718.5946, -280.8699, 14.8683 );
    break;
  }
  case "dyy": {
    result = Vector( 7.0703, 964.4935, 10.4632 );
    break;
  }
  case "y": {
    result = Vector( 557.677, -886.057, 432.612 );
    break;
  } 
  default:
    break
  }
  return result;
}

function teleport(player, location) {
  local pos = lookup_location(location)
  if (pos == false) {
    return false;
  }
  TeleportPlayer(player, pos, 0)
  return true;
}


function onPlayerCommand( player, cmd, text ) {
  cmd = cmd.tolower()
  if(cmd == "t") {
    if (teleport(player, text)) {
      local message = "";
      foreach(location, position in teleporters) {
        message += " " + location
      }
      MessagePlayer("[#ff0000][Error] - Bad location. Try" + message, player);
    }
  }
  return 1
}
