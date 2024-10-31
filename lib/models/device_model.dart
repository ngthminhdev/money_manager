class DeviceModel {
  final String? securityPatch;
  final int? sdkInt;
  final String? release;
  final String? brand;
  final String? model;
  final String? device;
  final String? systemName;
  final String? systemVersion;
  final String? name;
  final String? identifierForVendor;

  DeviceModel({
    this.securityPatch,
    this.sdkInt,
    this.release,
    this.brand,
    this.model,
    this.device,
    this.systemName,
    this.systemVersion,
    this.name,
    this.identifierForVendor,
  });

  factory DeviceModel.fromAndroid(androidInfo) => DeviceModel(
        securityPatch: androidInfo.version.securityPatch,
        sdkInt: androidInfo.version.sdkInt,
        release: androidInfo.version.release,
        brand: androidInfo.brand,
        model: androidInfo.model,
        device: androidInfo.device,
      );

  factory DeviceModel.fromIOS(iosInfo) => DeviceModel(
        systemName: iosInfo.systemName,
        systemVersion: iosInfo.systemVersion,
        model: iosInfo.model,
        name: iosInfo.name,
        identifierForVendor: iosInfo.identifierForVendor,
      );

  @override
  String toString() {
    return 'DeviceModel(securityPatch: $securityPatch, sdkInt: $sdkInt, release: $release, brand: $brand, model: $model, device: $device, systemName: $systemName, systemVersion: $systemVersion, name: $name, identifierForVendor: $identifierForVendor)';
  }
}