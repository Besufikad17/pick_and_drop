class Place {
  String? id;
  String? country;
  String? city;
  String? zone;
  String? street;
  String? title;
  String? lat;
  String? lng;
   
  Place({
    this.id,
    this.country,
    this.city,
    this.zone,
    this.street,
    this.title,
    this.lat,
    this.lng
  });

  factory Place.fromJSON(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      country: json['country'],
      city: json['city'],
      zone: json['zone'],
      street: json['street'],
      title: json['title'],
      lat: json['lat'],
      lng: json['lng']
    );
  }
}