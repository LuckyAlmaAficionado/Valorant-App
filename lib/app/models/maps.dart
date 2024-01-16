class ValorantMaps {
  String uuid;
  String displayName;
  String narrativeDescription;
  String tacticalDescription;
  String coordinates;
  String displayIcon;
  String listViewIcon;
  String listViewIconTall;
  String splash;
  String stylizedBackgroundImage;
  String premierBackgroundImage;
  String assetPath;
  String mapUrl;
  double xMultiplier;
  double yMultiplier;
  double xScalarToAdd;
  double yScalarToAdd;
  List<Callout> callouts;

  ValorantMaps({
    required this.uuid,
    required this.displayName,
    required this.narrativeDescription,
    required this.tacticalDescription,
    required this.coordinates,
    required this.displayIcon,
    required this.listViewIcon,
    required this.listViewIconTall,
    required this.splash,
    required this.stylizedBackgroundImage,
    required this.premierBackgroundImage,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
    required this.callouts,
  });

  factory ValorantMaps.fromJson(Map<String, dynamic> json) => ValorantMaps(
        uuid: json["uuid"] ?? '',
        displayName: json["displayName"] ?? '',
        narrativeDescription: json["narrativeDescription"] ?? '',
        tacticalDescription: json["tacticalDescription"] ?? '',
        coordinates: json["coordinates"] ?? '',
        displayIcon: json["displayIcon"] ?? '',
        listViewIcon: json["listViewIcon"] ?? '',
        listViewIconTall: json["listViewIconTall"] ?? '',
        splash: json["splash"] ?? '',
        stylizedBackgroundImage: json["stylizedBackgroundImage"] ?? '',
        premierBackgroundImage: json["premierBackgroundImage"] ?? '',
        assetPath: json["assetPath"] ?? '',
        mapUrl: json["mapUrl"] ?? '',
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: (json['callouts'] == null)
            ? []
            : List<Callout>.from(
                json["callouts"].map((x) => Callout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "tacticalDescription": tacticalDescription,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "listViewIconTall": listViewIconTall,
        "splash": splash,
        "stylizedBackgroundImage": stylizedBackgroundImage,
        "premierBackgroundImage": premierBackgroundImage,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": List<dynamic>.from(callouts.map((x) => x.toJson())),
      };
}

class Callout {
  String regionName;
  String superRegionName;
  Location location;

  Callout({
    required this.regionName,
    required this.superRegionName,
    required this.location,
  });

  factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: json["superRegionName"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionName,
        "location": location.toJson(),
      };
}

class Location {
  double x;
  double y;

  Location({
    required this.x,
    required this.y,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
