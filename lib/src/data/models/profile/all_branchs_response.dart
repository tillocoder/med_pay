class AllBranchsResponse {

  AllBranchsResponse({this.branches, this.count});

  AllBranchsResponse.fromJson(Map<String, dynamic> json) {
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
    count = json['count'];
  }
  List<Branches>? branches;
  String? count;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Branches {

  Branches(
      {this.id,
        this.shipperId,
        this.name,
        this.image,
        this.phone,
        this.isActive,
        this.address,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.destination,
        this.workHourStart,
        this.workHourEnd,
        this.jowiId,
        this.iikoId,
        this.iikoTerminalId,
        this.fareId,
        this.tgChatId,
        this.ordersLimit,
        this.radiusWithoutDeliveryPrice,
        this.realTimeOrdersAmount,
        this.menuId,
        this.crm,
        this.iikoHallTerminalId});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shipperId = json['shipper_id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    isActive = json['is_active'];
    address = json['address'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    destination = json['destination'];
    workHourStart = json['work_hour_start'];
    workHourEnd = json['work_hour_end'];
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
    iikoTerminalId = json['iiko_terminal_id'];
    fareId = json['fare_id'];
    tgChatId = json['tg_chat_id'];
    ordersLimit = json['orders_limit'];
    radiusWithoutDeliveryPrice = json['radius_without_delivery_price'];
    realTimeOrdersAmount = json['real_time_orders_amount'];
    menuId = json['menu_id'];
    crm = json['crm'];
    iikoHallTerminalId = json['iiko_hall_terminal_id'];
  }
  String? id;
  String? shipperId;
  String? name;
  String? image;
  String? phone;
  bool? isActive;
  String? address;
  Location? location;
  String? createdAt;
  String? updatedAt;
  String? destination;
  String? workHourStart;
  String? workHourEnd;
  String? jowiId;
  String? iikoId;
  String? iikoTerminalId;
  String? fareId;
  String? tgChatId;
  String? ordersLimit;
  int? radiusWithoutDeliveryPrice;
  int? realTimeOrdersAmount;
  String? menuId;
  String? crm;
  String? iikoHallTerminalId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipper_id'] = shipperId;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['address'] = address;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['destination'] = destination;
    data['work_hour_start'] = workHourStart;
    data['work_hour_end'] = workHourEnd;
    data['jowi_id'] = jowiId;
    data['iiko_id'] = iikoId;
    data['iiko_terminal_id'] = iikoTerminalId;
    data['fare_id'] = fareId;
    data['tg_chat_id'] = tgChatId;
    data['orders_limit'] = ordersLimit;
    data['radius_without_delivery_price'] = radiusWithoutDeliveryPrice;
    data['real_time_orders_amount'] = realTimeOrdersAmount;
    data['menu_id'] = menuId;
    data['crm'] = crm;
    data['iiko_hall_terminal_id'] = iikoHallTerminalId;
    return data;
  }
}

class Location {

  Location({this.long, this.lat});

  Location.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }
  double? long;
  double? lat;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    data['lat'] = lat;
    return data;
  }
}
