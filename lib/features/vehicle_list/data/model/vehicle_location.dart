class VehicleLocation {
    double lng;
    double lat;

    VehicleLocation({
        required this.lng,
        required this.lat,
    });

    factory VehicleLocation.fromJson(Map<String, dynamic> json) => VehicleLocation(
        lng: json["lng"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
    };
}