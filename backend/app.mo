import Int8 "mo:base/Int8";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Float "mo:base/Float";
import Iter "mo:base/Iter";

actor SpaceStationManager{
  public type Room = {
    name : Text;
    temperature : Int8;
    humidity: Int8;
    oxygen: Int8;
    radiation: Float;
};

var rooms = HashMap.HashMap<Text, Room>(8, Text.equal, Text.hash);

private func initializeRooms() {
    if (rooms.size() == 0) {
      rooms.put("kajuta_a", { 
        name = "Kajuta A"; 
        temperature = 22; 
        humidity = 45; 
        oxygen = 21; 
        radiation = 0.1 
      });
      rooms.put("kajuta_b", { 
        name = "Kajuta B"; 
        temperature = 20; 
        humidity = 50; 
        oxygen = 21; 
        radiation = 0.1 
      });
      rooms.put("kajuta_c", { 
        name = "Kajuta C"; 
        temperature = 21; 
        humidity = 48; 
        oxygen = 21; 
        radiation = 0.1 
      });
      rooms.put("oficerka", { 
        name = "Oficerka"; 
        temperature = 23; 
        humidity = 40; 
        oxygen = 21; 
        radiation = 0.2 
      });
      rooms.put("reaktor", { 
        name = "Reaktor"; 
        temperature = 80; 
        humidity = 30; 
        oxygen = 19; 
        radiation = 5.5 
      });
      rooms.put("panel_techniczny", { 
        name = "Panel Techniczny"; 
        temperature = 18; 
        humidity = 35; 
        oxygen = 21; 
        radiation = 0.3 
      });
      rooms.put("naped", { 
        name = "Napęd"; 
        temperature = 45; 
        humidity = 25; 
        oxygen = 20; 
        radiation = 1.2 
      });
      rooms.put("diagnostyka", { 
        name = "Diagnostyka"; 
        temperature = 19; 
        humidity = 42; 
        oxygen = 21; 
        radiation = 0.4 
      });
    };
  };

  initializeRooms();

  public query func getRoom(id: Text): async ?Room{
    rooms.get(id);
  };

  public query func getAllRooms() : async [(Text, Room)]{
    Iter.toArray(rooms.entries());
  };

  public func updateOxygen(id: Text, oxygen: Int8) : async Bool {
    switch (rooms.get(id)) {
      case null { false };
      case (?room) {
        let updatedRoom = {
          name = room.name;
          temperature = room.temperature;
          humidity = room.humidity;
          oxygen = oxygen;
          radiation = room.radiation;
        };
        rooms.put(id, updatedRoom);
        true;
      };
    };
  };

    public func updateHumidity(id: Text, humidity: Int8) : async Bool {
    switch (rooms.get(id)) {
      case null { false };
      case (?room) {
        let updatedRoom = {
          name = room.name;
          temperature = room.temperature;
          humidity = humidity;
          oxygen = room.oxygen;
          radiation = room.radiation;
        };
        rooms.put(id, updatedRoom);
        true;
      };
    };
  };

}