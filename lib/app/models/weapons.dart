class ValorantWeapon {
  String uuid;
  String displayName;
  String category;
  String defaultSkinUuid;
  String displayIcon;
  String killStreamIcon;
  String assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skin>? skins;

  ValorantWeapon({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.defaultSkinUuid,
    required this.displayIcon,
    required this.killStreamIcon,
    required this.assetPath,
    required this.weaponStats,
    required this.shopData,
    this.skins,
  });

  factory ValorantWeapon.fromJson(Map<String, dynamic> json) => ValorantWeapon(
        uuid: json["uuid"],
        displayName: json["displayName"],
        category: json["category"],
        defaultSkinUuid: json["defaultSkinUuid"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        assetPath: json["assetPath"],
        weaponStats: json["weaponStats"] == null
            ? null
            : WeaponStats.fromJson(json["weaponStats"]),
        shopData: json["shopData"] == null
            ? null
            : ShopData.fromJson(json["shopData"]),
        skins: (json['skins'] == null)
            ? null
            : List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
      );
}

class ShopData {
  int cost;
  String category;
  int shopOrderPriority;
  String categoryText;
  GridPosition? gridPosition;
  bool canBeTrashed;
  dynamic image;
  String newImage;
  dynamic newImage2;
  String assetPath;

  ShopData({
    required this.cost,
    required this.category,
    required this.shopOrderPriority,
    required this.categoryText,
    required this.gridPosition,
    required this.canBeTrashed,
    required this.image,
    required this.newImage,
    required this.newImage2,
    required this.assetPath,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
        shopOrderPriority: json["shopOrderPriority"],
        categoryText: json["categoryText"],
        gridPosition: json["gridPosition"] == null
            ? null
            : GridPosition.fromJson(json["gridPosition"]),
        canBeTrashed: json["canBeTrashed"],
        image: json["image"],
        newImage: json["newImage"],
        newImage2: json["newImage2"],
        assetPath: json["assetPath"],
      );
}

class GridPosition {
  int row;
  int column;

  GridPosition({
    required this.row,
    required this.column,
  });

  factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
      };
}

class Skin {
  String uuid;
  String displayName;
  String themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  String? wallpaper;
  String assetPath;
  List<Chroma>? chromas;
  List<Level> levels;

  Skin({
    required this.uuid,
    required this.displayName,
    required this.themeUuid,
    required this.contentTierUuid,
    required this.displayIcon,
    required this.wallpaper,
    required this.assetPath,
    this.chromas,
    required this.levels,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"],
        displayIcon: json["displayIcon"],
        wallpaper: json["wallpaper"],
        assetPath: json["assetPath"],
        chromas: (json['chromas'] == null)
            ? null
            : List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
      );
}

class Chroma {
  String uuid;
  String displayName;
  String? displayIcon;
  String fullRender;
  String? swatch;
  String? streamedVideo;
  String assetPath;

  Chroma({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.fullRender,
    required this.swatch,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );
}

class Level {
  String uuid;
  String displayName;
  LevelItem? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String assetPath;

  Level({
    required this.uuid,
    required this.displayName,
    required this.levelItem,
    required this.displayIcon,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: (json['levelItem'] == null)
            ? null
            : levelItemValues.map[json["levelItem"]]!,
        displayIcon: json["displayIcon"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );
}

enum LevelItem {
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_ATTACKER_DEFENDER_SWAP,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_TRANSFORMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER
}

final levelItemValues = EnumValues({
  "EEquippableSkinLevelItem::Animation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION,
  "EEquippableSkinLevelItem::AttackerDefenderSwap":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_ATTACKER_DEFENDER_SWAP,
  "EEquippableSkinLevelItem::Finisher":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER,
  "EEquippableSkinLevelItem::FishAnimation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION,
  "EEquippableSkinLevelItem::HeartbeatAndMapSensor":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR,
  "EEquippableSkinLevelItem::InspectAndKill":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL,
  "EEquippableSkinLevelItem::KillBanner":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER,
  "EEquippableSkinLevelItem::KillCounter":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER,
  "EEquippableSkinLevelItem::KillEffect":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT,
  "EEquippableSkinLevelItem::Randomizer":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER,
  "EEquippableSkinLevelItem::SoundEffects":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS,
  "EEquippableSkinLevelItem::TopFrag":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG,
  "EEquippableSkinLevelItem::Transformation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_TRANSFORMATION,
  "EEquippableSkinLevelItem::VFX": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX,
  "EEquippableSkinLevelItem::Voiceover":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER
});

class WeaponStats {
  double fireRate;
  int magazineSize;
  double runSpeedMultiplier;
  double equipTimeSeconds;
  double reloadTimeSeconds;
  double firstBulletAccuracy;
  int shotgunPelletCount;
  WallPenetration? wallPenetration;
  String? feature;
  String? fireMode;
  AltFireType? altFireType;
  AdsStats? adsStats;
  AltShotgunStats? altShotgunStats;
  AirBurstStats? airBurstStats;
  List<DamageRange> damageRanges;

  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.runSpeedMultiplier,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.shotgunPelletCount,
    this.wallPenetration,
    required this.feature,
    required this.fireMode,
    required this.altFireType,
    required this.adsStats,
    required this.altShotgunStats,
    required this.airBurstStats,
    required this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic> json) => WeaponStats(
        fireRate: json["fireRate"]?.toDouble(),
        magazineSize: json["magazineSize"],
        runSpeedMultiplier: json["runSpeedMultiplier"]?.toDouble(),
        equipTimeSeconds: json["equipTimeSeconds"]?.toDouble(),
        reloadTimeSeconds: json["reloadTimeSeconds"]?.toDouble(),
        firstBulletAccuracy: json["firstBulletAccuracy"]?.toDouble(),
        shotgunPelletCount: json["shotgunPelletCount"],
        wallPenetration: (json['wallPenetration'] == null)
            ? null
            : wallPenetrationValues.map[json["wallPenetration"]]!,
        feature: json["feature"] ?? '',
        fireMode: json["fireMode"] ?? '',
        altFireType: (json['altFireType'] == null)
            ? null
            : altFireTypeValues.map[json["altFireType"]]!,
        adsStats: json["adsStats"] == null
            ? null
            : AdsStats.fromJson(json["adsStats"]),
        altShotgunStats: json["altShotgunStats"] == null
            ? null
            : AltShotgunStats.fromJson(json["altShotgunStats"]),
        airBurstStats: json["airBurstStats"] == null
            ? null
            : AirBurstStats.fromJson(json["airBurstStats"]),
        damageRanges: List<DamageRange>.from(
            json["damageRanges"].map((x) => DamageRange.fromJson(x))),
      );
}

class AdsStats {
  double zoomMultiplier;
  double fireRate;
  double runSpeedMultiplier;
  int burstCount;
  double firstBulletAccuracy;

  AdsStats({
    required this.zoomMultiplier,
    required this.fireRate,
    required this.runSpeedMultiplier,
    required this.burstCount,
    required this.firstBulletAccuracy,
  });

  factory AdsStats.fromJson(Map<String, dynamic> json) => AdsStats(
        zoomMultiplier: json["zoomMultiplier"]?.toDouble(),
        fireRate: json["fireRate"]?.toDouble(),
        runSpeedMultiplier: json["runSpeedMultiplier"]?.toDouble(),
        burstCount: json["burstCount"],
        firstBulletAccuracy: json["firstBulletAccuracy"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "zoomMultiplier": zoomMultiplier,
        "fireRate": fireRate,
        "runSpeedMultiplier": runSpeedMultiplier,
        "burstCount": burstCount,
        "firstBulletAccuracy": firstBulletAccuracy,
      };
}

class AirBurstStats {
  int shotgunPelletCount;
  double burstDistance;

  AirBurstStats({
    required this.shotgunPelletCount,
    required this.burstDistance,
  });

  factory AirBurstStats.fromJson(Map<String, dynamic> json) => AirBurstStats(
        shotgunPelletCount: json["shotgunPelletCount"],
        burstDistance: json["burstDistance"]?.toDouble(),
      );
}

enum AltFireType {
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS,
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST,
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN
}

final altFireTypeValues = EnumValues({
  "EWeaponAltFireDisplayType::ADS":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS,
  "EWeaponAltFireDisplayType::AirBurst":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST,
  "EWeaponAltFireDisplayType::Shotgun":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN
});

class AltShotgunStats {
  int shotgunPelletCount;
  double burstRate;

  AltShotgunStats({
    required this.shotgunPelletCount,
    required this.burstRate,
  });

  factory AltShotgunStats.fromJson(Map<String, dynamic> json) =>
      AltShotgunStats(
        shotgunPelletCount: json["shotgunPelletCount"],
        burstRate: json["burstRate"]?.toDouble(),
      );
}

class DamageRange {
  int rangeStartMeters;
  int rangeEndMeters;
  double headDamage;
  int bodyDamage;
  double legDamage;

  DamageRange({
    required this.rangeStartMeters,
    required this.rangeEndMeters,
    required this.headDamage,
    required this.bodyDamage,
    required this.legDamage,
  });

  factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        rangeStartMeters: json["rangeStartMeters"],
        rangeEndMeters: json["rangeEndMeters"],
        headDamage: json["headDamage"]?.toDouble(),
        bodyDamage: json["bodyDamage"],
        legDamage: json["legDamage"]?.toDouble(),
      );
}

enum WallPenetration {
  E_WALL_PENETRATION_DISPLAY_TYPE_HIGH,
  E_WALL_PENETRATION_DISPLAY_TYPE_LOW,
  E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM
}

final wallPenetrationValues = EnumValues({
  "EWallPenetrationDisplayType::High":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_HIGH,
  "EWallPenetrationDisplayType::Low":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_LOW,
  "EWallPenetrationDisplayType::Medium":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
